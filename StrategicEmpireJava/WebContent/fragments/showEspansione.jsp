<%@ page import="it.unisa.bean.espansioneBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="it.unisa.bean.User" %>

<%
    Collection<espansioneBean> espansioni = null;
    session = request.getSession(false);
    String username = "null"; // Default value if not logged in

    // Verifica se la sessione esiste e se l'utente è loggato
    if (session != null && session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }

    // Determina quale collezione di espansioni mostrare
    if (request.getAttribute("pageType").equals("catalogo")) {
        espansioni = (Collection<espansioneBean>) request.getAttribute("prodotti");
    } else if (request.getAttribute("pageType").equals("AreaPersonale")) {
        espansioni = (Collection<espansioneBean>) request.getAttribute("prodottiAP");
    }
%>
<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (espansioni != null && !espansioni.isEmpty()) { 
        for (espansioneBean bean : espansioni) { %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                <div class="card">
                <% if (request.getAttribute("pageType").equals("catalogo")) { %>
                <a class="no-underline card-link" href="DettagliControl?cod_espansione=<%= bean.getCod_espansione() %>&DES=3">
                <% } %>
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomeespansione() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <% if (request.getAttribute("pageType").equals("AreaPersonale")) { %>
                        <button class="edit-Esp-button" data-esp-id="<%= bean.getCod_espansione() %>">Modifica</button>
                        <button class="del-Esp-button" data-esp-id="<%= bean.getCod_espansione() %>">Elimina</button>
                        <% } else if (request.getAttribute("pageType").equals("catalogo")) { %>
                            <%-- Controllo per utente loggato o meno --%>
                            <a href="javascript:void(0);" class="add-esp-to-cart" 
                               data-cod-espansione="<%= bean.getCod_espansione() %>" 
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
