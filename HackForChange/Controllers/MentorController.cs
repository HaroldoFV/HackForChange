using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using HackForChange.DTO;
using Microsoft.AspNetCore.Mvc;

namespace HackForChange.Controllers;

[ApiController]
[Route("api/mentors")]
public class MentorController : ControllerBase
{
    private readonly IMentorRepository _mentorRepository;

    public MentorController(IMentorRepository mentorRepository)
    {
        _mentorRepository = mentorRepository;
    }


    [HttpGet]
    public async Task<IActionResult> GetAllPaged([FromRoute] int page = 0, int pageSize = 10)
    {
        var query = await _mentorRepository.GetAllPaged(page, pageSize);

        if (query == null)
            return NotFound("Estudante(s) não encontrado");

        List<GetMentorDTO> resultList = new List<GetMentorDTO>();

        foreach (var item in query)
        {
            GetMentorDTO result = new GetMentorDTO
            {
                Id = item.Id,
                Name = item.Name,
                Email = item.Email,
                DateCreation = item.Created.ToString("dd/MM/yyyy HH:mm:ss")
            };
            resultList.Add(result);
        }

        return Ok(resultList);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(Guid id)
    {
        var query = await _mentorRepository.GetById(id);
        if (query == null)
            return NotFound("Mentor não encontrado");

        GetMentorDTO result = new GetMentorDTO
        {
            Id = query.Id,
            Name = query.Name,
            Email = query.Email,
            DateCreation = query.Created.ToString("dd/MM/yyyy HH:mm:ss"),
            Specialties = new List<GetSubjectDTO>()
        };

        foreach (var item in query.Specialties)
        {
            result.Specialties.Add(new GetSubjectDTO()
            {
                Id = item.Id,
                Description = item.Description,
                DateCreation = item.Created.ToString("dd/MM/yyyy HH:mm:ss")
            });
        }

        return Ok(result);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateMentorDTO dto)
    {
        try
        {
            var mentor = new Mentor(dto.Name, dto.Email);
            await _mentorRepository.Create(mentor);

            return StatusCode(201);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(Guid id, [FromBody] UpdateMentorDTO dto)
    {
        try
        {
            if (id != dto.Id)
                return BadRequest("id inválido/diferente do enviado no body da requisição.");

            var mentor = await _mentorRepository.GetById(id);
            if (mentor == null)
                return NotFound("Mentor não encontrado");

            mentor.Update(dto.Email);
            await _mentorRepository.Update(mentor);

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(Guid id)
    {
        try
        {
            var mentor = await _mentorRepository.GetById(id);
            if (mentor == null)
                return NotFound("Mentor não encontrado");

            await _mentorRepository.Delete(mentor);

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
}