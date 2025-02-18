<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyecto_final_base_japyld.UsuarioJapyld.ModelsJ.DtoJ.MasDetallesDto" %>
<%@ page import="com.example.proyecto_final_base_japyld.BeansGenerales.Comentarios" %>
<%@ page import="com.example.proyecto_final_base_japyld.UsuarioJapyld.ModelsJ.DtoJ.ConsolasDetallesDto" %>
<%@ page import="com.example.proyecto_final_base_japyld.BeansGenerales.JuegosCompradosReservados" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.example.proyecto_final_base_japyld.UsuarioJapyld.ModelsJ.DtoJ.ImagenPerfilDto" %>
<jsp:useBean id="textoBusqueda" scope="request" type="java.lang.String" class="java.lang.String"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<Comentarios> listaComentarios = (ArrayList<Comentarios>) request.getAttribute("listaComentarios"); %>
<% ArrayList<MasDetallesDto> listaMasDetallesJuego = (ArrayList<MasDetallesDto>) request.getAttribute("listaMasDetallesJuego"); %>
<% ArrayList<ConsolasDetallesDto> listaConsolaPorJuego = (ArrayList<ConsolasDetallesDto>) request.getAttribute("listaConsolaPorJuego");%>
<% ArrayList<JuegosCompradosReservados> listaRating = (ArrayList<JuegosCompradosReservados>) request.getAttribute("listaRating"); %>
<% ArrayList<ImagenPerfilDto> listaFotoPerfil = (ArrayList<ImagenPerfilDto>) request.getAttribute("listaFotoPerfil"); %>

<jsp:useBean id="personaSession" type="com.example.proyecto_final_base_japyld.BeansGenerales.Personas" scope="session" class="com.example.proyecto_final_base_japyld.BeansGenerales.Personas"/>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Charts</title>

  <!-- Custom fonts for this template-->
  <link href="recursos/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
          href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="recursos/css/sb-admin-2.min.css" rel="stylesheet">
  <style>
    .img_juego_grande {
      width: 275px;
      height: 340px;
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
  <jsp:include page="/Includes/UsuarioJapyld/SidebarGeneral.jsp">
    <jsp:param name="title" value="Pagina Principal"/>
  </jsp:include>
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
        <ul class="navbar-nav ml-auto"> <!-- Eliminamos "mr-auto" y "ml-auto" -->
          <!-- Nav Item - Search Dropdown (Visible Only XS) -->
          <!-- Nav Item - Alerts -->
          <!-- Nav Item - Messages -->
          <div class="topbar-divider d-none d-sm-block"></div>

          <!-- Nav Item - User Information -->
          <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button"
               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="mr-2 d-none d-lg-inline text-gray-600 small user-name"><%=personaSession.getNombre()%></span>
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
              <a class="dropdown-item" href="<%=request.getContextPath()%>/PerfilUsuarioServlet">
                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                Ver Perfil
              </a>

              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?action=logout" data-toggle="modal" data-target="#logoutModal">
                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                Salir
              </a>
            </div>
          </li>
        </ul>
      </nav>
      <!-- End of Topbar -->
      <% for (MasDetallesDto juego :listaMasDetallesJuego){%>
      <!-- Begin Page Content -->
      <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-700">Más detalles</h1>
        <!-- Content Row -->
        <div class="row">
          <div class="col-xl-4 col-lg-4">
            <!-- Donut Chart -->
            <div class="card shadow mb-4 border-left-primary">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary"><%=juego.getNombreJuegos()%></h6>
              </div>
              <div class="card-body text-center">
                <img src="<%=request.getContextPath()%>/Image?act=juego&id=<%=juego.getIdImagen()%>" class="img-fluid img_juego_grande" alt="Imagen">
                <div class="mt-3">
                  <%int contador = 0;%>
                  <%int suma = 0;%>
                  <%int puntuacion = 0;%>
                  <% for (JuegosCompradosReservados rating :listaRating){
                    if(rating.getRating() != 0) {
                      contador = contador + 1;
                      suma = suma + rating.getRating();
                    }
                  }%>
                  <%
                  if(suma != 0 && contador != 0) {
                    puntuacion = suma/contador;
                  }
                  %>
                  <%
                    int validPunt = 0;
                    if(puntuacion >= 0 && puntuacion <= 1){
                      validPunt = 1;
                    }
                    if(puntuacion >= 1 && puntuacion <= 2){
                      validPunt = 2;
                    }
                    if(puntuacion >= 2 && puntuacion <= 3){
                      validPunt = 3;
                    }
                    if(puntuacion >= 3 && puntuacion <= 4){
                      validPunt = 4;
                    }
                    if(puntuacion >= 4 && puntuacion <= 5){
                      validPunt = 5;
                    }
                  %>

                  <h5 class="mb-0">Rating:</h5>
                  <div class="rating">
                    <%if(validPunt == 1){%>
                      <span class="star">&#9733;</span>
                    <%}%>
                    <%if(validPunt == 2){%>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                    <%}%>
                    <%if(validPunt == 3){%>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                    <%}%>
                    <%if(validPunt == 4){%>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>

                    <%}%>
                    <%if(validPunt == 5){%>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                      <span class="star">&#9733;</span>
                    <%}%>
                  </div>
                  <h5>Categoría: <%=juego.getCategoria()%> </h5>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-8 col-lg-8">
            <!-- Area Chart -->
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Información del Juego</h6>
              </div>
              <div class="card-body">
                <p class="text-justify"><%=juego.getDescripcion()%></p>
                <hr>
                <p class="text-justify">Si deseas comprar este juego, debes elegir la consola en la que lo desees.</p>
                <div class="d-flex align-items-center mb-3">
                  <h6 class="mr-3">Consola:</h6>
                  <div class="row">
                    <% for (ConsolasDetallesDto consola: listaConsolaPorJuego){%>
                    <% if(consola.getConsola1() != null){ %>
                    <div class="col">
                      <button type="button" class="btn btn-primary" onclick="mostrarBoton('PS5')">PS5</button>
                    </div>
                    <% } %>
                    <% if(consola.getConsola2() != null){ %>
                    <div class="col">
                      <button type="button" class="btn btn-primary" onclick="mostrarBoton('PS4')">PS4</button>
                    </div>
                    <% } %>
                    <% if(consola.getConsola3() != null){ %>
                    <div class="col">
                      <button type="button" class="btn btn-primary" onclick="mostrarBoton('XB3')">XB3</button>
                    </div>
                    <% } %>
                    <% if(consola.getConsola4() != null){ %>
                    <div class="col">
                      <button type="button" class="btn btn-primary" onclick="mostrarBoton('XBO')">XBO</button>
                    </div>
                    <% } %>
                    <% if(consola.getConsola5() != null){ %>
                    <div class="col">
                      <button type="button" class="btn btn-primary" onclick="mostrarBoton('SWI')">SWI</button>
                    </div>
                    <% } %>
                    <% if(consola.getConsola6() != null){ %>
                    <div class="col">
                      <button type="button" class="btn btn-primary" onclick="mostrarBoton('WIU')">WIU</button>
                    </div>
                    <% } %>
                    <% } %>
                  </div>
                </div>
                <hr>
                <div class="d-flex justify-content-between">
                  <div>
                    <% if (juego.getPrecio_nuevo() == 0) { %>
                    <label>
                      Stock: <%= juego.getStock()%>
                    </label>

                    <div class="btn-success disabled" style="padding: 0.375rem 0.75rem; border: 1px solid transparent; border-radius: 0.25rem; background:#1cc88a ">
                      Precio: S/. <%= juego.getPrecio() %>
                    </div>
                    <% } else { %>
                    <label>
                      Stock: <%= juego.getStock()%>
                    </label>

                    <div class="btn-success disabled" style="padding: 0.375rem 0.75rem; border: 1px solid transparent; border-radius: 0.25rem; background-image:#1cc88a ">
                      Precio: S/. <%= juego.getPrecio_nuevo() %>
                    </div>
                    <% } %>
                  </div>
                  <%if(juego.getStock() != 0){%>
                  <div id="comprarButton">
                  </div>
                  <%}%>
                </div>
              </div>
            </div>

            <script>
              function mostrarBoton(consola) {
                var comprarButton = document.getElementById('comprarButton');
                comprarButton.innerHTML = '<a href="' + obtenerURLConsola(consola) + '" class="btn btn-success">Comprar</a>';
              }

              function obtenerURLConsola(consola) {
                switch (consola) {
                  case 'PS5':
                    return '<%=request.getContextPath()%>/PaginaCompra?idjuego=<%=juego.getIdJuegos()%>&consola=PS5';
                  case 'PS4':
                    return '<%=request.getContextPath()%>/PaginaCompra?idjuego=<%=juego.getIdJuegos()%>&consola=PS4';
                  case 'XB3':
                    return '<%=request.getContextPath()%>/PaginaCompra?idjuego=<%=juego.getIdJuegos()%>&consola=XB3';
                  case 'XBO':
                    return '<%=request.getContextPath()%>/PaginaCompra?idjuego=<%=juego.getIdJuegos()%>&consola=XBO';
                  case 'SWI':
                    return '<%=request.getContextPath()%>/PaginaCompra?idjuego=<%=juego.getIdJuegos()%>&consola=SWI';
                  case 'WIU':
                    return '<%=request.getContextPath()%>/PaginaCompra?idjuego=<%=juego.getIdJuegos()%>&consola=WIU';
                  default:
                    return '#'; // En caso de que no haya URL definida para la consola seleccionada
                }
              }
            </script>
            <% if (!listaComentarios.isEmpty()) { %>
            <div class="card shadow mb-4">
              <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Comentarios de Usuarios</h6>
              </div>
              <div class="card-body">
                <div class="media mb-4">
                  <img class="mr-3 rounded-circle" src="" alt="">
                  <div class="media-body">
                    <div class="d-flex justify-content-between">
                      <h6 class="mt-0 text-gray-900"><%= listaComentarios.get(0).getPersonaComentario().getNombre() %></h6>
                      <%Timestamp time1 = listaComentarios.get(0).getFecha_comentario1();%>
                      <%SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");%>
                      <%String formattedTimestamp1 = sdf1.format(time1);%>
                      <h6 class="mt-0"><%= formattedTimestamp1 %></h6>
                    </div>
                    <p class="text-justify"><%= listaComentarios.get(0).getComentario() %></p>
                  </div>
                </div>
                <div id="comentariosExtras" style="display: none;">
                  <% for (int i = 1; i < listaComentarios.size(); i++) { %>
                  <% Comentarios comentario = listaComentarios.get(i); %>
                  <div class="media mb-4">
                    <img class="mr-3 rounded-circle" src="" alt="">
                    <div class="media-body">
                      <hr>
                      <div class="d-flex justify-content-between">
                        <h6 class="mt-0 text-gray-900"><%= comentario.getPersonaComentario().getNombre() %></h6>
                        <%Timestamp time = comentario.getFecha_comentario1();%>
                        <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");%>
                        <%String formattedTimestamp = sdf.format(time);%>
                        <h6 class="mt-0"><%= formattedTimestamp %></h6>
                      </div>
                      <p class="text-justify"><%= comentario.getComentario() %></p>
                    </div>
                  </div>
                  <% } %>
                </div>
                <% if (listaComentarios.size() >= 1) { %>
                <div class="d-flex justify-content-between">
                  <div>
                    <button id="verMasBtn" class="btn btn-primary btn-sm">Ver más comentarios</button>
                  </div>
                  <div>
                    <button id="añadirComentarioBtn" class="btn btn-success btn-sm justify-content-lg-end">Añade un comentario</button>
                  </div>
                </div>
                <div>
                  <button id="ocultarBtn" class="btn btn-danger btn-sm" style="display: none;">Ocultar comentarios</button>
                </div>
                <% } %>
                <!-- Agrega paginación aquí -->
              </div>
            </div>

            <!-- Formulario para añadir un comentario -->
            <div id="comentarioForm" style="display: none;">
              <form class="user" method="POST" action="<%=request.getContextPath()%>/MasDetallesJuego?idjuego=<%=juego.getIdJuegos()%>&idpersona=<%=personaSession.getIdPersona()%>">
                <div class="form-group">
                  <textarea class="form-control" name="Comentario" rows="3" placeholder="Ingresa tu comentario"></textarea>

                  <%
                    LocalDateTime fechaActual = LocalDateTime.now();
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                    String fechaActualStr = fechaActual.format(formatter);
                  %>
                  <input type="hidden" class="form-control" name="fecha" value="<%= fechaActualStr %>">
                </div>

                <button type="submit" class="btn btn-primary">Enviar comentario</button>
              </form>
            </div>

            <script>
              var comentariosExtras = document.getElementById("comentariosExtras");
              var verMasBtn = document.getElementById("verMasBtn");
              var ocultarBtn = document.getElementById("ocultarBtn");
              var añadirComentarioBtn = document.getElementById("añadirComentarioBtn");
              var comentarioForm = document.getElementById("comentarioForm");

              verMasBtn.addEventListener("click", function() {
                comentariosExtras.style.display = "block";
                verMasBtn.style.display = "none";
                ocultarBtn.style.display = "block";
                añadirComentarioBtn.style.display = "none";
              });

              ocultarBtn.addEventListener("click", function() {
                comentariosExtras.style.display = "none";
                verMasBtn.style.display = "block";
                ocultarBtn.style.display = "none";
                añadirComentarioBtn.style.display = "block";
              });

              añadirComentarioBtn.addEventListener("click", function() {
                comentarioForm.style.display = "block";
              });
            </script>

            <%}%>
            <% if (listaComentarios.isEmpty()) { %>
            <form class="user" method="POST" action="<%=request.getContextPath()%>/MasDetallesJuego?idjuego=<%=juego.getIdJuegos()%>&idpersona=<%=personaSession.getIdPersona()%>">
              <div class="form-group">
                <textarea class="form-control" name="Comentario" rows="3" placeholder="Ingresa tu comentario"></textarea>

                <%
                  LocalDateTime fechaActual = LocalDateTime.now();
                  DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                  String fechaActualStr = fechaActual.format(formatter);
                %>
                <input type="hidden" class="form-control" name="fecha" value="<%= fechaActualStr %>">
              </div>
              <button type="submit" class="btn btn-primary">Enviar comentario</button>
            </form>
            <% } %>
          </div>
        </div>

      </div>
      <!-- /.container-fluid -->
      <% } %>
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
      <div class="modal-body">Seleccione "Confirmar" si desera salir de su cuenta.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Camcelar</button>
        <a class="btn btn-primary" href="<%=request.getContextPath()%>/LoginServlet?action=logout">Confirmar</a>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="recursos/vendor/jquery/jquery.min.js"></script>
<script src="recursos/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="recursos/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="recursos/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="recursos/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="recursos/js/demo/chart-area-demo.js"></script>
<script src="recursos/js/demo/chart-pie-demo.js"></script>
<script src="recursos/js/demo/chart-bar-demo.js"></script>

</body>
</html>
