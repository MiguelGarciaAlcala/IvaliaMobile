using Ivalia.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Ivalia.DataAccess
{
    public class IvaliaContext : DbContext
    {
        public DbSet<Role> Roles { get; set; }
        public DbSet<Client> Clients { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<Year> Years { get; set; }
        public DbSet<Period> Periods { get; set; }
        public DbSet<File> Files { get; set; }
        public DbSet<Plot> Plots { get; set; }
        public DbSet<ClientUser> ClientUsers { get; set; }
        public DbSet<Resource> Resources { get; set; }
        public DbSet<ResourceType> ResourceTypes { get; set; }
        public DbSet<Link> Links { get; set; }
        public DbSet<New> News { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<Section> Sections { get; set; }
        public DbSet<Subsection> Subsections { get; set; }

        public IvaliaContext(DbContextOptions<IvaliaContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Roles
            modelBuilder
                .Entity<Role>()
                .ToTable("Roles");

            modelBuilder
                .Entity<Role>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Role>()
                .HasIndex(s => s.Name)
                .IsUnique();

            modelBuilder
                .Entity<Role>()
                .HasMany(r => r.Users)
                .WithOne(u => u.Role)
                .HasForeignKey(u => u.RoleID);

            modelBuilder
                .Entity<Role>()
                .Property(s => s.Id)
                .HasMaxLength(1)
                .IsRequired();

            modelBuilder
                .Entity<Role>()
                .Property(s => s.Name)
                .HasMaxLength(30)
                .IsRequired();

            // Users
            modelBuilder
                .Entity<User>()
                .ToTable("Users");

            modelBuilder
                .Entity<User>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<User>()
                .HasIndex(s => s.Username)
                .IsUnique();

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.News)
                .WithOne(n => n.Creator)
                .HasForeignKey(n => n.CreatorID);

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.Links)
                .WithOne(l => l.Creator)
                .HasForeignKey(l => l.CreatorID);

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.Resources)
                .WithOne(r => r.Creator)
                .HasForeignKey(r => r.CreatorID);

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.TasksBy)
                .WithOne(t => t.UserBy)
                .HasForeignKey(t => t.ByID)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.TasksTo)
                .WithOne(t => t.UserTo)
                .HasForeignKey(t => t.ToID)
                .OnDelete(DeleteBehavior.NoAction);

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.Files)
                .WithOne(f => f.Creator)
                .HasForeignKey(f => f.CreatorID);

            modelBuilder
                .Entity<User>()
                .HasMany(u => u.ClientUsers)
                .WithOne(cu => cu.User)
                .HasForeignKey(cu => cu.UserID);

            modelBuilder
                .Entity<User>()
                .Property(s => s.RoleID)
                .HasMaxLength(1)
                .IsRequired();

            modelBuilder
                .Entity<User>()
                .Property(s => s.Fullname)
                .HasMaxLength(80)
                .IsRequired();

            modelBuilder
                .Entity<User>()
                .Property(s => s.Username)
                .HasMaxLength(30)
                .IsRequired();

            modelBuilder
                .Entity<User>()
                .Property(s => s.Password)
                .IsRequired();

            modelBuilder
                .Entity<User>()
                .Property(s => s.Email)
                .HasMaxLength(100)
                .IsRequired();

            modelBuilder
                .Entity<User>()
                .Property(s => s.Status)
                .HasMaxLength(1)
                .IsRequired();

            // Tasks
            modelBuilder
                .Entity<Task>()
                .ToTable("Tasks");

            modelBuilder
                .Entity<Task>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Task>()
                .HasIndex(s => s.Title)
                .IsUnique(false);

            modelBuilder
                .Entity<Task>()
                .Property(s => s.Title)
                .HasMaxLength(50)
                .IsRequired();

            modelBuilder
                .Entity<Task>()
                .Property(s => s.Description)
                .HasMaxLength(200)
                .IsRequired();

            modelBuilder
                .Entity<Task>()
                .Property(s => s.CreationDate)
                .IsRequired();

            modelBuilder
                .Entity<Task>()
                .Property(s => s.Status)
                .HasMaxLength(1)
                .IsRequired();

            // News
            modelBuilder
                .Entity<New>()
                .ToTable("News");

            modelBuilder
                .Entity<New>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<New>()
                .Property(s => s.Title)
                .IsRequired();

            modelBuilder
                .Entity<New>()
                .Property(s => s.Image)
                .IsRequired();

            modelBuilder
                .Entity<New>()
                .Property(s => s.UploadDate)
                .IsRequired();

            modelBuilder
                .Entity<New>()
                .Property(s => s.Status)
                .HasMaxLength(1)
                .IsRequired();

            // Links
            modelBuilder
                .Entity<Link>()
                .ToTable("Links");

            modelBuilder
                .Entity<Link>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Link>()
                .Property(s => s.Description)
                .HasMaxLength(100)
                .IsRequired();

            modelBuilder
                .Entity<Link>()
                .Property(s => s.Hyperlink)
                .IsRequired();

            modelBuilder
                .Entity<Link>()
                .Property(s => s.UploadDate)
                .IsRequired();

            // ResourceTypes
            modelBuilder
                .Entity<ResourceType>()
                .ToTable("ResourceTypes");

            modelBuilder
                .Entity<ResourceType>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<ResourceType>()
                .HasIndex(s => s.Name)
                .IsUnique();

            modelBuilder
                .Entity<ResourceType>()
                .HasMany(rt => rt.Resources)
                .WithOne(r => r.ResourceType)
                .HasForeignKey(r => r.Type);

            modelBuilder
                .Entity<ResourceType>()
                .Property(s => s.Id)
                .HasMaxLength(1)
                .IsRequired();

            modelBuilder
                .Entity<ResourceType>()
                .Property(s => s.Name)
                .HasMaxLength(30)
                .IsRequired();

            // Resources
            modelBuilder
                .Entity<Resource>()
                .ToTable("Resources");

            modelBuilder
                .Entity<Resource>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Resource>()
                .Property(s => s.Description)
                .HasMaxLength(100)
                .IsRequired();

            modelBuilder
                .Entity<Resource>()
                .Property(s => s.FileHyperlink)
                .IsRequired();

            modelBuilder
                .Entity<Resource>()
                .Property(s => s.UploadDate)
                .IsRequired();

            // Clients
            modelBuilder
                .Entity<Client>()
                .ToTable("Clients");

            modelBuilder
                .Entity<Client>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Client>()
                .HasIndex(s => s.RFC)
                .IsUnique();

            modelBuilder
                .Entity<Client>()
                .HasIndex(s => s.Fullname)
                .IsUnique();

            modelBuilder
                .Entity<Client>()
                .HasMany(c => c.ClientUsers)
                .WithOne(cu => cu.Client)
                .HasForeignKey(cu => cu.ClientID);

            modelBuilder
                .Entity<Client>()
                .HasMany(c => c.Periods)
                .WithOne(p => p.Client)
                .HasForeignKey(p => p.ClientID);

            modelBuilder
                .Entity<Client>()
                .Property(c => c.RFC)
                .HasMaxLength(20)
                .IsRequired();

            modelBuilder
                .Entity<Client>()
                .Property(c => c.Fullname)
                .HasMaxLength(80)
                .IsRequired();

            modelBuilder
                .Entity<Client>()
                .Property(c => c.Status)
                .HasMaxLength(1)
                .IsRequired();

            // ClientUsers
            modelBuilder
                .Entity<ClientUser>()
                .ToTable("ClientUsers");

            modelBuilder
                .Entity<ClientUser>()
                .HasKey(s => new { s.ClientID, s.UserID });

            // Files
            modelBuilder
                .Entity<File>()
                .ToTable("Files");

            modelBuilder
                .Entity<File>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<File>()
                .Property(s => s.Description)
                .IsRequired();

            modelBuilder
                .Entity<File>()
                .Property(s => s.Filename)
                .IsRequired();

            modelBuilder
                .Entity<File>()
                .Property(s => s.UploadDate)
                .IsRequired();

            // Periods
            modelBuilder
                .Entity<Period>()
                .ToTable("Periods");

            modelBuilder
                .Entity<Period>()
                .HasMany(p => p.Files)
                .WithOne(f => f.Period)
                .HasForeignKey(f => f.PeriodID);

            modelBuilder
                .Entity<Period>()
                .HasMany(p => p.Plots)
                .WithOne(p => p.Period)
                .HasForeignKey(p => p.PeriodID);

            modelBuilder
                .Entity<Period>()
                .Property(s => s.Name)
                .HasMaxLength(50)
                .IsRequired();

            modelBuilder
                .Entity<Period>()
                .Property(s => s.Status)
                .HasMaxLength(1)
                .IsRequired();

            // Years
            modelBuilder
                .Entity<Year>()
                .ToTable("Years");

            modelBuilder
                .Entity<Year>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Year>()
                .HasIndex(s => s.Name)
                .IsUnique();

            modelBuilder
                .Entity<Year>()
                .HasMany(s => s.Periods)
                .WithOne(p => p.Year)
                .HasForeignKey(p => p.YearID);

            modelBuilder
                .Entity<Year>()
                .Property(s => s.Name)
                .IsRequired();

            modelBuilder
                .Entity<Year>()
                .Property(s => s.Status)
                .HasMaxLength(1)
                .IsRequired();

            // Plots
            modelBuilder
                .Entity<Plot>()
                .ToTable("Plots");

            modelBuilder
                .Entity<Plot>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Plot>()
                .Property(s => s.Description)
                .HasMaxLength(150)
                .IsRequired();

            modelBuilder
                .Entity<Plot>()
                .Property(s => s.Filename)
                .IsRequired();

            modelBuilder
                .Entity<Plot>()
                .Property(s => s.UploadDate)
                .IsRequired();

            // Sections
            modelBuilder
                .Entity<Section>()
                .ToTable("Sections");

            modelBuilder
                .Entity<Section>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Section>()
                .HasIndex(s => s.Title)
                .IsUnique();

            modelBuilder
                .Entity<Section>()
                .HasMany(s => s.Subsections)
                .WithOne(s => s.Section)
                .HasForeignKey(s => s.SectionID);

            modelBuilder
                .Entity<Section>()
                .Property(s => s.Title)
                .HasMaxLength(50)
                .IsRequired();

            // Subsections
            modelBuilder
                .Entity<Subsection>()
                .ToTable("Subsections");

            modelBuilder
                .Entity<Subsection>()
                .HasKey(s => s.Id);

            modelBuilder
                .Entity<Subsection>()
                .Property(s => s.Title)
                .HasMaxLength(50)
                .IsRequired();

            modelBuilder
                .Entity<Subsection>()
                .Property(s => s.Content)
                .IsRequired();
        }
    }
}
