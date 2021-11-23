using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TrenCR.Models;

namespace TrenCR.DataContext
{
    public class DbTrenCTX: DbContext
    {
        public DbTrenCTX(DbContextOptions<DbTrenCTX> options) : base(options)
        {
     
        }
         protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Estacion>(e => e.HasNoKey());
            builder.Entity<Hora>(e => e.HasNoKey());

        }
        public DbSet<Ruta> Ruta { get; set; }
        public DbSet<Estacion> Estacion { get; set; }
        public DbSet<Hora> Hora { get; set; }
        public DbSet<Factura> Factura { get; set; }


    }
}
