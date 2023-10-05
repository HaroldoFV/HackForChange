using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using HackForChange.DTO;
using Microsoft.AspNetCore.Mvc;

namespace HackForChange.Controllers;

[ApiController]
[Route("api/students")]
public class StudentController : ControllerBase
{
    private readonly IStudentRepository _studentRepository;

    public StudentController(IStudentRepository studentRepository)
    {
        _studentRepository = studentRepository;
    }

    [HttpGet]
    public async Task<IActionResult> GetAllPaged([FromRoute] int page = 0, int pageSize = 10)
    {
        var query = await _studentRepository.GetAllPaged(page, pageSize);

        if (query == null)
            return NotFound("Estudante(s) não encontrado");

        List<GetStudentDTO> resultList = new List<GetStudentDTO>();

        foreach (var item in query)
        {
            GetStudentDTO result = new GetStudentDTO
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
        var query = await _studentRepository.GetById(id);
        if (query == null)
            return NotFound("Estudante não encontrado");

        GetStudentDTO result = new GetStudentDTO
        {
            Id = query.Id,
            Name = query.Name,
            Email = query.Email,
            DateCreation = query.Created.ToString("dd/MM/yyyy HH:mm:ss"),
            DifficultSubjects = new List<GetSubjectDTO>()
        };

        foreach (var item in query.DifficultSubjects)
        {
            result.DifficultSubjects.Add(new GetSubjectDTO()
            {
                Id = item.Id,
                Description = item.Description,
                DateCreation = item.Created.ToString("dd/MM/yyyy HH:mm:ss")
            });
        }

        return Ok(result);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateStudentDTO dto)
    {
        try
        {
            var student = new Student(dto.Name, dto.Email);
            await _studentRepository.Create(student);

            return StatusCode(201);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(Guid id, [FromBody] UpdateStudentDTO dto)
    {
        try
        {
            if (id != dto.Id)
                return BadRequest("id inválido/diferente do enviado no body da requisição.");

            var student = await _studentRepository.GetById(id);
            if (student == null)
                return NotFound("Estudante não encontrado");

            student.Update(dto.Email);
            await _studentRepository.Update(student);

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
            var student = await _studentRepository.GetById(id);
            if (student == null)
                return NotFound("Estudante não encontrado");

            await _studentRepository.Delete(student);

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
}