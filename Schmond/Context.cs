using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Microsoft.AspNet.Identity.EntityFramework;
using Schmond.Models;

namespace Schmond
{
	public class Context : IdentityDbContext<User>
	{
		public Context()
			: base("DefaultContext")
		{
			Database.SetInitializer<Context>(null);
		}

		protected override void OnModelCreating(DbModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);
			modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

			modelBuilder.Entity<User>().ToTable("Account");
			modelBuilder.Entity<IdentityUserLogin>().ToTable("Login");
			modelBuilder.Entity<IdentityRole>().ToTable("Role");
			modelBuilder.Entity<IdentityUserRole>().ToTable("UserHasRole");
			modelBuilder.Entity<IdentityUserLogin>().HasKey(l => new { l.UserId, l.LoginProvider, l.ProviderKey });
			modelBuilder.Entity<IdentityRole>().HasKey(r => r.Id);
			modelBuilder.Entity<IdentityUserRole>().HasKey(r => new { r.RoleId, r.UserId });

			modelBuilder.Entity<Race>().HasMany<Class>(r => r.AvailableClasses)
																 .WithMany(c => c.AvailableRaces)
																 .Map(m => m.ToTable("ClassRaceSetting")
																	 .MapLeftKey("FK_RaceId")
																	 .MapRightKey("FK_ClassId"));
		}

		public virtual IDbSet<Char> Chars { get; set; }
		public virtual IDbSet<Race> Races { get; set; }
		public virtual IDbSet<Class> Classes { get; set; }
		public virtual IDbSet<Faction> Factions { get; set; }
		public virtual IDbSet<Item> Items { get; set; }
		public virtual IDbSet<Instance> Instances { get; set; }
	}
}
