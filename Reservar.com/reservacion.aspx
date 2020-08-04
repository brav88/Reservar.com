<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reservacion.aspx.cs" Inherits="Reservar.com.reservacion" %>

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
    <script type="text/javascript">

        function onFocusLost(dateIn, dateOut) {
            var cantDias = document.querySelector("#lblCantDias");

            var millennium = new Date(dateIn)
            today = new Date(dateOut);
            var one_day = 1000 * 60 * 60 * 24;
            var range = Math.ceil((today.getTime() - millennium.getTime()) / (one_day));

            cantDias.innerHTML = range;
        }

    </script>

    <title>Reservar destino</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="message"></div>
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
            <div class="container-fluid ml-3 mt-3">
                <div class="row">
                    <asp:Repeater ID="repDestinos" runat="server">
                        <ItemTemplate>
                            <div class="card" style="width: 18rem; margin-right: 10px">
                                <img src="<%# Eval("ImgURL") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                    <a href="destinos.aspx" class="btn btn-primary">Regresar</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:Panel ID="Panel1" runat="server" Style="margin-right: 10px">
                        <div class="card" style="width: 18rem;">
                            <div class="card-header bg-primary text-white">
                                <label id="lblTitulo" runat="server">Cree su reservación</label> 
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label>Fecha Entrada</label>
                                    <input runat="server" type="date" class="form-control" id="dateIn" placeholder="Fecha de entrada" value="2020-07-01"
                                        required>
                                </div>
                                <div class="form-group">
                                    <label>Fecha Salida</label>
                                    <input runat="server" type="date" class="form-control" id="dateOut" placeholder="Fecha de salida" value="2020-07-02"
                                        onfocusout="onFocusLost(dateIn.value ,dateOut.value)" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Adultos</label><br />
                                    <asp:DropDownList ID="ddAdultos" Style="width: 100%; height: 35px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddAdultos_SelectedIndexChanged">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="">Niños</label><br />
                                    <asp:DropDownList ID="ddNinos" Style="width: 100%; height: 35px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddNinos_SelectedIndexChanged">
                                        <asp:ListItem>0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server">
                        <div class="card" style="width: 18rem;">
                            <div class="card-header bg-primary text-white">
                                Detalle de la reservación
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-6">Cantidad de noches: </div>
                                    <div class="col-6">
                                        <strong>
                                            <asp:Label ID="lblCantDias" runat="server"></asp:Label></strong>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-6">Cantidad de personas:</div>
                                    <div class="col-6">
                                        <strong>
                                            <asp:Label ID="lblCantPersonas" runat="server"></asp:Label></strong>
                                    </div>
                                    <div class="w-100"></div>
                                    <div class="col-6">Costo por aloj.</div>
                                    <div class="col-6"><strong>$<asp:Label ID="lblCostoAlojamiento" runat="server"></asp:Label></strong></div>
                                </div>
                            </div>
                            <div class="p-2">
                                <asp:Button ID="btnReservar" Style="float: right" class="btn btn-primary" runat="server" Text="Reservar" OnClick="btnReservar_Click" />
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
