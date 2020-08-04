using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Reservar.com.Entidades
{
    public class Destino
    {
        public string CorreoUsuario { get; set; }
        public string Idn { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string ImgURL { get; set; }
        public double Precio { get; set; }
    }
}