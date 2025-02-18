
<%@ page import="com.example.proyecto_final_base_japyld.BeansGenerales.Juegos" %>
<%@ page import="com.example.proyecto_final_base_japyld.BeansGenerales.VentaJuegosGeneral" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_final_base_japyld.UsuarioJapyld.ModelsJ.DtoJ.ImagenPerfilDto" %><%--
  Created by IntelliJ IDEA.
  User: jossr
  Date: 5/06/2023
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="personaSession" type="com.example.proyecto_final_base_japyld.BeansGenerales.Personas" scope="session" class="com.example.proyecto_final_base_japyld.BeansGenerales.Personas"/>
<html lang="en">
<%
  VentaJuegosGeneral ventaJuegosGeneral = (VentaJuegosGeneral) request.getAttribute("ventaJuegosGeneral");
%>
<%
  ArrayList<Integer> venta_3_meses = (ArrayList<Integer>) request.getAttribute("venta_3_meses");
%>
<% ArrayList<ImagenPerfilDto> listaFotoPerfil = (ArrayList<ImagenPerfilDto>) request.getAttribute("listaFotoPerfil"); %>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Nueva oferta</title>

  <title>Gráfico de Barras con Bootstrap 4</title>

  <style>
    /* Estilos personalizados */
    .custom-textbox {
      border: 2px solid #ffffff;
      border-radius: 10px;
      padding: 10px;
      font-size: 18px;
      color: #333;
      background-color: #F1F7F6;
      outline: none;
    }

    .custom-textbox:focus {
      border-color: #29B6A5;
      box-shadow: 0 0 0 3px rgba(41, 182, 165, 0.2);
    }
  </style>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <!-- Custom fonts for this template-->
  <link href="recursos/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="recursos/css/sb-admin-2.min.css" rel="stylesheet">
  <style>
    .img-perfil-principal {
      width: 300px; /* Ajusta el tamaño del círculo según tus necesidades */
      height: 300px;
    }
    .img-gaga {
      display: inline-block; /* Hacemos que el contenedor sea inline-block para que solo ocupe el tamaño de la imagen */
      width: 50px; /* Ajusta el tamaño del círculo según tus necesidades */
      height: 50px;
      border-radius: 50%; /* Convertimos el cuadro en un círculo */
      background-size: cover; /* Ajustamos la imagen para que cubra el círculo */
      background-position: center center; /* Centramos la imagen dentro del círculo horizontal y verticalmente */
      background-repeat: no-repeat; /* Evitamos que la imagen se repita */
      margin: 0; /* Quitamos cualquier margen */
      padding: 0; /* Quitamos cualquier relleno */
      border: none; /* Quitamos cualquier borde */
    }


    .nav-link.dropdown-toggle {
      align-items: center;
      padding: 1px 5px; /* Ajustamos el padding horizontal y vertical */
    }
    .user-name {
      color: #333; /* Color del nombre de usuario */
      font-size: 14px; /* Tamaño del texto del nombre de usuario */
    }
  </style>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

  <!-- Sidebar -->
  <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<%=request.getContextPath()%>/AdminServlet?action=lista">
      <div class="sidebar-brand-icon rotate-n-15">
        <i class="fas fa-laugh-wink"></i>
      </div>
      <div class="sidebar-brand-text mx-3">JAPYLD <sup>TM</sup></div>
    </a>

    <!-- Divider -->

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
      MÓDULOS
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/AdminServlet?action=lista">
        <i class="fas fa-home"></i>
        <span>Inicio</span></a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/AdminServlet?action=listasPaginaVideojuegos">
        <i class="fas fa-gamepad"></i>
        <span>Videojuegos</span>
      </a>

    </li>
    <!-- Nav Item - Charts -->
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/AdminServlet?action=listaPaginaOfertas">
        <i class="far fa-money-bill-alt"></i>
        <span>Ofertas</span></a>
    </li>

    <!-- Nav Item - Tables -->
    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath()%>/JuegosReservadosServlet">
        <i class="fas fa-box-open"></i>
        <span>Reservas</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">
    <br>

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
      <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

  </ul>
  <!-- End of Sidebar -->

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">

    <!-- Main Content -->
    <div id="content">

      <!-- Topbar -->
      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
          <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Search -->

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

          <!-- Nav Item - Search Dropdown (Visible Only XS) -->
          <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                 aria-labelledby="searchDropdown">
              <form class="form-inline mr-auto w-100 navbar-search">
                <div class="input-group">
                  <input type="text" class="form-control bg-light border-0 small"
                         placeholder="Search for..." aria-label="Search"
                         aria-describedby="basic-addon2">
                  <div class="input-group-append">
                    <button class="btn btn-primary" type="button">
                      <i class="fas fa-search fa-sm"></i>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </li>

          <!-- Nav Item - Alerts -->

          <!-- Nav Item - Messages -->

          <div class="topbar-divider d-none d-sm-block"></div>

          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=personaSession.getNombre()%></span>
              <% for (ImagenPerfilDto fotoperfil : listaFotoPerfil) { %>
              <% if (personaSession.getIdPersona() == fotoperfil.getIdPersona()) { %>
              <img class="img-gaga"
                   src="<%=fotoperfil.getDireccion_archivo()%>"
                   alt="Avatar">
              <% } %>
              <% } %>
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                 aria-labelledby="userDropdown">
              <a class="dropdown-item" href="<%=request.getContextPath()%>/PerfilAdmiServlet">
                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                Ver Perfil
              </a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Salir
              </a>
            </div>
          </li>

        </ul>

      </nav>
      <% if (session.getAttribute("info") != null) {
        //if (request.getParameter("msg") != null) {%>
      <div id="mensaje" class="alert alert-success" role="alert">
        <%=session.getAttribute("info")%>
      </div>
      <%
          session.setAttribute("info", null);
        }
      %>
      <% if (session.getAttribute("err") != null) {
        //if (request.getParameter("msg") != null) {%>
      <div id="mensajeError" class="alert alert-danger" role="alert">
        <%=session.getAttribute("err")%>
      </div>
      <%
          session.setAttribute("err", null);
        }
      %>
      <!-- End of Topbar -->

      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Más detalles</h1>
        <!-- Content Row -->
        <div class="row">
          <div class="col-xl-4 col-lg-4">
            <!-- Donut Chart -->
            <div class="card shadow mb-4 border-left-primary">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary"><%=ventaJuegosGeneral.getNombreNuevo()%> </h6>
              </div>
              <div class="card-body text-center">
                <img src="<%=request.getContextPath()%>/Image?act=venta&id=<%=ventaJuegosGeneral.getIdVenta()%>" alt="Imagen" class="img-fluid">

                <div class="mt-3">
                  <h5>Género: <%=ventaJuegosGeneral.getCategoria().getNombre()%></h5>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-8 col-lg-8">
            <!-- Area Chart -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Información del Juego </h6>
              </div>
              <div class="card-body">

                <p class="text-justify"><%=ventaJuegosGeneral.getDescripcionNueva()%> </p>

                <div class="d-flex align-items-center mb-3">
                  <h6 class="mr-3">Consola: <%=ventaJuegosGeneral.getConsola().getNombre()%></h6>
                </div>
                <hr>
                <div class="d-flex justify-content-between align-items-center mb-3">

                  <div class="d-flex">
                    <span>Precio: S/. <%=ventaJuegosGeneral.getPrecioUsuario()%></span>
                  </div>
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">

                  <div class="d-flex">
                    <span>Cantidad de copias: <%=ventaJuegosGeneral.getCantidad()%></span>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
      <BR>
      <BR>

      <div class="row justify-content-center">
        <div class="col-auto">
          <a href="<%=request.getContextPath()%>/JuegosNuevosServlet?action=aceptar&id=<%=ventaJuegosGeneral.getIdVenta()%>" class="btn btn-success mr-5">ACEPTAR</a>
        </div>
        <div class="col-auto">
          <a href="<%=request.getContextPath()%>/JuegosNuevosServlet?action=rechazar&id=<%=ventaJuegosGeneral.getIdVenta()%>" class="btn btn-success mr-5 ml-5 btn-danger">RECHAZAR</a>
        </div>
        <div class="col-auto">
          <a href="<%=request.getContextPath()%>/JuegosNuevosServlet?action=contraoferta&id=<%=ventaJuegosGeneral.getIdVenta()%>" class="btn btn-primary ml-5 ">NUEVA OFERTA</a>
        </div>
        <BR>
        <BR>
        <BR>
        <BR>
      </div>
    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright © Japyld Solutions 2023</span>
        </div>
      </div>
    </footer>
    <!-- End of Footer -->

  </div>
  <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cerrar sesión</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Seleccione "Confirmar" si desea salir de su cuenta</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/LoginServlet?action=logout">Confirmar</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="../js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="../vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="../js/demo/chart-area-demo.js"></script>
<script src="../js/demo/chart-pie-demo.js"></script>

</body>

</html>
