using HackForChange.Data.Contexts;
using HackForChange.Domain.Entities;
using HackForChange.Domain.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace HackForChange.Data.Repositories;

public class SchedulingRepository : ISchedulingRepository
{
    private readonly HackForChangeContext _hackForChangeContext;

    public SchedulingRepository(HackForChangeContext hackForChangeContext)
    {
        _hackForChangeContext = hackForChangeContext;
    }

    public async Task<List<Scheduling>> GetAllPaged(int page, int pageSize)
    {
        var query = _hackForChangeContext
            .Schedulings
            .Include(x => x.Subject)
            .AsNoTracking()
            .OrderByDescending(x => x.Created);

        return await query
            .Skip(page * pageSize)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task Create(Scheduling scheduling)
    {
        await _hackForChangeContext.Schedulings.AddAsync(scheduling);
        await _hackForChangeContext.SaveChangesAsync();
    }

    public async Task<Scheduling> GetById(Guid id)
    {
        var query = await _hackForChangeContext
            .Schedulings
            .Include(x => x.Subject)
            .FirstOrDefaultAsync(x => x.Id == id);

        return query;
    }

    public async Task End(Scheduling scheduling)
    {
        _hackForChangeContext.Schedulings.Update(scheduling);
        await _hackForChangeContext.SaveChangesAsync();
    }
}