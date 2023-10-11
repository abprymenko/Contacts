namespace Contacts.Contracts.Providing
{
    public interface IRepository : IDisposable
    {
        Task<int> ExecuteAsync(string sql, object param);
        Task<IEnumerable<T>?> QueryAsync<T>(string sql, object? param = null);
    }
}
