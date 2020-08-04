using Reservar.com.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reservar.com
{
    public partial class reservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Session["email"] == null))
                {
                    Response.Redirect("login.aspx");
                }

                ObtenerReservacionesActivas();
            }
        }

        public void ObtenerReservacionesActivas()
        {
            string email = Session["email"].ToString();

            repReservaciones.DataSource = BaseDatos.executeObtenerReservaciones(email, 0);
            repReservaciones.DataBind();
        }

        protected void btnCancelarReservacion_Click(object sender, EventArgs e)
        {
            int Idn = Convert.ToInt16(Page.Request.Form[txtCodigo.UniqueID]);

            BaseDatos.executeCancelarReservacion(Idn);

            ObtenerReservacionesActivas();
        }
    }
}