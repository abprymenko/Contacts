namespace Contacts.Contracts.BusinessObjects.DTO
{
    public interface IContact
    {
        Guid Id { get; set; }
        string? FirstName { get; set; }
        string? LastName { get; set; }
        string? CellNumber { get; set; }
    }
}