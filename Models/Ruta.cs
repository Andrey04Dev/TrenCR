using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TrenCR.Models
{
    [Table("tbl_rutas")]
    public class Ruta
    {
        [Key]
        public int IdRuta { get; set; }
        public string OrigenRuta { get; set; }
        public string DestinoRuta { get; set; }
    }
}
