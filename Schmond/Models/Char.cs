using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Char
	{
		[Key]
		[Column("CharId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[ForeignKey("UserId")]
		public virtual ApplicationUser User { get; set; }

		[Required]
		[Column("FK_UserId")]
		public string UserId { get; set; }

		[ForeignKey("RaceId")]
		public virtual Race Race { get; set; }

		[Required]
		[Column("FK_RaceId")]
		public int RaceId { get; set; }

		[ForeignKey("SpecId")]
		public virtual Spec Spec { get; set; }

		[Required]
		[Column("FK_SpecId")]
		public int SpecId { get; set; }
	}
}