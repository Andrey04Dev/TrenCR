using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TrenCR.Models
{
    [Table("tbl_estacion")]
    public class Estacion
    {
        [key]
        public int IdEstacion { get; set; }
        public string NombreLugar { get; set; }
        [ForeignKey("IdRuta")]
        public virtual Ruta Ruta { get; set; }
    }
}
