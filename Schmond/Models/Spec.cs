using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Spec
	{
		[Key]
		[Column("SpecId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Required]
		[Column("SpecName")]
		public string Name { get; set; }

		[Required]
		[Column("FK_ClassId")]
		public int ClassId { get; set; }

		[ForeignKey("ClassId")]
		public Class Class { get; set; }

		public override string ToString()
		{
			return Name;
		}

		public override bool Equals(object obj)
		{
			var spec = obj as Spec;
			return spec != null && spec.Id == Id;
		}

		public override int GetHashCode()
		{
			return Id.GetHashCode();
		}
	}
}