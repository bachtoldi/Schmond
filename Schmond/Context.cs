using System.Data.Entity;
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
			modelBuilder.Entity<IdentityUserLogin>().HasKey(l => new { l.UserId, l.LoginProvider, l.ProviderKey });
			modelBuilder.Entity<IdentityRole>().HasKey(r => r.Id);
			modelBuilder.Entity<IdentityUserRole>().HasKey(r => new { r.RoleId, r.UserId });
		}
	}
}
