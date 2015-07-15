using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Faction
	{
		[Key]
		[Column("FactionId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Column("FactionName")]
		[Required]
		public string Name { get; set; }
	}
}