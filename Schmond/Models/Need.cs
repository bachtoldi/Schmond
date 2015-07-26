using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Schmond.Models {
    public class Need {
        [Key]
        [Column("NeedId")]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [Required]
        [Column("FK_CharId")]
        public int CharId { get; set; }

        [ForeignKey("CharId")]
        public virtual Char Char { get; set; }

        [Required]
        [Column("FK_AvailableId")]
        public int AvailableId { get; set; }

        [ForeignKey("AvailableId")]
        public virtual Available Available { get; set; }

        [Required]
        [Column("FK_NeedTypeId")]
        public int NeedTypeId { get; set; }

        [ForeignKey("NeedTypeId")]
        public virtual NeedType NeedType { get; set; }

        [Required]
        [Column("FK_PriorityId")]
        public int PriorityId { get; set; }

        [ForeignKey("PriorityId")]
        public virtual Priority Priority { get; set; }
    }
}