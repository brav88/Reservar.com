<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Reservar.com.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="message"></div>
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
                            <a class="nav-link" href="login.aspx">Iniciar sesión</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Contacténos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link">Promociones</a>
                        </li>            
                    </ul>
                </div>
            </nav>
            <div class="container w-50 mt-5 float-none">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        Login
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" runat="server" class="form-control" id="inpEmail">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" runat="server" class="form-control" id="inpPassword">
                        </div>
                        <div class="form-group form-check float-md-right">
                            <asp:Button ID="btnLogin" class="btn btn-primary" runat="server" Text="Login" OnClick="btnLogin_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
