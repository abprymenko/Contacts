namespace Contacts.Contracts.DBContext
{
    #region Usings
    using Microsoft.EntityFrameworkCore.ChangeTracking;
    using Microsoft.EntityFrameworkCore.Infrastructure;
    using Microsoft.EntityFrameworkCore;
    #endregion

    #region Interface of DatabaseContext
    public interface IDatabaseContext : IDisposable
    {
        EntityEntry Entry(object entity);
        int SaveChanges();
        Task<int> SaveChangesAsync(CancellationToken cancellationToken = default(CancellationToken));
        DbSet<TEntity> Set<TEntity>() where TEntity : class;
        DatabaseFacade Database { get; }
    }
    #endregion
}