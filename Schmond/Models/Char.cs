using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Schmond.Models
{
	[Table("Chars")]
	public class Char
	{
		[Key]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[ForeignKey("UserId")]
		public virtual User User { get; set; }

		[Required]
		public int UserId { get; set; }

		//Example how to load relations
		//using (Context ctx = new Context())
		//{
		//	var test = (from c in ctx.Chars.Include(x => x.User) // if you remove the include part, the user will be null. if you have the include part, ef will join the tables and load the whole user data, so be careful :)
		//							select c);
		//}
	}
}