using Reservar.com.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;

namespace Reservar.com.Servicios
{
    public static class ServicioDestinos
    {
        public static List<Destino> ObtenerDestinos()
        {
            List<Destino> destinosDisponibles = BaseDatos.executeObtenerDestinos();

            return destinosDisponibles;
        }

        public static List<Destino> ObtenerDestino(string idn)
        {
            List<Destino> destinosEncontrados = new List<Destino>();

            destinosEncontrados = BaseDatos.executeObtenerDestinos(idn);

            return destinosEncontrados;
        }
    }
}