<%@ page import="java.util.*, it.unisa.GiocoBean" %>
<%@ page import="java.net.URLEncoder" %>

<%
    GiocoBean gioco = (GiocoBean) request.getAttribute("cod_gioco");
%>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettagli Gioco - <%= gioco.getNomegioco() %></title>
    <link rel="stylesheet" href="DettagliStyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/css/bootstrap.min.css">
</head>
<body>
    <header>
        <%@ include file="/header/header.jsp" %>
    </header>


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
                <img src="<%= gioco.getImmagineCop() %>" class="img-fluid" alt="<%= gioco.getNomegioco() %>">
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
                    <div class="product-info">
                        <h5><%= gioco.getNomegioco() %></h5>
                        <h5><%= gioco.getPrezzo() %> &euro;</h5>
                    </div>
                    <form action="AggiungiAlCarrello.jsp" method="post">
                        <input type="hidden" name="cod_gioco" value="<%= gioco.getCod_Gioco() %>">
                        <input type="hidden" name="nome_gioco" value="<%= gioco.getNomegioco() %>">
                        <input type="hidden" name="prezzo" value="<%= gioco.getPrezzo() %>">
                        <button type="submit" class="btn btn-primary">Aggiungi al Carrello</button>
                    </form>
							<div class="col-md-6 mt-4">
						    <a href="https://www.paypal.com">
						        <img src="IMMAGINI/paypal.png" alt="Immagine Cliccabile" class="img-fluid paypal-logo">
						    </a>
						</div>
                </div>
            </div>
        </div>
    </div>
</div>




    <footer>
        <%@ include file="/footer/footer.jsp" %>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
