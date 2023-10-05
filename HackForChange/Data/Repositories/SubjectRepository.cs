using HackForChange.Data.Contexts;
using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HackForChange.Data.Repositories;

public class SubjectRepository : ISubjectRepository
{
    private readonly HackForChangeContext _hackForChangeContext;

    public SubjectRepository(HackForChangeContext hackForChangeContext)
    {
        _hackForChangeContext = hackForChangeContext;
    }


    public async Task<List<Subject>> GetAllPaged(int page, int pageSize)
    {
        var query = _hackForChangeContext
            .Subjects
            .AsNoTracking()
            .OrderByDescending(x => x.Created);

        return await query
            .Skip(page * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task Create(Subject subject)
    {
        await _hackForChangeContext.Subjects.AddAsync(subject);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task Update(Subject subject)
    {
        _hackForChangeContext.Subjects.Update(subject);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task Delete(Subject subject)
    {
        _hackForChangeContext.Subjects.Remove(subject);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task<Subject> GetById(Guid id)
    {
        var query = await _hackForChangeContext
            .Subjects
            .FirstOrDefaultAsync(x => x.Id == id);

        return query;
    }


    public async Task<List<Subject>> GetSubjectsByIds(List<Guid> ids)
    {
        var query = await _hackForChangeContext
            .Subjects
            .Where(x => ids.Contains(x.Id))
            .ToListAsync();

        return query;
    }
}