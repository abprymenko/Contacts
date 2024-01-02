namespace Contacts.Contracts.Managers.Settings
{
    #region IApplicationSettings
    public interface IApplicationSettings
    {
        string? MsSqlConnectionString { get; }
        long? MaxBodySize { get; }
        int? Port { get; }
    }
    #endregion
}