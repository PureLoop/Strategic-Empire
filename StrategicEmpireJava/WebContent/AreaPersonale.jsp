<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.GiocoBean"%>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.GiocoBean"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.CartaBean"%>

<%@ page import="it.unisa.User" %>

<%

    // Assumiamo che l'oggetto utente sia già stato impostato nella sessione
    User user = (User) session.getAttribute("user");
    String username = null;
	String Email= null;
	String Indirizzo=null;
    if (user != null) {
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
        Email = user.getEmail();
        Indirizzo= user.getIndirizzo();
    }
%>
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
      left: 10%;
      width: 80%;
      height: 12.5%;
      border: 1px solid #ccc;
      border-radius: 8px;
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
      border-right: 1px solid #ccc;
    }
    .rectangle-item a {
      text-decoration: none;
      color: inherit;
    }
    .rectangle-item a:hover {
      color: inherit;
    }

    #paymentSection {
      display: none;
      margin-top: 200px;
    }

    .card-list {
      list-style: none;
      padding: 0;
    }

    .card-list li {
      margin-bottom: 10px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 8px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .card-list li span {
      display: block;
    }

    #paymentForm {
      display: none;
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
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="Account">Gestione Account</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Ordini</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Rubrica Indirizzi</a></span>
<span class="rectangle-item">
    <a href="#" class="nav-link" data-target="paymentSection" id="payment">Metodi di pagamento</a>
</span>

        <% if(user.getRole().equalsIgnoreCase("Amministratore")){%>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none" id="addUpdateCatalog">Modifica catalogo</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Lista utenti</a></span>
        <%} %>
      </div>
    </div>
  </div>
</div>

<!-- Sezione per la gestione dei metodi di pagamento -->
<div id="rectangleContainer"></div>
<div class="container mt-3" id="paymentSection">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <h3 id="paymentTitle">Metodi di Pagamento Salvati</h3>
      <ul class="card-list" id="savedCards">
        <!-- Qui verranno inserite le carte salvate -->
      </ul>
      <p id="noCardsMessage" class="text-center">Nessuna carta di credito o di debito salvata.</p>
      <button id="addCardButton" class="btn btn-primary ">Aggiungi una carta di credito o di debito</button>

      <!-- Form per l'aggiunta di metodi di pagamento -->
<div id="paymentFormContainer" class="mt-4">
    <h3>Aggiungi Metodo di Pagamento</h3>
<form id="paymentForm" method="post" onsubmit="addPaymentMethod(); return false;">
        <div class="mb-3">
            <label for="fullName" class="form-label">Nome e Cognome</label>
            <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Inserisci il tuo nome e cognome" required>
        </div>
        <div class="mb-3">
            <label for="cardNumber" class="form-label">Numero di Carta</label>
            <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="Inserisci il numero della carta" required>
        </div>
        <div class="mb-3">
            <label for="expiryDate" class="form-label">Data di Scadenza</label>
            <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/AA" required>
        </div>
        <div class="mb-3">
            <label for="cvv" class="form-label">CVV</label>
            <input type="text" class="form-control" id="cvv" name="cvv" placeholder="Inserisci il CVV" required>
        </div>
        <button type="submit" class="btn btn-primary">Aggiungi Metodo di Pagamento</button>
    </form>
</div>


        <button id="backToCardsButton" class="btn btn-secondary mt-3">Torna alle carte</button>
      </div>
    </div>
  </div>

<div class="container mt-3" id="Account" style="display: none;">
    <h3 id="managerTitle">Area Utente - Gestione Account</h3>
    <div class="user-info">
        <h2>Informazioni Utente</h2>
        <div class="row">
            <div class="col-md-4">
                <label>Nome:</label>
                <p><%= username %></p>
            </div>
            <div class="col-md-4">
                <label>Email:</label>
                <p><%= user != null ? Email : "N/A" %></p>
            </div>
            <div class="col-md-4">
                <label>Indirizzo:</label>
                <p><%= user!=null ? Indirizzo : "N/A"%></p>
            </div>
        </div>
    </div>
    <form action="updateAccount.jsp" method="post">
        <h2>Modifica Informazioni</h2>
        <div class="form-group">
            <label for="name">Nome:</label>
            <input type="text" id="name" name="name" class="form-control" value="<%= user != null ? user.getUsername() : "" %>">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" class="form-control" value="<%= user != null ? user.getEmail() : "" %>">
        </div>
        <div class="form-group">
            <label for="address">Indirizzo:</label>
            <textarea id="address" name="address" class="form-control"><%= user != null ? user.getIndirizzo() : "N/A" %></textarea>
        </div>
        <input type="submit" value="Salva Modifiche" class="btn btn-primary mt-3">
    </form>
</div>
	<div id="showSavedPayment"></div>
<script>

$(document).on('click', '.nav-link', function(event) {
    var username = "<%= username %>"; // Recupera il nome utente dal markup HTML
    event.preventDefault(); // Impedisce il comportamento predefinito del link
    
    if ($(this).attr('id') === 'payment') { // Verifica se l'elemento cliccato ha l'ID 'payment'
        showCard(username); // Chiama la funzione showCard e passa il nome utente come argomento
    }else{
    	$('#showSavedPayment').hide();
    }
});





document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(event) {
        event.preventDefault();
        const target = this.getAttribute('data-target');
        document.getElementById('paymentSection').style.display = 'none';
        document.getElementById('paymentForm').style.display = 'none';
        document.getElementById('Account').style.display = 'none'; // Aggiunto

        if (target === 'paymentSection') {
            document.getElementById(target).style.display = 'block';
            displaySavedCards();
        } else if (target === 'Account') { // Aggiunto
            document.getElementById(target).style.display = 'block';
        }
    });
});

  function displaySavedCards() {
	    const savedCardsContainer = document.getElementById('savedCards');
	    const noCardsMessage = document.getElementById('noCardsMessage');
	    
	    if (savedCards.length === 0) {
	        noCardsMessage.style.display = 'block';
	        savedCardsContainer.style.display = 'none';
	    } else {
	        noCardsMessage.style.display = 'none';
	        savedCardsContainer.style.display = 'block';
	        savedCardsContainer.innerHTML = '';

	        savedCards.forEach((card, index) => {
	            const cardItem = document.createElement('li');
	            cardItem.className = 'card-item'; // Aggiungi classe per lo stile CSS
	            cardItem.innerHTML = `
	                <div class="card-info">
	                    <span><strong>Nome:</strong> ${card.fullName}</span>
	                    <span><strong>Numero di Carta:</strong> ${card.cardNumber}</span>
	                    <span><strong>Data di Scadenza:</strong> ${card.expiryDate}</span>
	                </div>
	              //  <button class="btn btn-secondary btn-sm editCardButton" data-index="${index}">Modifica</button>
	            `;
	            savedCardsContainer.appendChild(cardItem);
	        });
	    }
	}


  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const target = this.getAttribute('data-target');
      
      document.getElementById('paymentSection').style.display = 'none';
      document.getElementById('paymentForm').style.display = 'none';
      document.getElementById('addCardButton').style.display = 'block';

      
      if (target === 'paymentSection') {
        document.getElementById(target).style.display = 'block';
        displaySavedCards();
      }
    });
  });


  document.getElementById('addCardButton').addEventListener('click', function() {
	    console.log('Bottone cliccato');
	    document.getElementById('paymentTitle').style.display = 'none';
	    document.getElementById('savedCards').style.display = 'none';
	    document.getElementById('noCardsMessage').style.display = 'none';
	    document.getElementById('paymentForm').style.display = 'block';
	    document.getElementById('addCardButton').style.display = 'none';
	});




  document.getElementById('backToCardsButton').addEventListener('click', function() {
    document.getElementById('paymentTitle').style.display = 'block';
    document.getElementById('savedCards').style.display = 'block';
    displaySavedCards();
    document.getElementById('addCardButton').style.display = 'block';
    document.getElementById('paymentForm').style.display = 'none';
  });

  document.getElementById('savedCards').addEventListener('click', function(event) {
    if (event.target.classList.contains('editCardButton')) {
      const index = event.target.getAttribute('data-index');
      const card = savedCards[index];
      
      document.getElementById('fullName').value = card.fullName;
      document.getElementById('cardNumber').value = card.cardNumber.replace(/\d(?=\d{4})/g, '*');
      document.getElementById('expiryDate').value = card.expiryDate;
      document.getElementById('cvv').value = '';
      
      document.getElementById('paymentTitle').style.display = 'none';
      document.getElementById('savedCards').style.display = 'none';
      document.getElementById('noCardsMessage').style.display = 'none';
      document.getElementById('addCardButton').style.display = 'block';
      document.getElementById('paymentForm').style.display = 'block';
    }
  });

  function addPaymentMethod() {
      var fullName = document.getElementById('fullName').value;
      var cardNumber = document.getElementById('cardNumber').value;
      var expiryDate = document.getElementById('expiryDate').value;
      var cvv = document.getElementById('cvv').value;
      var username = '<%= username %>'; // Assicurati che la variabile 'username' sia disponibile nella tua pagina JSP

      $.ajax({
          url: 'AreaPersonaleControl', // Assicurati di specificare il percorso corretto per la tua servlet
          method: 'GET',
          data: {
              action: 'insertCards', // Azione per inserire una nuova carta
              fullName: fullName,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cvv: cvv,
              username: username
          },
          success: function(response) {
              // Gestisci la risposta dal server se necessario
              console.log('Carta aggiunta con successo');
          },
          error: function(xhr, status, error) {
              // Gestisci gli errori se necessario
              console.error('Errore durante l\'aggiunta della carta');
          }
      });
  }


  function showCard(username) {
      // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
      $.ajax({
          url: 'AreaPersonaleControl',
          method: 'GET',
          data: {
              action: 'ShowCards',
              username: username  // Passa il nome utente come parametro
          },
          success: function(response) {
              // Mostra il form di modifica nel contenitore appropriato
              $('#showSavedPayment').html(response);
          },
          error: function(xhr, status, error) {
              console.error('Errore: ' + error);
          }
      });
  }
  displaySavedCards();
</script>
  
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
    <script src="js/gestioneCatAmministratore.js"></script>
</body>
</html>