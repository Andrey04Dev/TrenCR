using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TrenCR.Models
{
    [Table("tbl_factura")]
    public class Factura
    {
        [Key]
        public int IdFactura { get; set; }
        [Required(ErrorMessage ="Debe llenar este campo")]
        [Display(Name ="Nombre de la Persona")]
        public string NombrePersona { get; set; }
        public int IdHora { get; set; }
        [Required]
        [ForeignKey("IdHora")]
        public TimeSpan Hora { get; set; }
        public string Ruta { get; set; }
        [Display(Name = "Estacion")]
        public string Estacion { get; set; }
        [Required(ErrorMessage = "Debe escoger la cantidad de boletos")]
        [Display(Name = "Cantidad de Boletos")]
        public int CantidadDeBoletos { get; set; }
    }
}
