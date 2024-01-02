namespace Contacts.Contracts.Services.Repositories
{
    #region IRepository
    public interface IRepository : IDisposable
    {
        /// <summary>
        /// Insert, delete, update - execute.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="param"></param>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="Exception"/>
        /// <returns>Scalar value.</returns>
        Task<int> ExecuteAsync(string sql, object param);
        /// <summary>
        /// Select - query.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="sql"></param>
        /// <param name="param"></param>
        /// <exception cref="ArgumentNullException"/>
        /// <exception cref="Exception"/>
        /// <returns></returns>
        Task<IEnumerable<T>> QueryAsync<T>(string sql, object? param = null);
    }
    #endregion
}