<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.GiocoBean"%>
<!DOCTYPE html>
<html>
<head>
    <title>Carrello</title>
</head>
<body>
    <h1>Carrello</h1>
    <table border="1">
        <tr>
            <th>Codice</th>
            <th>Nome</th>
            <th>Prezzo</th>
            <!-- Aggiungi altre colonne se necessario -->
        </tr>
        <% 
        List<GiocoBean> listaGiochiCarrello = (List<GiocoBean>) request.getSession().getAttribute("listaGiochiCarrello");
        if (listaGiochiCarrello != null && !listaGiochiCarrello.isEmpty()) {
            for (GiocoBean gioco : listaGiochiCarrello) { 
        %>
        <tr>
            <td><%= gioco.getCod_Gioco() %></td>
            <td><%= gioco.getNomegioco() %></td>
            <td><%= gioco.getPrezzo() %></td>
            <!-- Aggiungi altre colonne se necessario -->
        </tr>
        <% 
            }
        } else {
        %>
        <tr>
            <td colspan="3">Nessun gioco nel carrello</td>
        </tr>
        <% } %>
    </table>
</body>
</html>

