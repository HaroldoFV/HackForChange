using HackForChange.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace HackForChange.Data.Contexts;

public class HackForChangeContext : DbContext
{
    public HackForChangeContext(DbContextOptions<HackForChangeContext> options) : base(options)
    {
    }

    #region DBSets

    public DbSet<Student> Students { get; set; }
    public DbSet<Subject> Subjects { get; set; }
    public DbSet<Scheduling> Schedulings { get; set; }
    public DbSet<Mentor> Mentors { get; set; }

    #endregion

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
        optionsBuilder.LogTo(Console.WriteLine, LogLevel.Information);
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        foreach (var relationship in modelBuilder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()))
        {
            relationship.DeleteBehavior = DeleteBehavior.ClientSetNull;
        }

        base.OnModelCreating(modelBuilder);
        // modelBuilder.ApplyConfigurationsFromAssembly(typeof(HackForChangeContext).Assembly);
    }
}