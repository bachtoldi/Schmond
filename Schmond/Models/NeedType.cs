using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models {
    public class NeedType {
        [Key]
        [Column("NeedTypeId")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [Column("NeedTypeName")]
        public string Name { get; set; }

        public override string ToString() {
            return Name;
        }
    }
}