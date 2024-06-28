<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catalogo</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
	    <link rel="stylesheet" href="GiocoStyle.css">
</head>
<style>
	.button-group {
    margin-top: 20px;
    margin-left: 40px; /* Margine superiore per i bottoni */
    left: 10%;
}

.button-group .btn {
    width: 30%;
    margin-right: 3%;
}

.search-bar {
      margin-top: 10px; /* Margine superiore per la barra di ricerca */
      margin-bottom: 10px; /* Margine superiore per la barra di ricerca */
    }
    .search-bar .form-control {
      border-radius: 0; /* Rimuovi gli angoli arrotondati */
    }
    .search-bar .btn {
      border-radius: 0; /* Rimuovi gli angoli arrotondati */
    }
</style>
<body>
	<header>
	<%@ include file="/header/header.jsp" %>
    </header>
    <div class="container search-bar">
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Cerca">
      <button class="btn btn-outline-success" type="submit">Cerca</button>
    </form>
  </div>
    <form action="gioco" method="post" id="form-filtro" >
        <input type="hidden" name="action" value="filter">
        <table id="game-table" style="width: 100%;">
            <tr>
                <td style="width: 25%;"><select id="game-type" name="tipologia" required style="width: 100%;">
                        <option value="" selected>Tipo di gioco</option>
                        <option value="Tutti">Tutti</option>
                        <option value="tavolo">Tavolo</option>
                        <option value="carte">Carte</option>
                </select></td>
                <td style="width: 25%;"><input type="number" name="N_giocatori" id="num-players" name="num-players" min="1" max="10" placeholder="Numero giocatori" style="width: 100%;"></td>
                <td style="width: 25%;"><input type="number" name="prezzo" id="priceInput" name="num-players" min="1" max="1000" placeholder="Prezzo" style="width: 100%;"></td>
                <td style="width: 25%;">
                    <button type="submit" class="submit-button" style="width: 100%;">Filtra</button>
                </td>
            </tr>
        </table>
    </form>
    
	<div id="choiceProdotti" class="button-group justify-content-around">
      <button type="button" id="accessori" class="btn btn-outline-success">Accessori</button>
      <button type="button" id="giochi" class="btn btn-outline-success">Giochi</button>
      <button type="button" id="espansioni" class="btn btn-outline-success">Espansioni</button>
    </div>
    <div id="sezioneProdotti"></div>
    
    <div class="toast-container position-fixed top-0 end-0 p-3">
    <div id="cartToast" class="toast align-items-center border border-success" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="d-flex bg-white rounded p-2">
            <div class="toast-body">
                <span id="toastMessage">Oggetto aggiunto al carrello!</span>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle text-success ms-2" viewBox="0 0 16 16">
                    <path d="M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0ZM6.406 11.328L4.47 9.414a.5.5 0 1 1 .707-.708l1.666 1.667 3.75-3.75a.5.5 0 0 1 .708.708l-4.167 4.167a.5.5 0 0 1-.708 0Z" />
                </svg>
            </div>
        </div>
    </div>
	</div>
    <script>
    $(document).ready(function() {
        // Funzione per caricare i giochi al caricamento della pagina
        function loadGiochi() {
            $.ajax({
                url: 'catalogoControl',
                method: 'GET',
                data: {
                    action: 'ShowGioco',
                },
                success: function(response) {
                    $('#sezioneProdotti').html(response);
                    attachInputValidation(); // Supponendo che ci sia una funzione per validare l'input
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        }

        // Chiamata alla funzione per caricare i giochi
        loadGiochi();
    });
    
    $('#giochi').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione
        $.ajax({
            url: 'catalogoControl',
            method: 'GET',
            data: {
                action: 'ShowGioco',
            },
            success: function(response) {
                $('#sezioneProdotti').html(response);
                attachInputValidation()
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
    
    $('#accessori').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione
        $.ajax({
            url: 'catalogoControl',
            method: 'GET',
            data: {
                action: 'ShowAccessorio',
            },
            success: function(response) {
                $('#sezioneProdotti').html(response);
                attachInputValidation()
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
    
    $('#espansioni').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione
        $.ajax({
            url: 'catalogoControl',
            method: 'GET',
            data: {
                action: 'ShowEspansione',
            },
            success: function(response) {
                $('#sezioneProdotti').html(response);
                attachInputValidation()
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
    </script>
</body>
</html>