using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using HackForChange.DTO;
using Microsoft.AspNetCore.Mvc;

namespace HackForChange.Controllers;

[ApiController]
[Route("api/schedulings")]
public class SchedulingController : ControllerBase
{
    private readonly ISchedulingRepository _schedulingRepository;

    public SchedulingController(ISchedulingRepository schedulingRepository)
    {
        _schedulingRepository = schedulingRepository;
    }


    [HttpGet]
    public async Task<IActionResult> GetAllPaged([FromRoute] int page = 0, int pageSize = 10)
    {
        var query = await _schedulingRepository.GetAllPaged(page, pageSize);

        if (query == null)
            return NotFound("Agendamento(s) não encontrado.");

        List<GetSchedulingDTO> resultList = new List<GetSchedulingDTO>();

        foreach (var item in query)
        {
            GetSchedulingDTO result = new GetSchedulingDTO
            {
                Id = item.Id,
                AppointmentTimes = item.AppointmentTimes,
                StartTime = item.StartTime?.ToString("dd/MM/yyyy HH:mm:ss"),
                ClosingTime = item.ClosingTime?.ToString("dd/MM/yyyy HH:mm:ss"),
                DateCreation = item.Created.ToString("dd/MM/yyyy HH:mm:ss"),
                Subject = new GetSubjectDTO()
                {
                    Id = item.Subject.Id,
                    Description = item.Subject.Description,
                    DateCreation = item.Subject.Created.ToString("dd/MM/yyyy HH:mm:ss")
                }
            };
            resultList.Add(result);
        }

        return Ok(resultList);
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetById(Guid id)
    {
        var query = await _schedulingRepository.GetById(id);
        if (query == null)
            return NotFound("Agendamento não encontrado");


        GetSchedulingDTO result = new GetSchedulingDTO
        {
            Id = query.Id,
            AppointmentTimes = query.AppointmentTimes,
            StartTime = query.StartTime?.ToString("dd/MM/yyyy HH:mm:ss"),
            ClosingTime = query.ClosingTime?.ToString("dd/MM/yyyy HH:mm:ss"),
            DateCreation = query.Created.ToString("dd/MM/yyyy HH:mm:ss"),
            Subject = new GetSubjectDTO()
            {
                Id = query.Subject.Id,
                Description = query.Subject.Description,
                DateCreation = query.Subject.Created.ToString("dd/MM/yyyy HH:mm:ss")
            }
        };

        return Ok(result);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CreateSchedulingDTO dto)
    {
        try
        {
            var scheduling = new Scheduling(dto.AppointmentTimes, dto.SubjectId);
            await _schedulingRepository.Create(scheduling);

            return StatusCode(201);
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }

    [HttpPost("end")]
    public async Task<IActionResult> End([FromBody] EndSchedulingDTO dto)
    {
        try
        {
            var scheduling = await _schedulingRepository.GetById(dto.Id);
            if (scheduling == null)
                return NotFound("Agendamento não encontrado");

            scheduling.End();
            await _schedulingRepository.End(scheduling);

            return Ok();
        }
        catch (Exception e)
        {
            return BadRequest(e.Message);
        }
    }
}