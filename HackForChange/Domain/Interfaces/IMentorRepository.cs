using HackForChange.Domain.Entities;

namespace HackForChange.Domain.Interfaces;

public interface IMentorRepository
{
    Task<List<Mentor>> GetAllPaged(int page, int pageSize);
    Task Create(Mentor student);
    Task Update(Mentor student);
    Task Delete(Mentor student);
    Task<Mentor> GetById(Guid id);
    Task AssociateMentor(Mentor mentor);
}