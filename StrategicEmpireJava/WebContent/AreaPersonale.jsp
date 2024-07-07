<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"
	import="java.util.*,it.unisa.bean.GiocoBean"%>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.bean.GiocoBean"%>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.bean.CartaBean"%>
<%@ page import="it.unisa.control.UpdateAccountControl" %>


<%@ page import="it.unisa.bean.User" %>

<%

    // Assumiamo che l'oggetto utente sia già stato impostato nella sessione
    User user = (User) session.getAttribute("user");
    String username = null;
	String Email= null;
	String Indirizzo=null;
	String nome = null;
	String ruolo = null;
	String cognome = null;
	String sesso= null;
	int ncivico = 0;
    if (user != null) {
    	
        sesso = user.getsesso();
        System.out.println(user.getNome());
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
/*Style per il radio botton sex */
.gender-selection {
    background: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 300px;
    width: 100%;
}

.gender-selection label {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
    font-size: 16px;
    color: #333333;
    cursor: pointer;
    position: relative;
    padding-left: 30px;
}

.gender-selection input[type="radio"] {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

.custom-radio {
    position: absolute;
    left: 0;
    top: 50%;
    transform: translateY(-50%);
    height: 20px;
    width: 20px;
    background-color: #e0e0e0;
    border-radius: 50%;
    transition: background-color 0.3s;
}

.gender-selection input[type="radio"]:checked + .custom-radio {
    background-color: #4caf50;
}

.custom-radio::after {
    content: "";
    position: absolute;
    display: none;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 10px;
    height: 10px;
    border-radius: 50%;
    background: white;
}

.gender-selection input[type="radio"]:checked + .custom-radio::after {
    display: block;
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
        <span class="rectangle-item"><a href="#" class="nav-link" onclick="handleCardDisplay(false)"data-target="none" id="ordini">Ordini</a></span>
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
<script>
// Funzione per nascondere la sezione degli ordini e dei metodi di pagamento
function hideOrdiniSection() {
    $("#rectangleContainer").empty(); // Svuota il contenuto per nascondere completamente la sezione
    $("#paymentSection").hide(); // Nascondi la sezione dei metodi di pagamento
}

$(document).ready(function() {
    // Gestisci il click sul link "Ordini"
    $("#ordini").click(function(event) {
        event.preventDefault(); // Previene il comportamento predefinito del link
        
        var username = "<%= username %>"; // Ottieni l'username dalla pagina
        
        $.ajax({
            url: "AreaPersonaleControl",
            type: "GET",
            data: {
                action: "showOrdini",
                username: username
            },
            success: function(response) {
                // Inserisci la risposta dalla servlet nel container
                $("#rectangleContainer").html(response);
                $("#paymentSection").hide(); // Assicurati che #paymentSection sia nascosto dopo aver inserito gli ordini
            },
            error: function(xhr, status, error) {
                console.error("Errore nella richiesta AJAX: " + error);
            }
        });
    });

    // Gestisci il click sugli altri link del menu per nascondere la sezione degli ordini e dei metodi di pagamento
    $(".nav-link").not("#ordini").click(function(event) {
        event.preventDefault(); // Previene il comportamento predefinito del link
        
        // Nascondi la sezione degli ordini e dei metodi di pagamento
        hideOrdiniSection();
        
        // Mostra la sezione corrispondente al link cliccato
        var targetSection = $(this).data("target");
        $("#" + targetSection).show();
    });
});

<script>
$(document).ready(function() {
    // Funzione per caricare i dati dell'utente
    function loadUserData() {
        $.ajax({
            url: 'GetUserDataControl', // URL del servlet che restituisce i dati dell'utente
            type: 'GET',
            success: function(data) {
                // Aggiorna i dati nella pagina con il frammento HTML ricevuto
                $('#nome').html($(data).find('#nome').html());
                $('#cognome').html($(data).find('#cognome').html());
                $('#email').html($(data).find('#email').html());
                $('#indirizzo').html($(data).find('#indirizzo').html());
                $('#ncivico').html($(data).find('#ncivico').html());
                $('#sesso').html($(data).find('#sesso').html());
            },
            error: function(xhr, status, error) {
                console.log('Errore nella richiesta AJAX:', error);
            }
        });
    }

    // Carica i dati dell'utente quando la pagina viene caricata
    loadUserData();

    // Gestisci il submit del modulo di aggiornamento dell'account
    $('form').on('submit', function(e) {
        e.preventDefault(); // Impedisce il submit predefinito del form

        $.ajax({
            url: $(this).attr('action'), // URL del servlet per aggiornare l'account
            type: 'POST',
            data: $(this).serialize(), // Serializza i dati del form
            success: function(response) {
                // Ricarica i dati dell'utente dopo l'aggiornamento
                loadUserData();
                alert('Dati aggiornati con successo!');
            },
            error: function(xhr, status, error) {
                console.log('Errore nella richiesta AJAX:', error);
                alert('Errore durante l\'aggiornamento dei dati.');
            }
        });
    });
});
</script>
<div class="container mt-3" id="Account">
    <h3 id="managerTitle" class="text-center mb-4">Area Utente - Gestione Account</h3>

    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Informazioni Utente</h5>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Nome:</label>
                        <p id="nome"><%= user.getNome() %></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Cognome:</label>
                        <p id="cognome"><%= user.getCognome() %></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Email:</label>
                        <p id="email"><%= user.getEmail() %></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Indirizzo:</label>
                        <p id="indirizzo"><%= user.getIndirizzo() %></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Numero civico:</label>
                        <p id="ncivico"><%= user.getncivico() %></p>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label class="form-label">Sesso:</label>
                        <p id="sesso"><%= user.getsesso() %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <h5 class="card-title">Modifica Informazioni</h5>
            <form id="updateForm" action="UpdateAccountControl" method="post">
                <div class="mb-3">
                    <label for="Nome" class="form-label">Nome:</label>
                    <input type="text" id="Nome" name="Nome" class="form-control" required value="<%= user.getNome() %>">
                </div>
                <div class="mb-3">
                    <label for="Cognome" class="form-label">Cognome:</label>
                    <input type="text" id="Cognome" name="Cognome" class="form-control" required value="<%= user.getCognome() %>">
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" value="<%= user.getEmail() %>">
                </div>
                <div class="mb-3">
                    <label for="Indirizzo" class="form-label">Indirizzo:</label>
                    <textarea id="Indirizzo" name="Indirizzo" class="form-control" rows="3"><%= user.getIndirizzo() %></textarea>
                </div>
                <div class="mb-3">
                    <label for="ncivico" class="form-label">Numero civico:</label>
                    <input type="text" id="ncivico" name="ncivico" class="form-control" required value="<%= user.getncivico() %>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Seleziona il tuo sesso:</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sesso" id="sessoNonSpec" value="non specificato" <%= user.getsesso().equalsIgnoreCase("non specificato") ? "checked" : "" %>>
                        <label class="form-check-label" for="sessoNonSpec">Non specificato</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sesso" id="sessoUomo" value="uomo" <%= user.getsesso().equalsIgnoreCase("uomo") ? "checked" : "" %>>
                        <label class="form-check-label" for="sessoUomo">Uomo</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="sesso" id="sessoDonna" value="donna" <%= user.getsesso().equalsIgnoreCase("donna") ? "checked" : "" %>>
                        <label class="form-check-label" for="sessoDonna">Donna</label>
                    </div>
                </div>
                <input type="hidden" id="Username" name="Username" value="<%= user.getUsername() %>">
                <button type="submit" class="btn btn-primary">Salva Modifiche</button>
            </form>
        </div>
    </div>
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