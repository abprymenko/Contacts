namespace Contacts.Domain.Base
{
    #region Usings
    using Contacts.Contracts.Domain;
    #endregion
    public class Entity : IEntity<Guid>
    {
        public Guid Id { get; set; }
    }
}