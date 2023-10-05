using HackForChange.Data.Contexts;
using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HackForChange.Data.Repositories;

public class MentorRepository : IMentorRepository
{
    private readonly HackForChangeContext _hackForChangeContext;

    public MentorRepository(HackForChangeContext hackForChangeContext)
    {
        _hackForChangeContext = hackForChangeContext;
    }

    public async Task<List<Mentor>> GetAllPaged(int page, int pageSize)
    {
        var query = _hackForChangeContext
            .Mentors
            .AsNoTracking()
            .OrderByDescending(x => x.Created);

        return await query
            .Skip(page * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task Create(Mentor mentor)
    {
        await _hackForChangeContext.Mentors.AddAsync(mentor);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task Update(Mentor mentor)
    {
        _hackForChangeContext.Mentors.Update(mentor);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task Delete(Mentor mentor)
    {
        _hackForChangeContext.Mentors.Remove(mentor);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task<Mentor> GetById(Guid id)
    {
        var query = await _hackForChangeContext
            .Mentors
            .Include(x => x.Specialties)
            .FirstOrDefaultAsync(x => x.Id == id);

        return query;
    }

    public async Task AssociateMentor(Mentor mentor)
    {
        _hackForChangeContext.Mentors.Update(mentor);
        await _hackForChangeContext.SaveChangesAsync();
    }
}