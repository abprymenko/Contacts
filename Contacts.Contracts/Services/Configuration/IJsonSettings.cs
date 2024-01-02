namespace Contacts.Contracts.Services.Configuration
{
    #region Usings
    using Microsoft.Extensions.Configuration;
    #endregion

    #region IJsonSettings
    public interface IJsonSettings
    {
        IConfiguration? Configuration { get; }
        string? GetString(string name);
        int? GetInt(string key);
        long? GetLong(string key);
    }
    #endregion
}