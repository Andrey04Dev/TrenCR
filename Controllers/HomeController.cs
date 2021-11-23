using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using TrenCR.DataContext;
using TrenCR.Models;

namespace TrenCR.Controllers
{
    public class HomeController : Controller
    {
        DbTrenCTX ctx;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, DbTrenCTX _ctr)
        {
            _logger = logger;
            ctx = _ctr;
        }

        public async Task<IActionResult> Index()
        {
            ViewBag.Rutas = await ctx.Ruta.ToListAsync();
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
        public async Task<IActionResult> VerFacturas()
        {
            ViewBag.Facturas = await ctx.Factura.ToListAsync();
            return View();
        }
        [HttpGet("{id}")]
        public IActionResult SeleccionarEstacion(int id)
        {
            var resultadoEstacion = ctx.Estacion.Where(x => x.Ruta.IdRuta == id).ToList();
            ViewBag.Estaciones = resultadoEstacion;
            return View();
        }
        public async Task<IActionResult> VerHorario(int id)
        {
            var result = await ctx.Estacion.Include("Ruta").Where(x => x.IdEstacion == id).ToListAsync();
            ViewBag.Estacion = result;
            ViewBag.Hora = await ctx.Hora.Where(x => x.IdEstacion == id).ToListAsync();
            return View();
        }
        [BindProperty]
        public Factura Factura { get; set; }
        [HttpPost]
        public async Task<IActionResult> CrearFactura()
        {
            ctx.Factura.Add(Factura);
            await ctx.SaveChangesAsync();
            ModelState.Clear();
            return RedirectToAction("Index");
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
