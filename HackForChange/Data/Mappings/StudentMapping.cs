using HackForChange.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace HackForChange.Data.Mappings;

public class StudentMapping : IEntityTypeConfiguration<Student>
{
    public void Configure(EntityTypeBuilder<Student> builder)
    {
        builder.ToTable("Students");

        builder.HasKey(p => p.Id);
        builder.Property(c => c.Name).IsRequired();
        builder.Property(c => c.Email).IsRequired();

        builder.HasMany(x => x.DifficultSubjects)
            .WithMany(x => x.Students);
    }
}