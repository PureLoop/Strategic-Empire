<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, it.unisa.GiocoBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettagli Gioco</title>
    <!-- Aggiungi qui eventuali link a fogli di stile CSS o script JavaScript -->
</head>
<body>
    <h1>Dettagli Gioco</h1>
    
    <%-- Recupera il bean del gioco dalla richiesta --%>
    <% GiocoBean gioco = (GiocoBean) request.getAttribute("gioco"); %>
    
   <p> <%=gioco %></p>
    <%-- Controlla se il bean è presente --%>
    <% if (gioco != null) { %>
        <table border="1">
            <tr>
                <th>Codice</th>
                <th>Nome</th>
                <th>Edizione</th>
                <th>Tipologia</th>
                <th>Prezzo</th>
                <th>Descrizione</th>
                <th>Numero Giocatori</th>
            </tr>
            <tr>
                <td><%= gioco.getCod_Gioco() %></td>
                <td><%= gioco.getNomegioco() %></td>
                <td><%= gioco.getEdizione() %></td>
                <td><%= gioco.getTipologia() %></td>
                <td><%= gioco.getPrezzo() %></td>
                <td><%= gioco.getDescrizione() %></td>
                <td><%= gioco.getN_giocatori() %></td>
            </tr>
        </table>
    <% } else { %>
        <p>Nessun gioco selezionato.</p>
    <% } %>
    
</body>
</html>
