namespace Contacts.Contracts.Domain
{
    public interface IEntity<out TPk>
    {
        TPk Id { get; }
    }
}