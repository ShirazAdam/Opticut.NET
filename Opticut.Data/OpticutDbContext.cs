using Microsoft.EntityFrameworkCore;
using Opticut.Data.Models;

namespace Opticut.Data
{
    public class OpticutDbContext(DbContextOptions<OpticutDbContext> options) : DbContext(options)
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        { }

        protected override void OnModelCreating(ModelBuilder modelBuilder)

        {

            modelBuilder.Entity<UserTable>(entity =>
            {

                entity.ToTable("UserTable", "Administration");

                entity.HasKey(p => p.Id)
                    .HasName("PK_User");

                entity.Property(p => p.Id)
                    .HasColumnName("ID")
                    .HasColumnType("int").ValueGeneratedOnAdd();

                entity.Property(p => p.FirstName)
                    .HasColumnName("FirstName");

                entity.Property(p => p.LastName)
                    .HasColumnName("LastName");

                entity.Property(p => p.Email)
                    .HasColumnName("Email");

                entity.Property(p => p.DateOfBirth)
                    .HasColumnName("DateOfBirth");

                entity.Property(p => p.PhoneNumber)
                    .HasColumnName("PhoneNumber");

            });

        }

        public virtual DbSet<UserTable> Users { get; set; }
    }
}
