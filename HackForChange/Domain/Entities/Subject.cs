namespace HackForChange.Domain.Entities;

public class Subject : BaseEntity
{
    public Subject(string description)
    {
        Description = description;
    }

    public string Description { get; private set; }

    public virtual ICollection<Mentor> Mentors { get; set; }
    public virtual ICollection<Student> Students { get; private set; }

    public virtual ICollection<Scheduling> Schedulings { get; set; }
    
    public void Update(string description)
    {
        Description = description;
    }
}