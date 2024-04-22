<%@ page import="java.util.*, it.unisa.GiocoBean" %>
<%
    String cod_gioco = request.getParameter("cod_gioco");
    String nomegioco = request.getParameter("nomegioco");
    String edizione = request.getParameter("edizione");
    String tipologia = request.getParameter("tipologia");
    String prezzo = request.getParameter("prezzo");
    String descrizione = request.getParameter("descrizione");
    String n_giocatori = request.getParameter("n_giocatori");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettagli Gioco</title>
    <!-- Aggiungi qui eventuali link a fogli di stile CSS o script JavaScript -->
</head>
<body>
    <h1>Dettagli Gioco</h1>

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
            <td><%= cod_gioco %></td>
            <td><%= nomegioco %></td>
            <td><%= edizione %></td>
            <td><%= tipologia %></td>
            <td><%= prezzo %></td>
            <td><%= descrizione %></td>
            <td><%= n_giocatori %></td>
        </tr>
    </table>
</body>
</html>
