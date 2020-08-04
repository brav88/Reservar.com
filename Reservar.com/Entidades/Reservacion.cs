using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reservar.com.Entidades
{
    public class Reservacion
    {
        public int Idn { get; set; }
        public string Correo_usuario { get; set; }
        public string Idn_destino { get; set; }
        public DateTime Fecha_entrada { get; set; }
        public DateTime Fecha_salida { get; set; }
        public int Cant_adultos { get; set; }
        public int Cant_ninos { get; set; }
        public int Cant_noches { get; set; }
        public int Cant_personas { get; set; }
        public decimal Precio_destino { get; set; }
        public decimal Costo_alojamiento { get; set; }
        public string Estado { get; set; }
        public DateTime Fecha_registro { get; set; }
    }
}
