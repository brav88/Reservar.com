<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="destinos.aspx.cs" Inherits="Reservar.com.destinos" %>

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
    <script src="js/app.js"></script>
    <style>
        #snackbar {
            visibility: hidden;
            min-width: 250px;
            margin-left: -125px;
            background-color: #4285f4;
            color: #fff;
            text-align: center;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 50%;
            bottom: 30px;
            font-size: 17px;
        }

            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
                animation: fadein 0.5s, fadeout 0.5s 2.5s;
            }

        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }

            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }

            to {
                bottom: 0;
                opacity: 0;
            }
        }
    </style>
    <title>Destinos disponibles</title>   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>     
        <div>
            <div id="snackbar"><strong>Agregado al carrito exitosamente</strong></div>
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
                    <asp:Repeater ID="repDestinos" runat="server">
                        <ItemTemplate>
                            <div class="card mb-3" style="width: 25rem; margin-right: 10px; margin-top: 10px">
                                <img src="<%# Eval("ImgURL") %>" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                    <p class="card-text"><%# Eval("Descripcion") %></p>
                                </div>
                                <div class="float-right p-2">
                                    <a href="reservacion.aspx?codigoDestino=<%# Eval("Idn") %>" class="btn btn-primary">$<%# Eval("Precio") %> /p Reservar</a>

                                    <a id="cartButton<%# Eval("Idn") %>" class="btn btn-primary" onclick="onCart('cartButton<%# Eval("Idn") %>', '<%# Eval("Idn") %>', '<%# Eval("CorreoUsuario") %>')">
                                        <svg width="1em" height="1em" viewBox="0 0 15 15" class="bi bi-cart1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path fill-rule="evenodd" d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z" />
                                        </svg>
                                    </a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
