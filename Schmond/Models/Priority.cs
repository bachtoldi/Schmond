using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models {
    public class Priority {
        [Key]
        [Column("PriorityId")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [Column("PriorityName")]
        public string Name { get; set; }

        public override string ToString() {
            return Name;
        }
    }
}