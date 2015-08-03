using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Microsoft.AspNet.Identity.EntityFramework;
using Schmond.Models;

namespace Schmond
{
	public class Context : IdentityDbContext<ApplicationUser>
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

			modelBuilder.Entity<ApplicationUser>().ToTable("Account");
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

			modelBuilder.Entity<Boss>().HasMany<Item>(b => b.Items)
																 .WithMany(i => i.DroppedBy)
																 .Map(m => m.ToTable("ItemBossSetting")
																	 .MapLeftKey("FK_BossId")
																	 .MapRightKey("FK_ItemId"));

			modelBuilder.Entity<Spec>().HasMany<Item>(s => s.AvailableItems)
																 .WithMany(i => i.AvailableFor)
																 .Map(m => m.ToTable("Available")
																	 .MapLeftKey("FK_SpecId")
																	 .MapRightKey("FK_ItemId"));
		}

		public virtual IDbSet<Char> Chars { get; set; }
		public virtual IDbSet<Race> Races { get; set; }
		public virtual IDbSet<Class> Classes { get; set; }
		public virtual IDbSet<Faction> Factions { get; set; }
		public virtual IDbSet<Item> Items { get; set; }
		public virtual IDbSet<Instance> Instances { get; set; }
		public virtual IDbSet<Boss> Bosses { get; set; }
		public virtual IDbSet<Spec> Specs { get; set; }
		public virtual IDbSet<NeedType> NeedTypes { get; set; }
		public virtual IDbSet<Priority> Priorities { get; set; }
		public virtual IDbSet<Available> Availabilities { get; set; }
		public virtual IDbSet<Need> Needs { get; set; }

		public static Context Create()
		{
			return new Context();
		}
	}
}
