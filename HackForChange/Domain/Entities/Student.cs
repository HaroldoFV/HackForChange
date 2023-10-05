namespace HackForChange.Domain.Entities;

public class Student : BaseEntity
{
    public Student(string name, string email)
    {
        Name = name;
        Email = email;
        DifficultSubjects = new HashSet<Subject>();
    }

    public string Name { get; private set; }
    public string Email { get; private set; }

    public virtual ICollection<Subject> DifficultSubjects { get; private set; }

    public void Update(string email)
    {
        Email = email;
    }
}