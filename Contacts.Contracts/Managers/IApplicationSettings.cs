namespace Contacts.Contracts.Managers
{
    #region Interface of IApplicationSettings
    public interface IApplicationSettings
    {
        string MsSqlConnectionString { get; }
        long? MaxBodySize { get; }
        int? Port { get; }
    }
    #endregion
}