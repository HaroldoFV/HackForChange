using System.ComponentModel.DataAnnotations;

namespace HackForChange.DTO;

public record CreateSubjectDTO
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public string Description { get; set; }
}

public record GetSubjectDTO
{
    public Guid Id { get; set; }
    public string Description { get; set; }
    public string DateCreation { get; set; }
}

public record UpdateSubjectDTO
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public Guid Id { get; set; }

    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public string Description { get; set; }
}

public record AssociateStudent
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public Guid StudentId { get; set; }

    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public List<Guid> SubjectIds { get; set; }
}

public record AssociateMentor
{
    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public Guid MentorId { get; set; }

    [Required(ErrorMessage = "Campo {0} é obrigatório.")]
    public List<Guid> SubjectIds { get; set; }
}