namespace Contacts.Contracts.Services
{
    #region Usings
    using Microsoft.Extensions.Configuration;
    #endregion

    #region JsonSettings
    public interface IJsonSettings
    {
        IConfiguration? Configuration { get; }
        string? GetString(string name);
        int? GetInt(string key);
        long? GetLong(string key);
    }
    #endregion
}