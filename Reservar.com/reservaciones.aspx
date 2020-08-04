<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reservaciones.aspx.cs" Inherits="Reservar.com.reservaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet"
        id="theme_link"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/materia/bootstrap.min.css" />
    <%--<link rel="stylesheet" id="theme_link" href="css/bootstrap.min.css" />--%>
    <link href="css/mdb.min.css" rel="stylesheet" />
    <link href="css/navbar-fixed-left.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/navbar-fixed-left.min.css" />
    <link rel="stylesheet" href="css/docs.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.js"></script>
    <script src="js/app.js"></script>
    <title>Mis reservaciones</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-md navbar-dark bg-primary fixed-left">
                <a class="navbar-brand" href="#">Reservar.com</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault"
                    aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="destinos.aspx">Destinos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="reservaciones.aspx">Mis reservaciones</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Mi carrito</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Contacténos</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Configuracion</a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="login.aspx">Cerrar sesión</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="container-fluid ml-3">
                <div class="row">
                    <asp:Repeater ID="repReservaciones" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3" style="width: 25rem; margin-right: 10px; margin-top: 10px">
                                <img src="<%# Eval("ImgURL") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text">Del <%# Eval("Fecha_entrada") %> al <%# Eval("Fecha_salida") %> por $<%# Eval("Costo_alojamiento") %></p>
                                </div>
                                <div class="float-right p-2">
                                    <a class="btn btn-danger text-white" onclick="cargarReservacion('<%# Eval("Idn") %>')" data-toggle="modal" data-target="#myModal">
                                        <svg width="1em" height="1em" viewBox="0 0 15 15" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                        </svg></a>

                                    <a class="btn btn-success text-white" href="reservacion.aspx?codigoDestino=<%# Eval("Idn_Destino")%>&codigoReservacion=<%# Eval("Idn")%>&EditMode=true ">
                                        <svg width="1em" height="1em" viewBox="0 0 15 15" class="bi bi-pencil-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                        </svg></a>

                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>

            <div id="myModal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Reservacion No:
                                <asp:TextBox ID="txtCodigo" runat="server" BorderStyle="None" ReadOnly></asp:TextBox></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h4>¿Seguro que desea cancelar la reservación?</h4>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnCancelarReservacion" class="btn btn-danger" runat="server" Text="Si" OnClick="btnCancelarReservacion_Click" />
                            <button type="button" class="btn btn-secondary text-black-50" data-dismiss="modal">Seguir viendo destinos</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
