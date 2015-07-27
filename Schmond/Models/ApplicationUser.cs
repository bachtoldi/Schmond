using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Schmond.Models
{
	[Table("Account")]
	public class ApplicationUser : IdentityUser
	{
		[StringLength(100, ErrorMessage = "Das {0} muss mindestens {2} Zeichen lang sein.", MinimumLength = 6)]
		[DataType(DataType.Password)]
		[NotMapped]
		public string Password { get; set; }

		[DataType(DataType.Password)]
		[NotMapped]
		[Compare("Password", ErrorMessage = "Die Kennwörter stimmen nicht überein.")]
		public string ConfirmPassword { get; set; }

		[DataType(DataType.Password)]
		[NotMapped]
		public string OldPassword { get; set; }
		
		[Column("FK_CharId")]
		public int? MainCharId { get; set; }

		//[ForeignKey("MainCharId")]
		//public virtual Char MainChar { get; set; }

		public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager, string authenticationType)
		{
			// Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
			var userIdentity = await manager.CreateIdentityAsync(this, authenticationType);
			// Add custom user claims here
			return userIdentity;
		}
	}
}
