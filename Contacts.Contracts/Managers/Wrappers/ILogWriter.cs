namespace Contacts.Contracts.Managers.Wrappers
{
    #region Usings
    using Microsoft.Extensions.Logging;
    #endregion

    #region ILogWriter
    public interface ILogWriter
    {
        Task Write(LogLevel logLevel, 
                   string? message, 
                   string categoryName, 
                   Exception? exception = null);
    }
    #endregion
}