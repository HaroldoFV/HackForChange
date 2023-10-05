using HackForChange.Domain.Entities;

namespace HackForChange.Domain.Interfaces;

public interface ISchedulingRepository
{
    Task<List<Scheduling>> GetAllPaged(int page, int pageSize);
    Task Create(Scheduling scheduling);

    Task<Scheduling> GetById(Guid id);
    Task End(Scheduling scheduling);
}