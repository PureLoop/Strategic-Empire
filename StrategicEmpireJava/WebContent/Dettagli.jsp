<%@ page import="java.util.*,it.unisa.bean.GiocoBean" %>
<%@ page import="java.util.*,it.unisa.bean.AccessorioBean" %>
<%@ page import="java.util.*,it.unisa.bean.espansioneBean" %>
<%@ page import="java.net.URLEncoder" %>

<%
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
                        <form action="AggiungiAlCarrello.jsp" method="post">
                            <input type="hidden" name="cod_gioco" value="<%= gioco.getCod_Gioco() %>">
                            <input type="hidden" name="nome_gioco" value="<%= gioco.getNomegioco() %>">
                            <input type="hidden" name="prezzo" value="<%= gioco.getPrezzo() %>">
                            <a href="javascript:void(0);" class="custom-button" data-cod-gioco="<%= gioco.getCod_Gioco() %>">Aggiungi al Carrello</a>
                        </form>
                        <!-- Logo PayPal -->
                        
                    </div>
                </div>
        </div>
    </div>
</div>

    <script>
                    $(document).ready(function() {
                        $('.custom-button').off('click').on('click', function(event) {
                            event.preventDefault(); // Prevenire la navigazione
                            var codGioco = $(this).data('cod-gioco');

                            $.ajax({
                                url: 'CarrelloControl',
                                method: 'POST',
                                data: {
                                    action: 'AddGioco',
                                    cod_gioco: codGioco
                                },
                                success: function(response) {
                                    // Aggiorna la visualizzazione del carrello o altre azioni dopo l'aggiunta al carrello
                                },
                                error: function(xhr, status, error) {
                                    console.log("Errore durante l'aggiunta al carrello");
                                }
                            });
                        });
                    });
                </script>
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
                    <form action="AggiungiAlCarrello.jsp" method="post">
                        <input type="hidden" name="cod_gioco" value="<%= accessorio.getCod_Accessorio() %>">
                        <input type="hidden" name="nome_gioco" value="<%= accessorio.getNomeaccessorio() %>">
                        <input type="hidden" name="prezzo" value="<%= accessorio.getPrezzo() %>">
                        <a href="javascript:void(0);" class="custom-button" data-cod-acc="<%= accessorio.getCod_Accessorio() %>">Aggiungi al Carrello</a>
                    </form>
                </div>
            </div>          
        </div>
    </div>
</div>
<script>
                $(document).ready(function() {
                    $('.custom-button').off('click').on('click', function(event) {
                        event.preventDefault(); // Prevenire la navigazione
                        var codAcc = $(this).data('cod-acc');

                        $.ajax({
                            url: 'CarrelloControl',
                            method: 'POST',
                            data: {
                                action: 'AddAccessorio',
                                cod_accessorio: codAcc
                            },
                            success: function(response) {
                                // Aggiorna la visualizzazione del carrello o altre azioni dopo l'aggiunta al carrello
                            },
                            error: function(xhr, status, error) {
                                console.log("Errore durante l'aggiunta al carrello");
                            }
                        });
                    });
                });
            </script>
 <% 
    } else if (DES_VER == 3) {
        espansioneBean espansione = (espansioneBean) request.getAttribute("cod_espansione");
%>
<!-- Se DES_VER è 2, mostra le informazioni dell'accessorio -->
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
                    <form action="AggiungiAlCarrello.jsp" method="post">
                        <input type="hidden" name="cod_gioco" value="<%= espansione.getCod_espansione() %>">
                        <input type="hidden" name="nome_gioco" value="<%=espansione.getNomeespansione() %>">
                        <input type="hidden" name="prezzo" value="<%= espansione.getPrezzo() %>">
                        <a href="javascript:void(0);" class="custom-button" data-cod-esp="<%=espansione.getCod_espansione() %>">Aggiungi al Carrello</a>
                    </form>
                    <!-- Logo PayPal -->
                   
                </div>
            </div>
            <script>
                $(document).ready(function() {
                    $('.custom-button').off('click').on('click', function(event) {
                        event.preventDefault(); // Prevenire la navigazione
                        var codEsp = $(this).data('cod-esp');

                        $.ajax({
                            url: 'CarrelloControl',
                            method: 'POST',
                            data: {
                                action: 'AddEspansione',
                                cod_espansione: codEsp
                            },
                            success: function(response) {
                                // Aggiorna la visualizzazione del carrello o altre azioni dopo l'aggiunta al carrello
                            },
                            error: function(xhr, status, error) {
                                console.log("Errore durante l'aggiunta al carrello");
                            }
                        });
                    });
                });
            </script>
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
