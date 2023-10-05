using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using HackForChange.DTO;
using Microsoft.AspNetCore.Mvc;

namespace HackForChange.Controllers;

[ApiController]
[Route("api/subjects")]
public class SubjectController : ControllerBase
{
    private readonly ISubjectRepository _subjectRepository;
    private readonly IStudentRepository _studentRepository;
    private readonly IMentorRepository _mentorRepository;

    public SubjectController(ISubjectRepository subjectRepository,
        IStudentRepository studentRepository,
        IMentorRepository mentorRepository)
    {
        _subjectRepository = subjectRepository;
        _studentRepository = studentRepository;
        _mentorRepository = mentorRepository;
    }


    #region methods CRUD

    [HttpGet]
    public async Task<IActionResult> GetAllPaged([FromRoute] int page = 0, int pageSize = 10)
    {
        var query = await _subjectRepository.GetAllPaged(page, pageSize);

        if (query == null)
            return NotFound("Assunto(s)/Matéria(s) não encontrado(s).");

        List<GetSubjectDTO> resultList = new List<GetSubjectDTO>();

        foreach (var item in query)
        {
            GetSubjectDTO result = new GetSubjectDTO
            {
                Id = item.Id,
                Description = item.Description,
                DateCreation = item.Created.ToString("dd/MM/yyyy HH:mm:ss")
            };
            resultList.Add(result);
        }

        return Ok(resultList);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(Guid id)
    {
        var query = await _subjectRepository.GetById(id);
        if (query == null)
            return NotFound("Assunto/Matéria não encontrado.");

        GetSubjectDTO result = new
            GetSubjectDTO
            {
                Id = query.Id,
                Description = query.Description,
                DateCreation = query.Created.ToString("dd/MM/yyyy HH:mm:ss")
            };

        return Ok(result);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateSubjectDTO dto)
    {
        try
        {
            var subject = new Subject(dto.Description);
            await _subjectRepository.Create(subject);

            return StatusCode(201);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(Guid id, [FromBody] UpdateSubjectDTO dto)
    {
        try
        {
            if (id != dto.Id)
                return BadRequest("id inválido/diferente do enviado no body da requisição.");

            var subject = await _subjectRepository.GetById(id);
            if (subject == null)
                return NotFound("Assunto/matéria não encontrado");

            subject.Update(dto.Description);
            await _subjectRepository.Update(subject);

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
            var subject = await _subjectRepository.GetById(id);
            if (subject == null)
                return NotFound("Assunto/matéria não encontrado");

            await _subjectRepository.Delete(subject);

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    #endregion


    #region features

    [HttpPost("associate-student")]
    public async Task<IActionResult> AssociateStudent([FromBody] AssociateStudent dto)
    {
        try
        {
            var student = await _studentRepository.GetById(dto.StudentId);

            if (student == null)
                return NotFound("Estudante não encontrado");

            var subjects = await _subjectRepository.GetSubjectsByIds(dto.SubjectIds);

            if (subjects == null || subjects.Count == 0)
                return NotFound("Assunto/matéria não encontrado");

            foreach (var subject in subjects)
                student.DifficultSubjects.Add(subject);

            await _studentRepository.AssociateStudent(student);

            return StatusCode(201);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }


    [HttpPost("associate-mentor")]
    public async Task<IActionResult> AssociateMentor([FromBody] AssociateMentor dto)
    {
        try
        {
            var mentor = await _mentorRepository.GetById(dto.MentorId);

            if (mentor == null)
                return NotFound("mentor não encontrado");

            var subjects = await _subjectRepository.GetSubjectsByIds(dto.SubjectIds);

            if (subjects == null || subjects.Count == 0)
                return NotFound("Especialidade(s) não encontrada");

            foreach (var subject in subjects)
            {
                mentor.Specialties.Add(subject);
            }

            await _mentorRepository.AssociateMentor(mentor);

            return StatusCode(201);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    #endregion
}