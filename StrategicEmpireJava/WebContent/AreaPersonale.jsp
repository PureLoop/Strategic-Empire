<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.bean.GiocoBean"%>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.bean.GiocoBean"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.bean.CartaBean"%>
<%@ page import="it.unisa.bean.User" %>

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
  <title>Area Personale</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script>
	function showCopertinaInputs(){
  	document.getElementById('copertinaInputs').style.display = 'block';
  }
  
  function showImg2Inputs(){
	  	document.getElementById('img2Inputs').style.display = 'block';
	  }
</script> 
	<style>
	.user-table {
    margin-top: 2%; /* Aggiungi un margine superiore alla tabella */
}
	
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

.button-group {
    margin-top: 20px; /* Margine superiore per i bottoni */
}

.button-group .btn {
    width: 30%;
}

#updateCatContainer {
    margin-top: 20px; /* Margine superiore per il contenitore di rettangoli */
}

#choiceProdotti {
    display: none;
}

#btnChoice {
    display: none;
}

#choiceProdottiUp {
    display: none;
}

.user-info {
    margin-top: 20px;
}

.info-item {
    margin-bottom: 10px;
}

.info-item label {
    font-weight: bold;
    margin-right: 5px;
}

/* Media Queries */

/* Tablet */
@media (max-width: 768px) {
    .rectangle {
        height: 80px; /* Riduce l'altezza del rettangolo */
    }

    .rectangle-item {
        font-size: 0.9em; /* Riduce la dimensione del font */
    }

    .button-group .btn {
        width: 45%; /* Aumenta la larghezza dei bottoni su tablet */
    }

    .card-list li {
        flex-direction: column;
        align-items: flex-start;
    }

    .card-list li span {
        margin-bottom: 5px;
    }
}

/* Mobile */
@media (max-width: 480px) {
    .rectangle {
        flex-direction: column; /* Dispone gli elementi del rettangolo in colonna */
        height: auto; /* Altezza automatica per adattarsi al contenuto */
        padding: 10px; /* Aggiunge padding */
    }

    .rectangle-item {
        border-right: none;
        border-bottom: 1px solid #ccc; /* Aggiunge bordo inferiore */
        padding: 10px 0; /* Aggiunge padding */
    }

    .rectangle-item:not(:last-child) {
        border-bottom: 1px solid #ccc; /* Bordo inferiore per tutti tranne l'ultimo */
    }

    .button-group .btn {
        width: 100%; /* Bottoni a larghezza piena */
        margin-top: 10px; /* Margine superiore tra i bottoni */
    }

    .card-list li {
        flex-direction: column;
        align-items: flex-start;
    }

    .card-list li span {
        margin-bottom: 5px;
    }
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
        <span class="rectangle-item"><a href="#" class="nav-link" onclick="handleCardDisplay(false)" data-target="Account">Gestione Account</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" onclick="handleCardDisplay(false)"data-target="none">Ordini</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" onclick="handleCardDisplay(false)"data-target="none">Rubrica Indirizzi</a></span>
<span class="rectangle-item">
<a href="#" class="nav-link" data-target="paymentSection" id="payment" onclick="showPaymentMethods('<%= username %>')">Metodi di pagamento</a>
</span>

        <% if(user.getRole().equalsIgnoreCase("Amministratore")){%>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none" id="addUpdateCatalog" onclick="handleCardDisplay(false)">Modifica catalogo</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none" id="userList" onclick="handleCardDisplay(false)">Lista utenti</a></span>
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
      <h3 class="text-center mb-4" id="paymentTitle">I Tuoi Metodi di Pagamento</h3>
      <ul class="card-list" id="savedCards">
        <!-- Qui verranno inserite le carte salvate -->
      </ul>
    </div>
  </div>
</div>

<div class="container mt-3" id="Account" style="display: none;">
    <h3 id="managerTitle">Area Utente - Gestione Account</h3>
    <div class="user-info">
        <h2>Informazioni Utente</h2>
        </div>
        <div class="row">
        <hr>
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
<script src="js/areaPersonaleCards.js"></script> 

<div id="userTableContainer">
	
</div>
    <script src="js/usersManagement.js"></script>
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
    <script src="js/checkerInputFields.js"></script>
    <script src="js/gestioneCatAmministratore.js"></script>
</body>
</html>