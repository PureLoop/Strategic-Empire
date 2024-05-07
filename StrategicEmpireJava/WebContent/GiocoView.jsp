
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
boolean visualizza = true;
	Collection<?> giochi = (Collection<?>) request.getAttribute("giochi");
	if(giochi == null) {
		response.sendRedirect("./gioco");	
		return;
	}
	GiocoBean gioco = (GiocoBean) request.getAttribute("gioco");
	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.GiocoBean"%>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.Cart"%>

<head>
    <link rel="stylesheet" href="GiocoStyle.css">
    
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<title>Strategic-Empire</title>
	<style>
    
        
</style>

</head>

<body>
<header>
	<%@ include file="/header/header.jsp" %>
    </header>
<form action="gioco" method="post" id="form-filtro">
		<input type="hidden" name="action" value="filter">
<table id="game-table">
    <tr>
        <td>
           <select id="game-type" name="tipologia" required>
			    <option value="" selected>Tipo di gioco</option>
			    <option value="Tutti">Tutti</option>
			    <option value="tavolo">Tavolo</option>
			    <option value="carte">Carte</option>
		  </select>

        </td>
        <td>
            <input type="number" name="N_giocatori" id="num-players" name="num-players" min="1" max="10" placeholder="Numero giocatori">
        </td>
        <td>
            <input type="number" name="prezzo" id="priceInput" name="num-players" min="1" max="1000" placeholder="Prezzo">
        </td>
        <td>
            <button type="submit" class="submit-button">Filtra</button>
        </td>
    </tr>
</table>
</form>

<%
    boolean showAllGames = true; // Imposta a true se vuoi mostrare tutti i giochi inizialmente
    if (request.getAttribute("giochiFiltrati") != null) {
        showAllGames = false; // Se ci sono giochi filtrati, non mostrare tutti i giochi
    }
%>

<div class="row" id="allGames" <% if (!showAllGames) { %>style="display: none;"<% } %>>
    <!-- Questo è l'elenco di tutti i giochi -->
    <% 
    if (giochi != null && giochi.size() != 0) { 
        Iterator<?> it = giochi.iterator(); 
        while (it.hasNext()) { 
            GiocoBean bean = (GiocoBean) it.next(); 
    %>
    <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">
            <a class="no-underline card-link" href="DettagliControl?cod_gioco=<%=bean.getCod_Gioco()%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomegioco()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
                    <a href="CarrelloControl?cod_gioco=<%=bean.getCod_Gioco()%>"><img src="IMMAGINI/carrelloICON.png" class="icon-carrello"></a>
                </div>
            </a>
        </div>
    </div>
    <% 
        }
    } else { 
    %>
    <div class="col-sm-12 mb-3">
        <p>Nessun gioco disponibile</p>
    </div>
    <% } %>
</div>

<div class="row" id="filteredGames" <% if (showAllGames) { %>style="display: none;"<% } %>>
    <!-- Questo è l'elenco dei giochi filtrati -->
    <% 
    Collection<?> giochiFiltrati = (Collection<?>) request.getAttribute("giochiFiltrati");
    if (giochiFiltrati != null && !giochiFiltrati.isEmpty()) { 
        Iterator<?> it = giochiFiltrati.iterator(); 
        while (it.hasNext()) { 
            GiocoBean bean = (GiocoBean) it.next(); 
    %>
    <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">
            <a class="no-underline card-link" href="DettagliControl?cod_gioco=<%=bean.getCod_Gioco()%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomegioco()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
                    <a href="CarrelloControl?cod_gioco=<%=bean.getCod_Gioco()%>"><img src="IMMAGINI/carrelloICON.png" class="icon-carrello"></a>
                </div>
            </a>
        </div>
    </div>
    <% 
        }
    } else { 
    %>
    <div class="col-sm-12 mb-3">
        <p>Nessun gioco filtrato</p>
    </div>
    <% } %>
</div>


			
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>
