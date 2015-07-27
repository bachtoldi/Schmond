using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Newtonsoft.Json;

namespace Schmond.Models
{
	public class Item
	{
		[Key]
		[Column("ItemId")]
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int Id { get; set; }

		[Required]
		[Column("ItemName")]
		public string Name { get; set; }

		[JsonIgnore]
		public virtual ICollection<Boss> DroppedBy { get; set; }

		public override string ToString()
		{
			return Name;
		}

		public override bool Equals(object obj)
		{
			var item = obj as Item;
			return item != null && item.Id == Id;
		}

		public override int GetHashCode()
		{
			return Id.GetHashCode();
		}
	}
}