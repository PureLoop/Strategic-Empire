<%@ page import="java.util.*,it.unisa.bean.GiocoBean" %>
<%@ page import="java.util.*,it.unisa.bean.AccessorioBean" %>
<%@ page import="java.util.*,it.unisa.bean.espansioneBean" %>
<%@ page import="java.net.URLEncoder" %>

<%

String username = null; // Default value if not logged in

if (session != null && session.getAttribute("user") != null) {
    User user = (User) session.getAttribute("user");
    username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
}

    // Recupera il valore di DES_VER dalla richiesta
    Integer DES_VER = Integer.parseInt(request.getParameter("DES"));
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/DettagliStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<style>


.add-gioco-to-cart {
            position: relative;
            right: 30%;
            margin-top: 20px;
            float: right;
            margin-left:20px;
            padding: 10px 20px;
            background-color: #00BFFF;
            border: 2px solid #00BFFF;
            border-radius: 20px; /* Arrotonda i bordi */
            color: white;
            text-decoration: none; /* Rimuove la sottolineatura */
            transition: background-color 0.3s, color 0.3s;
        }

        .cadd-gioco-to-cart:hover {
            background-color: white;
            color: #00BFFF;
            text-decoration: none; /* Rimuove la sottolineatura anche quando ci passi sopra */
        }
        
        .add-acc-to-cart {
            position: relative;
            right: 30%;
            margin-top: 20px;
            float: right;
            margin-left:20px;
            padding: 10px 20px;
            background-color: #00BFFF;
            border: 2px solid #00BFFF;
            border-radius: 20px; /* Arrotonda i bordi */
            color: white;
            text-decoration: none; /* Rimuove la sottolineatura */
            transition: background-color 0.3s, color 0.3s;
        }

        .cadd-acc-to-cart:hover {
            background-color: white;
            color: #00BFFF;
            text-decoration: none; /* Rimuove la sottolineatura anche quando ci passi sopra */
        }
        
        
        .add-esp-to-cart {
            position: relative;
            right: 30%;
            margin-top: 20px;
            float: right;
            margin-left:20px;
            padding: 10px 20px;
            background-color: #00BFFF;
            border: 2px solid #00BFFF;
            border-radius: 20px; /* Arrotonda i bordi */
            color: white;
            text-decoration: none; /* Rimuove la sottolineatura */
            transition: background-color 0.3s, color 0.3s;
        }

        .cadd-esp-to-cart:hover {
            background-color: white;
            color: #00BFFF;
            text-decoration: none; /* Rimuove la sottolineatura anche quando ci passi sopra */
        }
        
        
        </style>
<body>
    <%@ include file="/header/header.jsp" %>

    <% 
        // Verifica il valore di DES_VER
        if (DES_VER == 1) {
            GiocoBean gioco = (GiocoBean) request.getAttribute("cod_gioco");
    %>
    <!-- Se DES_VER è 1, mostra le informazioni del gioco -->
    <div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="title-box">
                <h2 class="game-title"><%= gioco.getNomegioco() %></h2>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="container-img">
                <div id="carouselExampleIndicators" class="carousel slide">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%= gioco.getImmagineCop() %>" class="d-block w-100 img-fluid" alt="<%= gioco.getNomegioco() %>">
                        </div>
                        <div class="carousel-item">
                            <img src="<%= gioco.getImmagine2() %>" class="d-block w-100 img-fluid" alt="<%= gioco.getNomegioco() %>">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="description">
                    <h3 class="pastel-green">Descrizione</h3>
                    <p><%= gioco.getDescrizione() %></p>
                </div>
                <div class="details mt-4">
                    <p><strong>Codice:</strong> <%= gioco.getCod_Gioco() %></p>
                    <p><strong>Edizione:</strong> <%= gioco.getEdizione() %></p>
                    <p><strong>Tipologia:</strong> <%= gioco.getTipologia() %></p>
                </div>
                <div class="buy-now mt-4">
                    <div class="panel d-flex align-items-center justify-content-between">
                        <!-- Informazioni sul prodotto -->
                        <div class="product-info">
                            <h5><%= gioco.getNomegioco() %></h5>
                            <h5><%= gioco.getPrezzo() %> &euro;</h5>
                        </div>
                        <!-- Bottone "Aggiungi al Carrello" con tutti i dati -->
                        <form>
                            <input type="hidden" name="cod_gioco" value="<%= gioco.getCod_Gioco() %>">
                            <input type="hidden" name="nome_gioco" value="<%= gioco.getNomegioco() %>">
                            <input type="hidden" name="prezzo" value="<%= gioco.getPrezzo() %>">
<!-- Bottone "Aggiungi al Carrello" con tutti i dati -->
<a href="javascript:void(0);" class="add-gioco-to-cart" 
   data-cod-gioco="<%= gioco.getCod_Gioco() %>" 
   data-username="<%= username %>">Aggiungi al Carrello</a>

						<script src="js/addToCart.js"></script>

                        </form>
                        <!-- Logo PayPal -->
                        
                    </div>
                </div>
        </div>
    </div>
</div>

    <% 
    } else if (DES_VER == 2) {
        AccessorioBean accessorio = (AccessorioBean) request.getAttribute("cod_accessorio");
%>
<!-- Se DES_VER è 2, mostra le informazioni dell'accessorio -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="title-box">
                <h2 class="game-title"><%= accessorio.getNomeaccessorio() %></h2>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-6">
    <div class="container-img">
        <div id="carouselExampleIndicators" class="carousel slide">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="<%= accessorio.getImmagineCop() %>" class="d-block w-100 img-fluid" alt="<%= accessorio.getNomeaccessorio() %>">
                </div>
                <div class="carousel-item">
                    <img src="<%= accessorio.getImmagine2() %>" class="d-block w-100 img-fluid" alt="<%= accessorio.getNomeaccessorio() %>">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
</div>
        <div class="col-md-6 negro">
            <div class="description">
                <h3 class="pastel-green">Descrizione</h3>
                <p><%= accessorio.getDescrizione() %></p>
            </div>
            <div class="details mt-4">
                <p><strong>Codice:</strong> <%= accessorio.getCod_Accessorio() %></p>
            </div>
            <div class="buy-now mt-4">
                <div class="panel d-flex align-items-center justify-content-between">
                    <!-- Informazioni sul prodotto -->
                    <div class="product-info">
                        <h5><%= accessorio.getNomeaccessorio() %></h5>
                        <h5><%= accessorio.getPrezzo() %> &euro;</h5>
                    </div>
                    <!-- Bottone "Aggiungi al Carrello" con tutti i dati -->
                    <div class="sposta-destra">
                    <form >
                        <input type="hidden" name="cod_accessorio" value="<%= accessorio.getCod_Accessorio() %>">
                        <input type="hidden" name="nome_accessorio" value="<%= accessorio.getNomeaccessorio() %>">
                        <input type="hidden" name="prezzo" value="<%= accessorio.getPrezzo() %>">
<a href="javascript:void(0);" class="add-acc-to-cart" 
   data-cod-accessorio="<%= accessorio.getCod_Accessorio() %>" 
   data-username="<%= username %>">Aggiungi al Carrello</a>                        						
   <script src="js/addToCart.js"></script>
                        
                        
                    </form>
                    </div>
                </div>
            </div>          
        </div>
    </div>
</div>

 <% 
} else if (DES_VER == 3) {
    espansioneBean espansione = (espansioneBean) request.getAttribute("cod_espansione");
%>
<!-- Se DES_VER è 3, mostra le informazioni dell'espansione -->
<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <div class="title-box">
                <h2 class="game-title"><%= espansione.getNomeespansione() %></h2>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="container-img">
                <div id="carouselExampleIndicators" class="carousel slide">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="<%= espansione.getImmagineCop() %>" class="d-block w-100 img-fluid" alt="<%= espansione.getNomeespansione() %>">
                        </div>
                        <div class="carousel-item">
                            <img src="<%= espansione.getImmagine2() %>" class="d-block w-100 img-fluid" alt="<%= espansione.getNomeespansione() %>">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="description">
                <h3 class="pastel-green">Descrizione</h3>
                <p><%= espansione.getDescrizione() %></p>
            </div>
            <div class="details mt-4">
                <p><strong>Codice:</strong> <%= espansione.getCod_espansione() %></p>
            </div>
            <div class="buy-now mt-4">
                <div class="panel d-flex align-items-center justify-content-between">
                    <!-- Informazioni sul prodotto -->
                    <div class="product-info">
                        <h5><%= espansione.getNomeespansione() %></h5>
                        <h5><%= espansione.getPrezzo() %> &euro;</h5>
                    </div>
                    <!-- Bottone "Aggiungi al Carrello" con tutti i dati -->
                    <form>
                        <input type="hidden" name="cod_espansione" value="<%= espansione.getCod_espansione() %>">
                        <input type="hidden" name="nome_espansione" value="<%= espansione.getNomeespansione() %>">
                        <input type="hidden" name="prezzo" value="<%= espansione.getPrezzo() %>">
<a href="javascript:void(0);" class="add-esp-to-cart" 
   data-cod-espansione="<%= espansione.getCod_espansione() %>" 
   data-username="<%= username %>">Aggiungi al Carrello</a>
   						<script src="js/addToCart.js"></script>
   
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<% 
    } // Fine del blocco if DES_VER == 2
%>

<!-- FOOTER -->
    <footer>
      <%@ include file="/footer/footer.jsp" %>
    </footer>
<!-- Bootstrap JS e dipendenze -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>


</body>
</html>
