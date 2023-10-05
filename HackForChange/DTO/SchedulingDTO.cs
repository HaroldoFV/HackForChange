using System.ComponentModel.DataAnnotations;

namespace HackForChange.DTO;

public record CreateSchedulingDTO
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public DateTime AppointmentTimes { get; set; }

    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public Guid SubjectId { get; set; }
}

public record GetSchedulingDTO
{
    public Guid Id { get; set; }
    public DateTime AppointmentTimes { get; set; }
    public string StartTime { get; set; }
    public string ClosingTime { get; set; }
    public string DateCreation { get; set; }
    public GetSubjectDTO Subject { get; set; }
}

public record EndSchedulingDTO
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public Guid Id { get; set; }
}