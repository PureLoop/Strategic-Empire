<%@ page import="it.unisa.bean.AccessorioBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="it.unisa.bean.User" %>

<%
    Collection<AccessorioBean> accessori = null;
    session = request.getSession(false);
    String username = null; // Default value if not logged in

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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<style>
    .heart-icon {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 1.5rem;
        color: grey; /* Colore iniziale del cuore */
        cursor: pointer;
        transition: color 0.3s ease;
        z-index: 10;
    }
    .heart-icon.filled {
        color: red; /* Colore del cuore quando è riempito */
    }
    .card {
        position: relative;
        overflow: hidden;
    }
</style>

<div class="row" id="allAccessories" style="margin-left: 3%; margin-right:3%; margin-top:2%;">
    <% if (accessori != null && !accessori.isEmpty()) { 
        for (AccessorioBean bean : accessori) { %>
            <div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3">
                <div class="card">
                    <% if (request.getAttribute("pageType").equals("catalogo") && username != null) { %>
                        <i class="far fa-heart heart-icon" id="heart-<%= bean.getCod_Accessorio() %>" 
                           data-accessorio-id="<%= bean.getCod_Accessorio() %>" 
                           data-username="<%= username %>" 
                           onclick="toggleFavorite(this)">
                        </i>
                    <% } %>
                    <a class="no-underline card-link" href="DettagliControl?cod_accessorio=<%= bean.getCod_Accessorio() %>&DES=2">
                        <div class="card-body">
                            <img src="<%= bean.getImmagineCop() %>" class="card-img-top">
                            <h5 class="card-title"><%= bean.getNomeaccessorio() %></h5>
                            <p class="card-text">Prezzo: <%= bean.getPrezzo() %></p>
                            <% if (request.getAttribute("pageType").equals("AreaPersonale")) { %>
                                <button class="edit-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Modifica</button>
                                <button class="del-Acc-button" data-acc-id="<%= bean.getCod_Accessorio() %>">Elimina</button>
                            <% } else if (request.getAttribute("pageType").equals("catalogo")) { %>
                                <a href="javascript:void(0);" class="add-acc-to-cart" 
                                   data-cod-accessorio="<%= bean.getCod_Accessorio() %>" 
                                   data-username="<%= username %>">
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
<script>
function toggleFavorite(heart) {
    var isFavorito = $(heart).hasClass('filled');
    var gameId = $(heart).data('accessorio-id');
    var username = $(heart).data('username');
    var action = isFavorito ? 'addPreferito' : 'addPreferito';

    $.ajax({
        url: 'CarrelloControl',
        method: 'GET',
        data: {
            action: action,
            cod_articolo: gameId,
            username: username
        },
        success: function(response) {
            console.log('AJAX success response:', response);
            if (response.success) {
                $(heart).toggleClass('filled');
                console.log(isFavorito ? 'Removed from favorites' : 'Added to favorites');
            } else {
                console.error('Failed to update favorite status');
                // Se la risposta non è positiva, puoi ripristinare lo stato del cuore
                $(heart).toggleClass('filled');
            }
        },
        error: function(xhr, status, error) {
            console.error('Error during AJAX request');
            // Se c'è un errore, puoi ripristinare lo stato del cuore
            $(heart).toggleClass('filled');
        }
    });
}

function controllaPreferiti() {
    $('.heart-icon').each(function() {
        var heart = $(this);
        var gameId = heart.data('accessorio-id');
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
                console.log('AJAX check response:', response);
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
