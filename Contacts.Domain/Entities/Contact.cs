namespace Contacts.Domain.Entities
{
    #region Usings
    using Contacts.Domain.Base;
    #endregion
    public class Contact : Entity
    {
        public string? FirstName{ get; set; } 
        public string? LastName{ get; set; } 
        public string? CellNumber{ get; set; } 
    }
}