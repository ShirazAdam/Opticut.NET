using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace Opticut.Data
{
    public class DatabaseDesignTimeDbContextFactory
        : IDesignTimeDbContextFactory<OpticutDbContext>
    {
        public OpticutDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<OpticutDbContext>();
            builder.UseAzureSql();
            return new OpticutDbContext(builder.Options);
        }
    }
}
