namespace HackForChange.Domain.Entities;

public class Mentor : BaseEntity
{
    public Mentor(string name, string email)
    {
        Name = name;
        Email = email;
        Specialties = new HashSet<Subject>();
    }

    public string Name { get; private set; }
    public string Email { get; private set; }

    public virtual ICollection<Subject> Specialties { get; set; }

    public void Update(string email)
    {
        Email = email;
    }
}