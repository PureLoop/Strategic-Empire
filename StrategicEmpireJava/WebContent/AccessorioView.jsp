<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
boolean visualizza = true;
	Collection<?> accessori = (Collection<?>) request.getAttribute("accessori");
	if(accessori == null) {
		response.sendRedirect("./accessorio");	
		return;
	}
	 AccessorioBean accessorio = (AccessorioBean) request.getAttribute("accessorio");

	Cart cart = (Cart) request.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
	<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.AccessorioBean"%>
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
			    <option value="brand">altri brand</option>
			    <option value="esclusivo">esclusivo</option>
		  </select>
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
    if (request.getAttribute("accessoriFiltrati") != null) {
        showAllGames = false; // Se ci sono giochi filtrati, non mostrare tutti i giochi
    }
%>

<div class="row" id="allGames" <% if (!showAllGames) { %>style="display: none;"<% } %>>
    <!-- Questo è l'elenco di tutti gli accessori -->
    <% 
    if (accessori != null && accessori.size() != 0) { 
        Iterator<?> it = accessori.iterator(); 
        while (it.hasNext()) { 
            AccessorioBean bean = (AccessorioBean) it.next(); 
    %>
    <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">
            <a class="no-underline card-link" href="DettagliControl?cod_accessorio=<%=bean.getCod_Accessorio()%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomeaccessorio()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
					<a href="CarrelloControl?action=AddAccessorio&cod_accessorio=<%=bean.getCod_Accessorio()%>">
					<img src="IMMAGINI/carrelloICON.png" class="icon-carrello">                   </div>
            </a>
        </div>
    </div>
    <% 
        }
    } else { 
    %>
    <div class="col-sm-12 mb-3">
        <p>Nessun accessorio disponibile</p>
    </div>
    <% } %>
</div>
<div class="row" id="filteredGames" <% if (showAllGames) { %>style="display: none;"<% } %>>
    <!-- Questo è l'elenco degli accessori filtrati -->
    <% 
    Collection<?> accessoriFiltrati = (Collection<?>) request.getAttribute("accessoriFiltrati");
    if (accessoriFiltrati != null && !accessoriFiltrati.isEmpty()) { 
        Iterator<?> it = accessoriFiltrati.iterator(); 
        while (it.hasNext()) { 
            AccessorioBean bean = (AccessorioBean) it.next(); 
    %>
    <div class="col-sm-3 mb-3" style="width: 25%;">
        <div class="card">
            <a class="no-underline card-link" href="DettagliControl?cod_accessorio=<%=bean.getCod_Accessorio()%>">
                <div class="card-body">
                    <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                    <h5 class="card-title"><%=bean.getNomeaccessorio()%></h5>
                    <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
                    <a href="CarrelloControl?cod_accessorio=<%=bean.getCod_Accessorio()%>"><img src="IMMAGINI/carrelloICON.png" class="icon-carrello"></a>
                </div>
            </a>
        </div>
    </div>
    <% 
        }
    } else { 
    %>
    <div class="col-sm-12 mb-3">
        <p>Nessun accessorio filtrato</p>
    </div>
    <% } %>
</div>

			
	<%@ include file="/footer/footer.jsp" %>
</body>
</html>