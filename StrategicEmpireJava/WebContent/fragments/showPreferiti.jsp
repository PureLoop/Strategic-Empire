<%@ page import="it.unisa.bean.GiocoBean" %>
<%@ page import="it.unisa.bean.AccessorioBean" %>
<%@ page import="it.unisa.bean.espansioneBean" %>

<%@ page import="java.util.Collection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="it.unisa.bean.User" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Giochi Preferiti</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <style>
        .heart-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 1.5rem;
            color: grey;
            cursor: pointer;
            transition: color 0.3s ease;
            z-index: 10;
        }

        .heart-icon.filled {
            color: red;
        }

        .card {
            position: relative;
            overflow: hidden;
        }
    </style>
</head>
<body>
<%
    Collection<GiocoBean> giochiPreferiti = (Collection<GiocoBean>) request.getAttribute("giochiPreferiti");
	Collection<AccessorioBean> accessoriPreferiti = (Collection<AccessorioBean>)request.getAttribute("accessoriPreferiti");
	Collection<espansioneBean> espansioniPreferiti = (Collection<espansioneBean>)request.getAttribute("espansioneiPreferiti");
	System.out.println(giochiPreferiti.size());
    session = request.getSession(false);
    String username = null; // Default value if not logged in

    if (session != null && session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }
%>
<div class="row" id="favoriteGames" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (giochiPreferiti != null && !giochiPreferiti.isEmpty()) { 
        for (GiocoBean bean : giochiPreferiti) { 
    %>
        <div class="col-sm-3 mb-3" style="width: 25%;">
            <div class="card">                
                <a class="no-underline card-link" href="DettagliControl?cod_gioco=<%= bean.getCod_Gioco() %>&DES=1">
                    <div class="card-body">
                        <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                        <h5 class="card-title"><%= bean.getNomegioco() %></h5>
                        <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                        
                        <!-- Link per aggiungere al carrello visibile per tutti gli utenti -->
                        <a href="javascript:void(0);" class="add-gioco-to-cart" 
                           data-cod-gioco="<%= bean.getCod_Gioco() %>" 
                           data-nomegioco="<%= bean.getNomegioco() %>" 
                           data-prezzo="<%= bean.getPrezzo() %>" 
                           data-username="<%= username %>">
                           <img src="IMMAGINI/carrelloICON.png" class="icon-carrello">
                        </a>
                        <script src="js/addToCart.js"></script>
                    </div>
                </a>
            </div>
        </div>
    <% } 
    } %>
</div>

<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%; margin-top:2%;">
    <% if (accessoriPreferiti != null && !accessoriPreferiti.isEmpty()) { 
        for (AccessorioBean bean : accessoriPreferiti) { %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
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

<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%;margin-top:2%;">
    <% if (espansioniPreferiti != null && !espansioniPreferiti.isEmpty()) { 
        for (espansioneBean bean : espansioniPreferiti) { %>
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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script>
function toggleFavorite(heart, gameId, username) {
    var isFavorito = heart.classList.contains('filled');
    $.ajax({
        url: 'CarrelloControl',
        method: 'GET',
        data: {
            action: isFavorito ? 'removeFavorite' : 'addPreferito',
            cod_articolo: gameId,
            username: username
        },
        success: function(response) {
            if (response.success) {
                heart.classList.toggle('filled');
                console.log(isFavorito ? 'Removed from favorites' : 'Added to favorites');
            } else {
                console.error('Failed to update favorite status');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error during AJAX request');
        }
    });
}

function controllaPreferiti() {
    $('.heart-icon').each(function() {
        var heart = $(this);
        var gameId = heart.data('game-id');
        var username = heart.data('username');

        $.ajax({
            url: 'CarrelloControl',
            method: 'GET',
            data: {
                action: 'isPreferito',
                cod_articolo: gameId,
                username: username
            },
            success: function(response) {
                if (response === 'true') {
                    heart.addClass('filled');
                } else {
                    heart.removeClass('filled');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error during AJAX request');
            }
        });
    });
}

$(document).ready(function() {
    controllaPreferiti();
});

</script>
</body>
</html>
