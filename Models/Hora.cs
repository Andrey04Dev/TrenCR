using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TrenCR.Models
{
    [Table("tbl_horas")]
    public class Hora
    {
        [key]
        public int IdHora { get; set; }
        public TimeSpan Horas { get; set; }
        public int CantidadPasajeros { get; set; }
        public int IdEstacion { get; set; }
    }
}
