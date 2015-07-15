using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Race
	{
		[Key]
		[Column("RaceId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Column("RaceName")]
		[Required]
		public string Name { get; set; }
	}
}