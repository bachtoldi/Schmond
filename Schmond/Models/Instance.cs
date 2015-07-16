using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models
{
	public class Instance
	{
		[Key]
		[Column("InstanceId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Required]
		[Column("InstanceName")]
		public string Name { get; set; }

		public override string ToString()
		{
			return Name;
		}

		public override bool Equals(object obj)
		{
			var instance = obj as Instance;
			return instance != null && instance.Id == Id;
		}

		public override int GetHashCode()
		{
			return Id.GetHashCode();
		}
	}
}