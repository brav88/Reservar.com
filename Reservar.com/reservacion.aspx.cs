using Reservar.com.Entidades;
using Reservar.com.Servicios;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reservar.com
{
    public partial class reservacion : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string codigoDestino = Request.QueryString["codigoDestino"];
                int codigoReservacion = Convert.ToInt32(Request.QueryString["codigoReservacion"]);
                bool editMode = Convert.ToBoolean(Request.QueryString["EditMode"]);
                Session["editMode"] = editMode ? true : false;

                List<Destino> destinosDisponibles = ServicioDestinos.ObtenerDestino(codigoDestino);               

                GenerarCalculosReservacion(codigoDestino,
                                           Convert.ToDecimal(destinosDisponibles[0].Precio),
                                           Convert.ToDateTime(dateIn.Value),
                                           Convert.ToDateTime(dateOut.Value),
                                           Convert.ToInt16(ddAdultos.SelectedValue),
                                           Convert.ToInt16(ddNinos.SelectedValue));

                repDestinos.DataSource = destinosDisponibles;
                repDestinos.DataBind();

                if (editMode)
                {
                    Session["codigoReservacion"] = codigoReservacion;
                    DataTable ds = BaseDatos.executeObtenerReservaciones("", codigoReservacion);

                    if (ds.Rows.Count > 0)
                    {
                        ddAdultos.SelectedValue = ds.Rows[0]["Cant_adultos"].ToString();
                        ddNinos.SelectedValue = ds.Rows[0]["Cant_ninos"].ToString();
                        lblCantDias.Text = ds.Rows[0]["Cant_noches"].ToString();
                        lblCantPersonas.Text = ds.Rows[0]["Cant_personas"].ToString();
                        lblCostoAlojamiento.Text = ds.Rows[0]["Costo_alojamiento"].ToString();

                        dateIn.Value = Convert.ToDateTime(ds.Rows[0]["Fecha_entrada"]).ToString("yyyy-MM-dd");
                        dateOut.Value = Convert.ToDateTime(ds.Rows[0]["Fecha_salida"]).ToString("yyyy-MM-dd");

                        btnReservar.Text = "Editar";
                        lblTitulo.InnerText = "Edite su reservacion";
                    }
                }
            }
        }

        public void GenerarCalculosReservacion(string codigoDestino,
                                               decimal precioDestino,
                                               DateTime fechaIngreso,
                                               DateTime fechaSalida,
                                               int cantAdultos,
                                               int cantNinos)
        {
            decimal cantDias = Convert.ToDecimal((fechaSalida - fechaIngreso).TotalDays);
            int cantPersonas = cantAdultos + cantNinos;
            decimal costoAlojamiento = (cantDias * cantPersonas) * precioDestino;

            lblCantDias.Text = cantDias.ToString();
            lblCantPersonas.Text = cantPersonas.ToString();
            lblCostoAlojamiento.Text = costoAlojamiento.ToString();

            var email = Session["email"].ToString();

            Reservacion reservacion = new Reservacion
            {
                Correo_usuario = email,
                Idn_destino = codigoDestino,
                Fecha_entrada = fechaIngreso,
                Fecha_salida = fechaSalida,
                Cant_adultos = cantAdultos,
                Cant_ninos = cantNinos,
                Cant_noches = Convert.ToInt16((fechaSalida - fechaIngreso).TotalDays),
                Cant_personas = (cantAdultos + cantNinos),
                Costo_alojamiento = Convert.ToDecimal((cantDias * cantPersonas) * precioDestino),
                Precio_destino = precioDestino
            };

            Session["reservacion"] = reservacion;
        }

        protected void ddAdultos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Reservacion reservacion = (Reservacion)Session["reservacion"];

            GenerarCalculosReservacion(reservacion.Idn_destino,
                                           Convert.ToDecimal(reservacion.Precio_destino),
                                           Convert.ToDateTime(dateIn.Value),
                                           Convert.ToDateTime(dateOut.Value),
                                           Convert.ToInt16(ddAdultos.SelectedValue),
                                           Convert.ToInt16(ddNinos.SelectedValue));
        }

        protected void ddNinos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Reservacion reservacion = (Reservacion)Session["reservacion"];

            GenerarCalculosReservacion(reservacion.Idn_destino,
                                           Convert.ToDecimal(reservacion.Precio_destino),
                                           Convert.ToDateTime(dateIn.Value),
                                           Convert.ToDateTime(dateOut.Value),
                                           Convert.ToInt16(ddAdultos.SelectedValue),
                                           Convert.ToInt16(ddNinos.SelectedValue));
        }

        protected void btnReservar_Click(object sender, EventArgs e)
        {
            Reservacion reservacion = (Reservacion)Session["reservacion"];

            double rangoDias = (reservacion.Fecha_salida - reservacion.Fecha_entrada).TotalDays;

            if (rangoDias <= 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('La fecha de salida no puede ser menor a la fecha de entrada')", true);
                return;
            }

            if (Session["editMode"] != null)
            {
                if ((bool)Session["editMode"])
                {
                    reservacion.Idn = (int)Session["codigoReservacion"];
                    BaseDatos.executeEditarReservacion(reservacion);
                }
                else
                {
                    BaseDatos.executeGuardarReservacion(reservacion);
                }
            }
            else
            {
                BaseDatos.executeGuardarReservacion(reservacion);
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showMessage('Reservación generada exitosamente')", true);
        }
    }
}