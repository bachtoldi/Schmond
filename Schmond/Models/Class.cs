using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Class
	{
		[Key]
		[Column("ClassId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Required]
		[Column("ClassName")]
		public string Name { get; set; }
	}
}