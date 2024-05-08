<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.OggettiCarrelloBean"%>
<!DOCTYPE html>
<html>
<head>
    <link href="CarrelloStyle.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
</head>
<body>
    <%@ include file="header/header.jsp" %>

   <h1 id="titolo">Carrello</h1>
	<table class="table table-bordered" id="carrelloTable">
	    <tr>
	        <th>Immagine</th>
	        <th>Codice</th>
	        <th>Nome</th>
	        <th>Prezzo</th>
	        <th>Quantità</th>
	        <th id="col-del">Rimuovi</th> <!-- Nuova colonna per l'icona "x" -->
	    </tr>
	    <% 
	    List<OggettiCarrelloBean> carrellobean = (List<OggettiCarrelloBean>) request.getSession().getAttribute("oggettiCarrello");
	    int count = 0;
	    if (carrellobean != null && !carrellobean.isEmpty()) {
	        for (OggettiCarrelloBean oggetto : carrellobean) {
	    %>
	    <tr>
			<td style="padding: 2%; margin: auto; width: 10%; text-align: center;">
			    <div style="display: flex; justify-content: center;">
			        <img src="<%= oggetto.getImmagineCopertina()%>" style="max-width: 100%; max-height: 100%;">
			    </div>
			</td>
	        <td><%= oggetto.getCod_articolo() %></td>
	        <td><%= oggetto.getNome_articolo() %></td>
	        <td><%= oggetto.getPrezzo() %>€</td>
	        <td><%= oggetto.getQuantita() %></td>
	        <td class="elimina-cell">
	            <a href="CarrelloControl?action=delete&cod_gioco=<%=oggetto.getCod_articolo()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" id="x">
	                <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
	            </svg></a>
	        </td>
	    </tr>
	    <% 
	        count++;
	        }
	    } else {
	    %>
	    <tr>
	        <td colspan="6">Nessun gioco nel carrello</td>
	    </tr>
	    <% } %>
</table>

</body>
</html>
