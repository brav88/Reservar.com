using Reservar.com.Entidades;
using Reservar.com.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reservar.com
{
    public partial class destinos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Destino> destinosDisponibles = ServicioDestinos.ObtenerDestinos();

            foreach (Destino destino in destinosDisponibles)
            {
                destino.CorreoUsuario = Session["email"].ToString();
            }

            Session["destinosDisponibles"] = destinosDisponibles;

            repDestinos.DataSource = destinosDisponibles;
            repDestinos.DataBind();
        }

        [System.Web.Services.WebMethod]
        public static string GuardarCarrito(string idn, string correo)
        {
            BaseDatos.executeGuardarCarrito(idn, correo);

            return "Agregado al carrito exitosamente";
        }
    }
}