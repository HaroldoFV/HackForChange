using HackForChange.Domain.Entities;

namespace HackForChange.Domain.Interfaces;

public interface ISubjectRepository
{
    Task<List<Subject>> GetAllPaged(int page, int pageSize);
    Task Create(Subject student);
    Task Update(Subject student);
    Task Delete(Subject student);
    Task<Subject> GetById(Guid id);
    Task<List<Subject>> GetSubjectsByIds(List<Guid> ids);
}