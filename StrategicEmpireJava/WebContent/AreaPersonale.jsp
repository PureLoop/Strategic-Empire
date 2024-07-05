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
    	
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
        Email = user.getEmail();
        Indirizzo= user.getIndirizzo();
        nome= user.getNome();
        ruolo= user.getRole();
        cognome= user.getCognome();
        ncivico = user.getncivico();
        sesso = user.getsesso();
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
<script>
    $(document).ready(function() {
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
                    // Gestisci la risposta dalla servlet
                    $("#rectangleContainer").html(response); // Inserisci la risposta nel contenitore
                },
                error: function(xhr, status, error) {
                    console.error("Errore nella richiesta AJAX: " + error);
                }
            });
        });
    });
</script>
<div class="container mt-3" id="Account" style="display: none;">
    <h3 id="managerTitle">Area Utente - Gestione Account</h3>
    <div class="user-info">
        <h2>Informazioni Utente</h2>
        </div>
        <div class="row">
        <hr>
            <div class="col-md-4">
                <label>Nome:</label>
				<p><%= user.getNome()%></p>
            </div>
            <div class="col-md-4">
                <label>Cognome:</label>
                <p><%= user.getCognome() %></p>            
           </div>
            <div class="col-md-4">
                <label>Email:</label>
                <p><%= user != null ? Email : "N/A" %></p>
            </div>
            <div class="col-md-4">
                <label>Indirizzo:</label>
                <p><%= user!=null ? Indirizzo : "N/A"%></p>
            </div>
            <div class="col-md-4">
                <label>numero civico:</label>
                <p><%= user.getncivico() %></p>
            </div>
             <div class="col-md-4">
                <label>Sesso:</label>
                <p><%= user.getsesso() %></p>
            </div>
        </div>
    
    <form action="UpdateAccountControl" method="post">
        <h2>Modifica Informazioni</h2>
        <div class="form-group">
            <label for="Nome">Nome:</label>
             <input type="text" id="Nome" name="Nome" required class="form-control" value="<%= user != null ? nome : "" %>"><br>
        </div>
        <div class="form-group">
            <label for="Cognome">Cognome:</label>
             <input type="text" id="Cognome" name="Cognome" required class="form-control" value="<%= user != null ? user.getCognome() : "" %>"><br>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" class="form-control" value="<%= user != null ? user.getEmail() : "" %>">
        </div>
        <div class="form-group">
            <label for="Indirizzo">Indirizzo:</label>
            <textarea id="Indirizzo" name="Indirizzo" class="form-control"><%= user != null ? user.getIndirizzo() : "N/A" %></textarea>
        </div>
        <div class="form-group">
            <label for="N_civico">N civico:</label>
             <input type="text" id="ncivico" name="ncivico" required class="form-control" value="<%= user != null ? user.getncivico() : "" %>"><br>
        </div>
    <div class="gender-selection">
    <h4> Seleziona il tuo sesso: </h4>
        <label>
            <input type="radio" name="sesso" value="non specificato" checked>
            <span class="custom-radio"></span>
            Non specificato
        </label>
        <label>
            <input type="radio" name="sesso" value="uomo">
            <span class="custom-radio"></span>
            Uomo
        </label>
        <label>
            <input type="radio" name="sesso" value="donna">
            <span class="custom-radio"></span>
            Donna
        </label>
    </div>
             <input type="hidden" id="Username" name="Username" value=<%= user.getUsername() %>><br>
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