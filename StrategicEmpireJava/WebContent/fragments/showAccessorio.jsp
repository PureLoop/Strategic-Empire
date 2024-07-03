<%@ page import="it.unisa.bean.AccessorioBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="it.unisa.bean.User" %>

<%
    Collection<AccessorioBean> accessori = null;
     session = request.getSession(false);
    String username = "null"; // Default value if not logged in

    // Verifica se la sessione esiste e se l'utente è loggato
    if (session != null && session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }

    // Determina quale collezione di accessori mostrare
    if (request.getAttribute("pageType").equals("catalogo")) {
        accessori = (Collection<AccessorioBean>) request.getAttribute("prodotti");
    } else if (request.getAttribute("pageType").equals("AreaPersonale")) {
        accessori = (Collection<AccessorioBean>) request.getAttribute("prodottiAP");
    }
%>
<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%; margin-top:2%;">
    <% if (accessori != null && !accessori.isEmpty()) { 
        for (AccessorioBean bean : accessori) { %>
            <div class="col-sm-3 mb-3" style="width: 25%;">
                <div class="card">
                <% if (request.getAttribute("pageType").equals("catalogo")) { %>
                <a class="no-underline card-link" href="DettagliControl?cod_accessorio=<%= bean.getCod_Accessorio() %>&DES=2">
                <% } %>
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomeaccessorio() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        <% if (request.getAttribute("pageType").equals("AreaPersonale")) { %>
                        <button class="edit-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Modifica</button>
                        <button class="del-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Elimina</button>
                        <% } else if (request.getAttribute("pageType").equals("catalogo")) { %>
                            <%-- Controllo per utente loggato o meno --%>
                            <a href="javascript:void(0);" class="add-acc-to-cart" 
                               data-cod-accessorio="<%= bean.getCod_Accessorio() %>" 
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
