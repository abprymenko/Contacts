namespace Contacts.Contracts.Providing
{
    #region IRepository
    public interface IRepository : IDisposable
    {
        Task<int> ExecuteAsync(string sql, object param);
        Task<IEnumerable<T>?> QueryAsync<T>(string sql, object? param = null);
    }
    #endregion
}