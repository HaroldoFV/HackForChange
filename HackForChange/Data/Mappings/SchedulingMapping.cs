using HackForChange.Domain.Entities;
using Microsoft.AspNetCore.SignalR.Protocol;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace HackForChange.Data.Mappings;

public class SchedulingMapping : IEntityTypeConfiguration<Scheduling>
{
    public void Configure(EntityTypeBuilder<Scheduling> builder)
    {
        builder.ToTable("Schedulings");

        builder.HasKey(x => x.Id);
        builder.Property(x => x.AppointmentTimes)
            .IsRequired();
        builder.Property(x => x.StartTime)
            .IsRequired();
        builder.Property(x => x.ClosingTime)
            .IsRequired();
        builder.Property(c => c.SubjectId)
            .IsRequired();
    }
}