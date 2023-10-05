namespace HackForChange.Domain.Entities;

public abstract class BaseEntity
{
    protected BaseEntity()
    {
        Id = Guid.NewGuid();
        Created = DateTime.UtcNow;
        Updated = DateTime.UtcNow;
    }

    public Guid Id { get; set; }

    public DateTime Created { get; private set; }
    public DateTime Updated { get; private set; }
}