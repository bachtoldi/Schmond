using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

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

		[Required]
		[Column("FK_FactionId")]
		public int FactionId { get; set; }

		[ForeignKey("FactionId")]
		public Faction Faction { get; set; }

		[JsonIgnore]
		public virtual ICollection<Class> AvailableClasses { get; set; }

		public override string ToString()
		{
			return Name;
		}

		public override bool Equals(object obj)
		{
			var race = obj as Race;
			return race != null && race.Id == Id;
		}

		public override int GetHashCode()
		{
			return Id.GetHashCode();
		}
	}
}