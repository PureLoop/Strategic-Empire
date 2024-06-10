<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.GiocoBean"%>
<html lang="en">
<head>
<link rel="stylesheet" href="GiocoStyle.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Barra orizzontale centrata con Bootstrap</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
    .rectangle {
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%; /* Larghezza del rettangolo */
      height: 100px; /* Altezza del rettangolo */
      border: 1px solid #ccc; /* Bordo del rettangolo */
      border-radius: 8px; /* Angoli arrotondati */
      margin-top: 20px; /* Margine superiore */
    }
    
    .rectangle-item {
      display: inline-block;
      text-align: center;
      flex: 1;
    }
    .rectangle-item:not(:last-child) {
      border-right: 1px solid #ccc; /* Aggiunge bordo destro */
    }
    
    .rectangle-item a {
      text-decoration: none; /* Rimuove la sottolineatura */
      color: inherit; /* Usa il colore predefinito */
    }
    .rectangle-item a:hover {
      color: inherit; /* Mantieni il colore durante il passaggio del mouse */
    }
    
    .search-bar {
      margin-top: 20px; /* Margine superiore per la barra di ricerca */
    }
    .search-bar .form-control {
      border-radius: 0; /* Rimuovi gli angoli arrotondati */
    }
    .search-bar .btn {
      border-radius: 0; /* Rimuovi gli angoli arrotondati */
    }
    
    .button-group {
      margin-top: 20px; /* Margine superiore per i bottoni */
    }
    
    .button-group .btn{
      width: 30%;
    }
    
    #updateCatContainer{
      margin-top: 20px; /* Margine superiore per il contenitore di rettangoli */
    }
    
    #choiceProdotti{
    	display: none;
    }
    
    #btnChoice{
    	display: none;
    }
    
    #choiceProdottiUp{
    	display: none;
    }
  </style>
</head>
<body>
<header>
	<%@ include file="/header/header.jsp" %>
</header>

<div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="rectangle">
          <span class="rectangle-item"><a href="#">Gestione Account</a></span>
          <span class="rectangle-item"><a href="#">Ordini</a></span>
          <span class="rectangle-item"><a href="#">Rubrica Indirizzi</a></span>
          <span class="rectangle-item"><a href="#">Metodi di pagamento</a></span>
          <% if(user.getRole().equalsIgnoreCase("Amministratore")){%>
          <span class="rectangle-item"><a href="#" id="addUpdateCatalog">Modifica catalogo</a></span>
          <span class="rectangle-item"><a href="#">Lista utenti</a></span>
          <%} %>
        </div>
      </div>
    </div>
  </div>
  
<div class="container search-bar">
    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="Cerca" aria-label="Cerca">
      <button class="btn btn-outline-success" type="submit">Cerca</button>
    </form>
  </div>
  
  <div id="btnChoice" class="button-group  justify-content-around">
      <button type="button" id="Modifica" class="btn btn-outline-success">Modifica Prodotto</button>
      <button type="button" id="Inserisci" class="btn btn-outline-success">Inserisci Prodotto</button>
    </div>
  
  <div id="choiceProdotti" class="button-group justify-content-around">
      <button type="button" id="accessoriIns" class="btn btn-outline-success">Accessori</button>
      <button type="button" id="giochiIns" class="btn btn-outline-success">Giochi</button>
      <button type="button" id="espansioniIns" class="btn btn-outline-success">Espansioni</button>
    </div>
    
    <div id="choiceProdottiUp" class="button-group justify-content-around">
      <button type="button" id="accessori" class="btn btn-outline-success">Accessori</button>
      <button type="button" id="giochi" class="btn btn-outline-success">Giochi</button>
      <button type="button" id="espansioni" class="btn btn-outline-success">Espansioni</button>
    </div>
    <div id="updateCatContainer" class="mt-3 d-flex justify-content-center">
    <div id="insertCatContainer" class="mt-3 d-flex justify-content-center">
    </div>
    </div>
    <script>
    document.getElementById("Modifica").addEventListener('click', function(){
    	document.getElementById("choiceProdottiUp").style.display = 'flex';
    });
    
    document.getElementById("Inserisci").addEventListener('click', function(){
    	document.getElementById("choiceProdotti").style.display = 'flex';
    });
    
    document.getElementById("addUpdateCatalog").addEventListener('click', function(){
    	document.getElementById("btnChoice").style.display = 'flex';
    });
        
    
    $(document).ready(function() {
    	
    	$('#giochiIns').off('click').on('click',function(event){
    		event.preventDefault(); // Prevenire la navigazione
    		$.ajax({
    			url: 'AreaPersonaleControl',
    			method: "GET",
    			data:{
    				action: 'showInsForm',
    				type: 'gioco'
    			},
    			success: function(response){
    				$('#insertCatContainer').html(response);
    			},
    			error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
    		});
    	});
    	
    	$('#accessoriIns').off('click').on('click',function(event){
    		event.preventDefault(); // Prevenire la navigazione
    		$.ajax({
    			url: 'AreaPersonaleControl',
    			method: "GET",
    			data:{
    				action: 'showInsForm',
    				type: 'accessorio'
    			},
    			success: function(response){
    				$('#insertCatContainer').html(response);
    			},
    			error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
    		});
    	});
    	
    	$('#espansioniIns').off('click').on('click',function(event){
    		event.preventDefault(); // Prevenire la navigazione
    		$.ajax({
    			url: 'AreaPersonaleControl',
    			method: "GET",
    			data:{
    				action: 'showInsForm',
    				type: 'espansione'
    			},
    			success: function(response){
    				$('#insertCatContainer').html(response);
    			},
    			error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
    		});
    	});
    	
        $('#giochi').off('click').on('click', function(event) {
            event.preventDefault(); // Prevenire la navigazione

            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'GET',
                data: {
                    action: 'ShowGioco',
                },
                success: function(response) {
                    $('#updateCatContainer').html(response);
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        });
        
        $('#accessori').off('click').on('click', function(event) {
            event.preventDefault(); // Prevenire la navigazione

            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'GET',
                data: {
                    action: 'ShowAccessorio',
                },
                success: function(response) {
                    $('#updateCatContainer').html(response);
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        });
        
        $('#espansioni').off('click').on('click', function(event) {
            event.preventDefault(); // Prevenire la navigazione

            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'GET',
                data: {
                    action: 'ShowEspansione',
                },
                success: function(response) {
                    $('#updateCatContainer').html(response);
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        });
    });
    
    function showModifyGameForm(gameId) {
        // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'GameModifyForm',
                gameId: gameId
            },
            success: function(response) {
                // Mostra il form di modifica nel contenitore appropriato
                $('#updateCatContainer').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }

    function showModifyAccForm(accId) {
        // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'AccModifyForm',
                accId: accId
            },
            success: function(response) {
                // Mostra il form di modifica nel contenitore appropriato
                $('#updateCatContainer').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }
    
    function showModifyEspForm(espId) {
        // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'EspModifyForm',
                espId: espId
            },
            success: function(response) {
                // Mostra il form di modifica nel contenitore appropriato
                $('#updateCatContainer').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }
    
    function submitInsForm(){
    	var formData = $('#insertForm').serializeArray();
    	formData.push({
    		name: 'action',
    		value: 'insertDB'
    	});
    	$.ajax({
    		type: 'POST',
    		url: 'AreaPersonaleControl',
    		data: formData,
    		success: function(response) {
                alert('Prodotto inserito con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'inserimento del prodotto');
            } 
    	});
    }
    
    function submitGameForm() {
        var formData = $('#ModifyGameForm').serializeArray();
        formData.push({ name: 'action', value: 'updateGame' });

        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            success: function(response) {
                alert('Gioco aggiornato con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'aggiornamento del gioco');
            }
        });
    }
    
    function submitAccForm() {
        var formData = $('#ModifyAccForm').serializeArray();
        formData.push({ name: 'action', value: 'updateAccessorio' });

        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            success: function(response) {
                alert('Accessorio aggiornato con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'aggiornamento del gioco');
            }
        });
    }
    
    function submitEspForm() {
        var formData = $('#ModifyEspForm').serializeArray();
        formData.push({ name: 'action', value: 'updateEspansione' });

        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            success: function(response) {
                alert('Espansione aggiornata con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'aggiornamento del gioco');
            }
        });
    }
    // Gestisci il click sui pulsanti "Modifica"
    $(document).on('click', '.edit-Game-button', function() {
        var gameId = $(this).data('game-id');
        showModifyGameForm(gameId);
    });
    
    $(document).on('click', '.edit-Acc-button', function() {
        var accId = $(this).data('acc-id');
        showModifyAccForm(accId);
    });
    
    $(document).on('click', '.edit-Esp-button', function() {
        var espId = $(this).data('esp-id');
        showModifyEspForm(espId);
    });
    </script>
</body>
</html>

