<%@ page import="it.unisa.Cart" %>
<%@ page import="it.unisa.GiocoBean" %>
<%@ page import="java.util.List" %>

<%
    HttpSession session1 = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    List<GiocoBean> giochiNelCarrello = cart.getGiochi();
%>

<!DOCTYPE html>
<html>
<head>
    <!-- Metatags, CSS e altri import -->
</head>
<body>
    <!-- Header e altri elementi della pagina -->
    
    <h2>Carrello</h2>
    <table border="1">
        <thead>
            <tr>
                <th>Nome Gioco</th>
                <!-- Altre colonne della tabella -->
            </tr>
        </thead>
        <tbody>
            <% for (GiocoBean gioco : giochiNelCarrello) { %>
                <tr>
                    <td><%= gioco.getNomegioco() %></td>
                    <!-- Altre colonne della tabella -->
                </tr>
            <% } %>
        </tbody>
    </table>

    <!-- Footer e altri elementi della pagina -->
</body>
</html>
