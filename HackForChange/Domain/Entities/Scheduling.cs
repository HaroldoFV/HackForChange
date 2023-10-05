namespace HackForChange.Domain.Entities;

public class Scheduling : BaseEntity
{
    public Scheduling(DateTime appointmentTimes, Guid subjectId)
    {
        AppointmentTimes = appointmentTimes;
        SubjectId = subjectId;
    }

    public DateTime AppointmentTimes { get; private set; }
    public DateTime? StartTime { get; private set; }
    public DateTime? ClosingTime { get; private set; }
    public Guid SubjectId { get; private set; }

    public virtual Subject Subject { get; set; }

    public void Start(DateTime? startTime)
    {
        StartTime = startTime;
    }

    public void End()
    {
        ClosingTime = DateTime.UtcNow;
        StartTime = AppointmentTimes;
    }
}