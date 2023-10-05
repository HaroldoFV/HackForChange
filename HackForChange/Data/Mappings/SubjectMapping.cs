using HackForChange.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace HackForChange.Data.Mappings;

public class SubjectMapping : IEntityTypeConfiguration<Subject>
{
    public void Configure(EntityTypeBuilder<Subject> builder)
    {
        builder.ToTable("Subjects");

        builder.HasKey(p => p.Id);
        builder.Property(c => c.Description).IsRequired();
        
        builder.HasMany(x => x.Schedulings)
            .WithOne(x => x.Subject);
    }
}