<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
boolean visualizza = true;
	Collection<?> espansioni = (Collection<?>) request.getAttribute("espansioni");
	if(espansioni == null) {
		response.sendRedirect("./espansione");	
		return;
	}
	 espansioneBean espansione = (espansioneBean) request.getAttribute("espansione");

	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.espansioneBean"%>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.Cart"%>

<head>
    <link rel="stylesheet" href="GiocoStyle.css">
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<title>Strategic-Empire</title>
	<style>
    
        
</style>

</head>

<body>
<header>
	<%@ include file="/header/header.jsp" %>
    </header>
<form action="gioco" method="post" id="form-filtro" style="margin-top: 0%;">
    <input type="hidden" name="action" value="filter">
    <table id="game-table" style="width: 100%;">
        <tr>
            <td style="width: 25%;">
                <select id="game-type" name="tipologia" required style="width: 100%;">
                    <option value="" selected>Tipo di gioco</option>
                    <option value="Tutti">Tutti</option>
                    <option value="tavolo">Tavolo</option>
                    <option value="carte">Carte</option>
                </select>
            </td>
            <td style="width: 25%;">
                <input type="number" name="N_giocatori" id="num-players" name="num-players" min="1" max="10" placeholder="Numero giocatori" style="width: 100%;">
            </td>
            <td style="width: 25%;">
                <input type="number" name="prezzo" id="priceInput" name="num-players" min="1" max="1000" placeholder="Prezzo" style="width: 100%;">
            </td>
            <td style="width: 25%;">
                <button type="submit" class="submit-button" style="width: 100%;">Filtra</button>
            </td>
        </tr>
    </table>
</form>

<%
    boolean showAllGames = true; // Imposta a true se vuoi mostrare tutti i giochi inizialmente
    if (request.getAttribute("espansioniFiltrate") != null) {
        showAllGames = false; // Se ci sono giochi filtrati, non mostrare tutti i giochi
    }
%>

<div class="row" id="allGames" <% if (!showAllGames) { %>style="display: none;"<% } %>>
    <!-- Questo è l'elenco di tutte le espansioni -->
    <% 
    if (espansioni != null && espansioni.size() != 0) { 
        Iterator<?> it = espansioni.iterator(); 
        while (it.hasNext()) { 
           espansioneBean bean = (espansioneBean) it.next(); 
    %>
    <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">
            <a class="no-underline card-link" href="DettagliControl?cod_espansione=<%=bean.getCod_espansione()%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomeespansione()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
					<a href="javascript:void(0);" data-cod-espansione="<%=bean.getCod_espansione()%>" class="add-to-cart">
					<img src="IMMAGINI/carrelloICON.png" class="icon-carrello">                </div>
            </a>
        </div>
    </div>
    <% 
        }
    } else { 
    %>
    <div class="col-sm-12 mb-3">
        <p>Nessun espansione disponibile</p>
    </div>
    <% } %>
</div>
<div class="row" id="filteredGames" <% if (showAllGames) { %>style="display: none;"<% } %>>
    <!-- Questo è l'elenco degli espansioni filtrati -->
    <% 
    Collection<?> espansioniFiltrate = (Collection<?>) request.getAttribute("espansioniFiltrate");
    if (espansioniFiltrate != null && !espansioniFiltrate.isEmpty()) { 
        Iterator<?> it = espansioniFiltrate.iterator(); 
        while (it.hasNext()) { 
            espansioneBean bean = (espansioneBean) it.next(); 
    %>
    <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">
            <a class="no-underline card-link" href="DettagliControl?cod_espansione=<%=bean.getCod_espansione()%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomeespansione()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
					<a href="CarrelloControl?action=AddEspansione&cod_espansione=<%=bean.getCod_espansione()%>">
    <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
</a>
                </div>
            </a>
        </div>
    </div>
    <% 
        }
    } else { 
    %>
    <div class="col-sm-12 mb-3">
        <p>Nessun espansione filtrato</p>
    </div>
    <% } %>
</div>
<script>
$(document).ready(function() {
            $('.add-to-cart').off('click').on('click', function(event) {
                event.preventDefault(); // Prevenire la navigazione
                var codEsp = $(this).data('cod-espansione');

                $.ajax({
                    url: 'CarrelloControl',
                    method: 'POST',
                    data: {
                        action: 'AddEspansione',
                        cod_espansione: codEsp
                    },
                    success: function(response) {
                    },
                    error: function(xhr, status, error) {
                    }
                });
            });
        });
    </script>
			
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>