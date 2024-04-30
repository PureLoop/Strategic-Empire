<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.GiocoBean"%>
<!DOCTYPE html>
<html>
<head>
    <link href="CarrelloStyle.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <title>Carrello</title>
</head>
<body>
    <%@ include file="header/header.jsp" %>

    <h1 id="titolo">Carrello</h1>
    <table border="1" class="table table-bordered" id="carrelloTable">
        <tr>
            <th>Codice</th>
            <th>Nome</th>
            <th>Prezzo</th>
            <th id="col-del"></th> <!-- Nuova colonna per l'icona "x" -->
        </tr>
        <% 
        List<GiocoBean> listaGiochiCarrello = (List<GiocoBean>) request.getSession().getAttribute("listaGiochiCarrello");
        int count = 0;
        if (listaGiochiCarrello != null && !listaGiochiCarrello.isEmpty()) {
            for (GiocoBean gioco : listaGiochiCarrello) { 
        %>
        <tr>
            <td><%= count %></td>
            <td><%= gioco.getNomegioco() %></td>
            <td><%= gioco.getPrezzo() %>€</td>
            <td class=".elimina-cell">
                <a href="CarrelloControl?action=delete&cod_gioco=<%=gioco.getCod_Gioco()%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16" id="x">
                    <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/>
                    
                </svg></a>
                
            </td>
            <!-- Aggiungi altre colonne se necessario -->
        </tr>
        <% 
            count++;
            }
        } else {
        %>
        <tr>
            <td colspan="4">Nessun gioco nel carrello</td>
        </tr>
        <% } %>
    </table>
</body>
</html>


