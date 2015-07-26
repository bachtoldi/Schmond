using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models {
    public class Available {
        [Key]
        [Column("AvailableId")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [Column("FK_SpecId")]
        public int SpecId { get; set; }

        [ForeignKey("SpecId")]
        public virtual Spec Spec { get; set; }

        [Required]
        [Column("FK_ItemId")]
        public int ItemId { get; set; }

        [ForeignKey("ItemId")]
        public virtual Item Item { get; set; }
    }
}