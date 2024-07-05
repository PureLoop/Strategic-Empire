<%@ page import="it.unisa.bean.GiocoBean"%>
<%@ page import="java.util.Collection"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="it.unisa.bean.User"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="UTF-8">
<title>Giochi</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
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
    Collection<GiocoBean> giochi = null;
     session = request.getSession(false);
    String username = null; // Default value if not logged in

    if (session != null && session.getAttribute("user") != null) {
        User user = (User) session.getAttribute("user");
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }

    if ("catalogo".equals(request.getAttribute("pageType"))) {
        giochi = (Collection<GiocoBean>) request.getAttribute("prodotti");
    } else if ("AreaPersonale".equals(request.getAttribute("pageType"))) {
        giochi = (Collection<GiocoBean>) request.getAttribute("prodottiAP");
    }
%>
	<div class="row" id="allGames"
		style="margin-left: 3%; margin-right: 3%; margin-top: 2%;">
		<% if (giochi != null && !giochi.isEmpty()) { 
        for (GiocoBean bean : giochi) { 
    %>
		<div class="col-sm-3 mb-3" style="width: 25%;">
			<div class="card">
				<% if ("catalogo".equals(request.getAttribute("pageType")) && username != null) { %>
				<!-- Icona del cuore visibile solo se in "catalogo" e utente loggato -->
				<i class="far fa-heart heart-icon"
					id="heart-<%= bean.getCod_Gioco() %>"
					data-game-id="<%= bean.getCod_Gioco() %>"
					data-username="<%= username %>"
					onclick="toggleFavorite(this, '<%= bean.getCod_Gioco() %>', '<%= username %>')"></i>
				<% } %>

				<a class="no-underline card-link"
					href="DettagliControl?cod_gioco=<%= bean.getCod_Gioco() %>&DES=1">
					<div class="card-body">
						<img src="<%= bean.getImmagineCop() %>" class="card-img-top">
						<h5 class="card-title"><%= bean.getNomegioco() %></h5>
						<p class="card-text">
							Prezzo:
							<%= bean.getPrezzo() %></p>

						<% if ("AreaPersonale".equals(request.getAttribute("pageType"))) { %>
						<button class="edit-Game-button"
							data-game-id="<%= bean.getCod_Gioco() %>">Modifica</button>
						<button class="del-Gioco-button"
							data-game-id="<%= bean.getCod_Gioco() %>">Elimina</button>
						<% } %>

						<!-- Link per aggiungere al carrello visibile per tutti gli utenti -->
						<a href="javascript:void(0);" class="add-gioco-to-cart"
							data-cod-gioco="<%= bean.getCod_Gioco() %>"
							data-nomegioco="<%= bean.getNomegioco() %>"
							data-prezzo="<%= bean.getPrezzo() %>"
							data-username="<%= username %>"> <img
							src="IMMAGINI/carrelloICON.png" class="icon-carrello">
						</a>
						<script src="js/addToCart.js"></script>
					</div>
				</a>
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
            action: isFavorito ? 'addPreferito' : 'addPreferito',
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
</body>
</html>