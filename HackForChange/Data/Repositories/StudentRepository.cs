using HackForChange.Data.Contexts;
using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HackForChange.Data.Repositories;

public class StudentRepository : IStudentRepository
{
    private readonly HackForChangeContext _hackForChangeContext;

    public StudentRepository(HackForChangeContext hackForChangeContext)
    {
        _hackForChangeContext = hackForChangeContext;
    }

    public async Task<List<Student>> GetAllPaged(int page, int pageSize)
    {
        var query = _hackForChangeContext
            .Students
            .AsNoTracking()
            .OrderByDescending(x => x.Created);

        return await query
            .Skip(page * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task Create(Student student)
    {
        await _hackForChangeContext.Students.AddAsync(student);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task Update(Student student)
    {
        _hackForChangeContext.Students.Update(student);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task Delete(Student student)
    {
        _hackForChangeContext.Students.Remove(student);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task<Student> GetById(Guid id)
    {
        var query = await _hackForChangeContext
            .Students
            .Include(x => x.DifficultSubjects)
            .FirstOrDefaultAsync(x => x.Id == id);

        return query;
    }

    public async Task AssociateStudent(Student student)
    {
        _hackForChangeContext.Students.Update(student);
        await _hackForChangeContext.SaveChangesAsync();
    }
}