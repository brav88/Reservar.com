using Microsoft.SqlServer.Server;
using Reservar.com.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Reservar.com.Servicios
{
    public static class BaseDatos
    {
        public static string CNN = @"Data Source=SAMUEL\SAMUEL;Initial Catalog=Reservar;Integrated Security=True";

        public static List<Destino> executeObtenerDestinos()
        {
            DataTable dt = fillDTStoreProcedure("spObtenerDestinos", null);

            List<Destino> destinosDisponibles = new List<Destino>();

            foreach (DataRow row in dt.Rows)
            {
                Destino destino = new Destino
                {
                    Idn = row["Idn"].ToString(),
                    Nombre = row["Nombre"].ToString(),
                    Descripcion = row["Descripcion"].ToString(),
                    ImgURL = row["ImgURL"].ToString(),
                    Precio = Convert.ToDouble(row["Precio"])
                };

                destinosDisponibles.Add(destino);
            }

            return destinosDisponibles;
        }

        public static List<Destino> executeObtenerDestinos(string idn)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@Idn", idn));

            DataTable dt = fillDTStoreProcedure("spObtenerDestino", param);

            List<Destino> destinosDisponibles = new List<Destino>();

            foreach (DataRow row in dt.Rows)
            {
                Destino destino = new Destino
                {
                    Idn = row["Idn"].ToString(),
                    Nombre = row["Nombre"].ToString(),
                    Descripcion = row["Descripcion"].ToString(),
                    ImgURL = row["ImgURL"].ToString(),
                    Precio = Convert.ToDouble(row["Precio"])
                };

                destinosDisponibles.Add(destino);
            }

            return destinosDisponibles;
        }

        public static DataTable executeObtenerReservaciones(string correoUsuario, int codigoReservacion)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@Correo_usuario", correoUsuario));
            param.Add(new SqlParameter("@CodigoReservacion", codigoReservacion));

            DataTable dt = fillDTStoreProcedure("spObtenerReservaciones", param);           

            return dt;
        }

        public static void executeCancelarReservacion(int Idn)
        {
            List<SqlParameter> param = new List<SqlParameter>();

            param.Add(new SqlParameter("@Idn", Idn));

            executeStoreProcedure("spCancelarReservacion", param);
        }

        public static void executeGuardarReservacion(Reservacion reservacion)
        {
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@Correo_usuario", reservacion.Correo_usuario));
            lista.Add(new SqlParameter("@Idn_destino", reservacion.Idn_destino));
            lista.Add(new SqlParameter("@Fecha_entrada", reservacion.Fecha_entrada));
            lista.Add(new SqlParameter("@Fecha_salida", reservacion.Fecha_salida));
            lista.Add(new SqlParameter("@Cant_adultos", reservacion.Cant_adultos));
            lista.Add(new SqlParameter("@Cant_ninos", reservacion.Cant_ninos));
            lista.Add(new SqlParameter("@Cant_noches", reservacion.Cant_noches));
            lista.Add(new SqlParameter("@Cant_personas", reservacion.Cant_personas));
            lista.Add(new SqlParameter("@Costo_alojamiento", reservacion.Costo_alojamiento));

            executeStoreProcedure("spGuardarReservacion", lista);
        }

        public static void executeGuardarCarrito(string idn, string correoUsuario)
        {
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@Idn", idn));
            lista.Add(new SqlParameter("@Correo_usuario", correoUsuario));

            executeStoreProcedure("spGuardarCarrito", lista);
        }

        public static void executeEditarReservacion(Reservacion reservacion)
        {
            List<SqlParameter> lista = new List<SqlParameter>();

            lista.Add(new SqlParameter("@Idn", reservacion.Idn));
            lista.Add(new SqlParameter("@Fecha_entrada", reservacion.Fecha_entrada));
            lista.Add(new SqlParameter("@Fecha_salida", reservacion.Fecha_salida));
            lista.Add(new SqlParameter("@Cant_adultos", reservacion.Cant_adultos));
            lista.Add(new SqlParameter("@Cant_ninos", reservacion.Cant_ninos));
            lista.Add(new SqlParameter("@Cant_noches", reservacion.Cant_noches));
            lista.Add(new SqlParameter("@Cant_personas", reservacion.Cant_personas));
            lista.Add(new SqlParameter("@Costo_alojamiento", reservacion.Costo_alojamiento));

            executeStoreProcedure("spEditarReservacion", lista);
        }

        public static DataTable fillDTStoreProcedure(string procedure, List<SqlParameter> param)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(CNN)) //Creacion del objeto que se conecta a SQL
                {
                    conn.Open(); //Comando que abre la conexión a SQL
                    SqlCommand cmd = new SqlCommand(); //Creando el objeto comando SQL
                    cmd.CommandText = procedure; // Le digo al comando que es un Stored Procedure
                    cmd.CommandType = CommandType.StoredProcedure; // Le digo al comando que es de tipo Stored Procedure
                    cmd.Connection = conn; // Le digo al comando que su conexion es mi variable conn

                    if (param != null)
                    {
                        foreach (SqlParameter item in param)
                        {
                            cmd.Parameters.Add(item);
                        }
                    }

                    cmd.ExecuteNonQuery(); // Le digo al comando que se ejecute en el SQL
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd); //Adaptador que va a ir a entender que ejecuto el comando
                    DataTable dt = new DataTable(); //Matriz donde voy a guardar los datos
                    adapter.Fill(dt); //El adaptador llena la matriz con los datos que me devolvió el comando

                    return dt; //Retorne los datos que contiene la matriz
                }
            }
            catch (Exception ex)
            {
                throw ex; //Devuelve un error
            }
        }

        public static void executeStoreProcedure(string procedure, List<SqlParameter> param)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(CNN)) //Creacion del objeto que se conecta a SQL
                {
                    conn.Open(); //Comando que abre la conexión a SQL
                    SqlCommand cmd = new SqlCommand(); //Creando el objeto comando SQL
                    cmd.CommandText = procedure; // Le digo al comando que es un Stored Procedure
                    cmd.CommandType = CommandType.StoredProcedure; // Le digo al comando que es de tipo Stored Procedure
                    cmd.Connection = conn; // Le digo al comando que su conexion es mi variable conn

                    if (param != null)
                    {
                        foreach (SqlParameter item in param)
                        {
                            cmd.Parameters.Add(item);
                        }
                    }

                    cmd.ExecuteNonQuery(); // Le digo al comando que se ejecute en el SQL
                }
            }
            catch (Exception ex)
            {
                throw ex; //Devuelve un error
            }
        }
    }
}