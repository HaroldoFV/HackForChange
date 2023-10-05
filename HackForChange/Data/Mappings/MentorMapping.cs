using HackForChange.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace HackForChange.Data.Mappings;

public class MentorMapping : IEntityTypeConfiguration<Mentor>
{
    public void Configure(EntityTypeBuilder<Mentor> builder)
    {
        builder.ToTable("Mentors");

        builder.HasKey(p => p.Id);
        builder.Property(c => c.Name).IsRequired();
        builder.Property(c => c.Email).IsRequired();

        builder.HasMany(x => x.Specialties)
            .WithMany(x => x.Mentors);
    }
}