namespace Contacts.Contracts.Managers.Builders
{
    #region Usings
    using Contacts.Contracts.BusinessObjects.DTO;
    using Dapper;
    #endregion

    #region ISqlParameters
    public interface ISqlParameters
    {
        /// <summary>
        /// Gets DynamicParameters for logging.
        /// </summary>
        /// <param name="logLevel"></param>
        /// <param name="message"></param>
        /// <param name="exception"></param>
        /// <exception cref="Exception"/>
        /// <returns><see cref="DynamicParameters"/></returns>
        DynamicParameters GetLogParameters(string logLevel, string? message, Exception? exception, string categoryName);
        /// <summary>
        /// Gets DynamicParameters from <see cref="IContact"/> to save them to the database.
        /// </summary>
        /// <param name="contact">
        /// <example>
        /// <code>
        /// {
        ///     "id": "<see cref="Guid"/>",
        ///     "firstName": "<see cref="string"/>",
        ///     "lastName": "<see cref="string"/>",
        ///     "cellNumber": "<see cref="string"/>"
        /// }
        /// </code>
        /// </example>
        /// </param>
        /// <param name="isEdit"></param>
        /// <exception cref="Exception"/>
        /// <returns><see cref="DynamicParameters"/></returns>
        DynamicParameters GetContactParameters(IContact contact, bool isEdit = true);
    }
    #endregion
}