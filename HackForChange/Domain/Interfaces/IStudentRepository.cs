using HackForChange.Domain.Entities;

namespace HackForChange.Domain.Interfaces;

public interface IStudentRepository
{
    Task<List<Student>> GetAllPaged(int page, int pageSize);
    Task Create(Student student);
    Task Update(Student student);
    Task Delete(Student student);
    Task<Student> GetById(Guid id);
    Task AssociateStudent(Student student);
}