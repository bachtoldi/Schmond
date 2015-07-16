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
			//Database.SetInitializer<Context>(null);
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
		}

		public virtual IDbSet<Char> Chars { get; set; }
		public virtual IDbSet<Race> Races { get; set; }
		public virtual IDbSet<Class> Classes { get; set; }
	}
}
