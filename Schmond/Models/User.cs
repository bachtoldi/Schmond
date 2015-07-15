using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Schmond.Models
{
	[Table("AspNetUsers")]
	public class User : IdentityUser
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
	}
}
