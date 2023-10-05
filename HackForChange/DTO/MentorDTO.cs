using System.ComponentModel.DataAnnotations;

namespace HackForChange.DTO;

public record CreateMentorDTO
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public string Name { get; set; }

    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public string Email { get; set; }
}

public record GetMentorDTO
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
    public string DateCreation { get; set; }
    public List<GetSubjectDTO> Specialties { get; set; }
}

public record UpdateMentorDTO
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public Guid Id { get; set; }

    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public string Email { get; set; }
}