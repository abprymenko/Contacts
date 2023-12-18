namespace Contacts.BusinessObjects.DTO
{
    #region Usings
    using Contacts.Contracts.BusinessObjects.DTO;
    using System;
    #endregion

    #region Contact
    internal class Contact : IContact
    {
        public Guid Id { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? CellNumber { get; set; }
        public string? Email { get; set; }
    }
    #endregion
}