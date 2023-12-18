namespace Contacts.Contracts.BusinessObjects.DTO
{
    #region IContact
    public interface IContact
    {
        Guid Id { get; set; }
        string? FirstName { get; set; }
        string? LastName { get; set; }
        string? CellNumber { get; set; }
        string? Email {  get; set; }
    }
    #endregion
}