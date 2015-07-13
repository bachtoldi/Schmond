using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNet.Identity.EntityFramework;

namespace Schmond.Models
{
	[Table("AspNetUsers")]
	public class User : IdentityUser
	{
		[Required]
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
		
		public int? CharsId { get; set; }
	}
}

//@example
//public class ModelExample {
//		[Key]
//		[DatabaseGenerated(DatabaseGeneratedOption.Identity)] // AutoIncrement
//		public int PrimaryKey { get; set; }

//		[StringLength(100)] // max length
//		[Required] // not null
//		public string SimpleProperty { get; set; }

//		[ForeignKey("UserId")] // many-to-one or one-to-one reference. can also be done in context
//		public User User { get; set; }

//		// column which references
//		public int UserId { get; set; }

//		//other references will be made in Context
//}
