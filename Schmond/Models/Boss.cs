using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Boss
	{
		[Key]
		[Column("BossId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Required]
		[Column("BossNumber")]
		public int Number { get; set; }

		[Required]
		[Column("BossName")]
		public string Name { get; set; }

		[Required]
		[Column("FK_InstanceId")]
		public int InstanceId { get; set; }

		[ForeignKey("InstanceId")]
		public virtual Instance Instance { get; set; }

		public override string ToString()
		{
			return Name;
		}

		public override bool Equals(object obj)
		{
			var boss = obj as Boss;
			return boss != null && boss.Id == Id;
		}

		public override int GetHashCode()
		{
			return Id.GetHashCode();
		}
	}
}