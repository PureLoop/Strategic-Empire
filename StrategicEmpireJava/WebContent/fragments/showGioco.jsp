<%@ page import="it.unisa.bean.GiocoBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="it.unisa.bean.User" %>

<%
    Collection<GiocoBean> giochi = null;
    session = request.getSession(false);
    String username = "null"; // Default value if not logged in

    // Verifica se la sessione esiste e se l'utente è loggato
    if (session != null && session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }

    // Determina quale collezione di giochi mostrare
    if (request.getAttribute("pageType").equals("catalogo")) {
        giochi = (Collection<GiocoBean>) request.getAttribute("prodotti");
    } else if (request.getAttribute("pageType").equals("AreaPersonale")) {
        giochi = (Collection<GiocoBean>) request.getAttribute("prodottiAP");
    }
%>
<div class="row" id="allGames" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (giochi != null && !giochi.isEmpty()) { 
        for (GiocoBean bean : giochi) { 
    %>
        <div class="col-sm-3 mb-3" style="width: 25%;">
            <div class="card">
            <% if (request.getAttribute("pageType").equals("catalogo")) { %>
            <a class="no-underline card-link" href="DettagliControl?cod_gioco=<%= bean.getCod_Gioco() %>&DES=1">
            <% } %>
                <div class="card-body">
                    <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                    <h5 class="card-title"><%= bean.getNomegioco() %></h5>
                    <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                    <% if (request.getAttribute("pageType").equals("AreaPersonale")) { %>
                    <button class="edit-Game-button" data-game-id="<%= bean.getCod_Gioco() %>">Modifica</button>
                    <button class="del-Gioco-button" data-game-id="<%= bean.getCod_Gioco() %>">Elimina</button>
                    <% } else if (request.getAttribute("pageType").equals("catalogo")) { %>
                        <%-- Controllo per utente loggato o meno --%>
                        <a href="javascript:void(0);" class="add-gioco-to-cart" 
                           data-cod-gioco="<%= bean.getCod_Gioco() %>" 
                           data-nomegioco="<%= bean.getNomegioco() %>" 
                           data-prezzo="<%= bean.getPrezzo() %>" 
                           data-username="<%= username %>"> <!-- Passa l'username o "null" -->
                           <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
                        </a>
                        <script src="js/addToCart.js"></script>
                    <% } %>
                </div>
                <% if (request.getAttribute("pageType").equals("catalogo")) { %>
            </a>
            <% } %>
            </div>
        </div>
    <% } 
    } %>
</div>
