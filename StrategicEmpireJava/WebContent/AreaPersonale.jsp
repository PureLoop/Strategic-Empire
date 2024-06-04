
<!DOCTYPE html>
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

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Barra orizzontale centrata con Bootstrap</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    .rectangle {
      display: flex;
      position: absolute;
      top: 15%;
      justify-content: center;
      align-items: center;
      left: 10%;
      width: 80%;
      height: 12.5%;
      border: 1px solid #ccc;
      border-radius: 8px;
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
  </style>
</head>
<body>
<header>
</header>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="rectangle">
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="Account">Gestione Account</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Ordini</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Rubrica Indirizzi</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="paymentSection">Metodi di pagamento</a></span>
        <% if(user.getRole().equals("Amministratore")){%>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Modifica catalogo</a></span>
        <span class="rectangle-item"><a href="#" class="nav-link" data-target="none">Lista utenti</a></span>
        <%} %>
      </div>
    </div>
  </div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

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
      <div id="paymentForm" class="mt-4">
        <h3>Aggiungi Metodo di Pagamento</h3>
        <form>
          <div class="mb-3">
            <label for="fullName" class="form-label">Nome e Cognome</label>
            <input type="text" class="form-control" id="fullName" placeholder="Inserisci il tuo nome e cognome" required>
          </div>
          <div class="mb-3">
            <label for="cardNumber" class="form-label">Numero di Carta</label>
            <input type="text" class="form-control" id="cardNumber" placeholder="Inserisci il numero della carta" required>
          </div>
          <div class="mb-3">
            <label for="expiryDate" class="form-label">Data di Scadenza</label>
            <input type="text" class="form-control" id="expiryDate" placeholder="MM/AA" required>
          </div>
          <div class="mb-3">
            <label for="cvv" class="form-label">CVV</label>
            <input type="text" class="form-control" id="cvv" placeholder="Inserisci il CVV" required>
          </div>
          <button type="submit" class="btn btn-primary">Aggiungi Metodo di Pagamento</button>
        </form>
        <button id="backToCardsButton" class="btn btn-secondary mt-3">Torna alle carte</button>
      </div>
    </div>
  </div>
</div>

    <br><br><br><br>
    <br><br><br><br>
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
</body>

<script>


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

  const savedCards = [
    { fullName: "Mario Rossi", cardNumber: "**** **** **** 1234", expiryDate: "12/24" },
    { fullName: "Giulia Bianchi", cardNumber: "**** **** **** 5678", expiryDate: "11/25" }
  ];

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
        cardItem.innerHTML = `
          <div>
            <span><strong>Nome:</strong> ${card.fullName}</span>
            <span><strong>Numero di Carta:</strong> ${card.cardNumber}</span>
            <span><strong>Data di Scadenza:</strong> ${card.expiryDate}</span>
          </div>
          <button class="btn btn-secondary btn-sm editCardButton" data-index="${index}">Modifica</button>
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

  displaySavedCards();
</script>


</body>
</html>


