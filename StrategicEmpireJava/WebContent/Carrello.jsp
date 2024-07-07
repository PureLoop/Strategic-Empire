<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, it.unisa.bean.OggettiCarrelloBean" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
body {
    background-color: #fff1e6;
    color: #333;
    font-family: 'Arial', sans-serif;
}

.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border: none;
    border-radius: 10px;
    margin-bottom: 20px;
}

.card img {
    max-width: 100%;
    border-radius: 10px;
}

.custom-left-shift {
    margin-left: -20%;
}
.col-lg-8 {
    margin-right: 30px; /* Aggiungi margine destro al contenuto principale */
}

.fixed-payment-details {
    position: sticky;
    top: 20px; /* Altezza del tuo header, se presente */
    right:80px
    width: 300px;
    background-color: #ffffff;
    border: 1px solid #e65100;
    border-radius: 10px;
    padding: 15px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    z-index: 100; /* Assicura che sia sopra gli altri contenuti */
}


.popup {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #ffffff;
    border: 1px solid #888;
    z-index: 9999;
    width: 300px;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
}

.popup-content {
    text-align: center;
}

.popup-content .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.popup-content .close:hover,
.popup-content .close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}

.empty-cart-background {
    background: url('logo.png') no-repeat center center;
    background-size: cover;
    min-height: 500px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.empty-cart-background h5 {
    color: #e65100;
    font-size: 24px;
    margin-top: 20px;
}

.empty-cart-background .btn {
    background-color: #e65100;
    border-color: #e65100;
}

.empty-cart-background .btn:hover {
    background-color: #cc4b00;
    border-color: #cc4b00;
}

.btn-primary, .btn-dark {
    background-color: #e65100 !important;
    border-color: #e65100 !important;
}

.btn-primary:hover, .btn-dark:hover {
    background-color: #cc4b00 !important;
    border-color: #cc4b00 !important;
}

h5 {
    color: #e65100;
}

a {
    color: #e65100;
    text-decoration: none;
}

a:hover {
    color: #cc4b00;
    text-decoration: underline;
}

.logo-container {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.logo-container img {
    max-width: 150px;
}

.cart-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.cart-header h5 {
    margin: 0;
    font-size: 1.25rem;
    color: #e65100;
}

.cart-header a {
    color: #e65100;
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.3s;
}

.cart-header a:hover {
    color: #cc4b00;
}

.product-details {
    display: flex;
    align-items: center;
}

.product-details img {
    max-width: 65px;
    border-radius: 5px;
    margin-right: 15px;
}

.product-info {
    margin-left: 15px;
}

.product-info h5 {
    margin: 0;
    font-size: 1rem;
}

.product-info p {
    margin: 0;
    font-size: 0.9rem;
    color: #777;
}

.quantity-control {
    display: flex;
    align-items: center;
    gap: 10px;
}

.quantity-control a {
    color: #e65100;
    text-decoration: none;
    font-size: 1.25rem;
}

.quantity-control a:hover {
    color: #cc4b00;
}

.total-details {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 1rem;
    margin-top: 10px;
}

.total-details p {
    margin: 0;
}

@media (max-width: 768px) {
    .fixed-payment-details {
        position: static;
        width: 100%;
        margin-top: 20px;
    }
}

  /* Stile arancione per i giochi nel carrello */
.card {
    border: 2px solid #e65100; /* Bordo arancione */
}

.card-body {
    background-color: #fff3e0; /* Sfondo leggermente colorato */
}

.product-details h5,
.product-details p {
    color: #e65100; /* Testo arancione */
}

.btn-primary,
.btn-dark {
    background-color: #e65100 !important; /* Sfondo arancione per i bottoni */
    border-color: #e65100 !important;
}

.btn-primary:hover,
.btn-dark:hover {
    background-color: #cc4b00 !important; /* Colore sfondo hover */
    border-color: #cc4b00 !important;
}

/* Stile arancione per il riquadro di checkout */
.fixed-payment-details {
    background-color: #e65100; /* Sfondo arancione */
    border: 2px solid #e65100; /* Bordo arancione */
    border-radius: 10px; /* Bordi arrotondati */
    padding: 15px; /* Spaziatura interna */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2); /* Ombra */
}

.fixed-payment-details h5,
.fixed-payment-details p {
    color: #ffffff; /* Testo bianco */
}

.fixed-payment-details .btn-dark {
    background-color: #ffffff; /* Sfondo bianco per il pulsante di checkout */
    color: #e65100; /* Testo arancione */
    border-color: #ffffff; /* Bordo bianco */
}

.fixed-payment-details .btn-dark:hover {
    background-color: #cc4b00; /* Colore sfondo hover */
    border-color: #cc4b00;
    color: #ffffff; /* Testo bianco */
}
/* Stile accattivante per il riquadro di checkout */
.fixed-payment-details {
    background-color: #ff6f00; /* Sfondo arancione acceso */
    border: 2px solid #ff6f00; /* Bordo arancione */
    border-radius: 10px; /* Bordi arrotondati */
    padding: 15px; /* Spaziatura interna */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); /* Ombra */
    color: #ffffff; /* Testo bianco */
}

.fixed-payment-details h5,
.fixed-payment-details p {
    color: #ffffff; /* Testo bianco */
}

.fixed-payment-details .btn-dark {
    background-color: #ffffff; /* Sfondo bianco per il pulsante di checkout */
    color: #ff6f00; /* Testo arancione */
    border-color: #ffffff; /* Bordo bianco */
}

.fixed-payment-details .btn-dark:hover {
    background-color: #ff8f00; /* Colore sfondo hover */
    border-color: #ff8f00;
    color: #ffffff; /* Testo bianco */
}

/* Stile accattivante per il riquadro di checkout */
.fixed-payment-details {
    background-color: #ffffff; /* Sfondo bianco */
    border: 2px solid #ff6f00; /* Bordo arancione */
    border-radius: 10px; /* Bordi arrotondati */
    padding: 15px; /* Spaziatura interna */
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.3); /* Ombra */
    color: #333; /* Testo scuro */
}

.fixed-payment-details h5,
.fixed-payment-details p {
    color: #333; /* Testo scuro */
}

.fixed-payment-details .btn-dark {
    background-color: #ff6f00; /* Sfondo arancione per il pulsante di checkout */
    color: #ffffff; /* Testo bianco */
    border-color: #ff6f00; /* Bordo arancione */
}

.fixed-payment-details .btn-dark:hover {
    background-color: #ff8f00; /* Colore sfondo hover più chiaro */
    border-color: #ff8f00;
}

/* Stile accattivante per i giochi nel carrello */
.card {
    border: 2px solid #ff6f00; /* Bordo arancione */
    border-radius: 10px; /* Bordi arrotondati */
    margin-bottom: 20px; /* Spaziatura inferiore */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Leggera ombra */
    transition: transform 0.3s ease-in-out; /* Animazione trasformazione */
}

.card:hover {
    transform: translateY(-5px); /* Effetto di sollevamento al passaggio del mouse */
}

.card-body {
    background-color: #ffffff; /* Sfondo bianco per il corpo della card */
}

.product-details h5,
.product-details p {
    color: #ff6f00; /* Testo arancione */
}
 
.btn-primary,
.btn-dark {
    background-color: #ff6f00 !important; /* Sfondo arancione per i bottoni */
    border-color: #ff6f00 !important;
}

.btn-primary:hover,
.btn-dark:hover {
    background-color: #ff8f00 !important; /* Colore sfondo hover più chiaro */
    border-color: #ff8f00 !important;
}


    </style>
</head>
<body>
<header><%@ include file="/header/header.jsp" %></header>
<%
    session = request.getSession(false); // Ottieni la sessione esistente, senza crearne una nuova
     u = null; // Dichiarazione della variabile User
    String username = "null"; // Valore di default se non loggato
     loggedIn = false; // Variabile di controllo per il login

    // Verifica se la sessione esiste e se l'utente è loggato
    if (session != null && session.getAttribute("user") != null) {
        u = (User) session.getAttribute("user");
        username = u.getUsername(); // Supponendo che User abbia un metodo getUsername()
        loggedIn = true; // L'utente è loggato
    }

    List<OggettiCarrelloBean> carrellobean = null;
    if (session != null) {
        carrellobean = (List<OggettiCarrelloBean>) session.getAttribute("oggettiCarrello");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100 custom-left-shift">
            <% if (carrellobean != null && !carrellobean.isEmpty()) { %>
            <div class="col-lg-7">
                <h5 class="mb-3"><a href="HomePage.jsp" class="text-body"><i class="fas fa-long-arrow-alt-left me-2"></i>Continua lo shopping</a></h5>
                <hr>
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <p class="mb-1">Carrello</p>
                        <p class="mb-0">Hai <%= carrellobean.size() %> articoli nel tuo carrello</p>
                    </div>
                </div>
                <% for (OggettiCarrelloBean oggetto : carrellobean) { %>
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <div class="d-flex flex-row align-items-center">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="check_<%= oggetto.getCod_articolo() %>" checked>
                                    <label class="form-check-label" for="check_<%= oggetto.getCod_articolo() %>"></label>
                                </div>
                                <div>
                                    <img src="<%= oggetto.getImmagineCopertina() %>" class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                                </div>
                                <div class="ms-3">
                                    <h5><%= oggetto.getNome_articolo() %></h5>
                                    <p class="small mb-0">Codice articolo: <%= oggetto.getCod_articolo() %></p>
                                </div>
                            </div>                            
                            <div class="d-flex flex-row align-items-center">
                                <div style="width: 50px;">
                                    <a href="#!" style="color: #cecece;" onclick="increaseQuantity('<%= oggetto.getCod_articolo() %>')"><i class="fas fa-plus"></i></a>
                                </div>
                                <div style="width: 50px;">
                                    <h5 class="fw-normal mb-0"><%= oggetto.getQuantita() %></h5>
                                </div>
                                <div style="width: 50px;">
                                    <a href="#!" style="color: #cecece;" onclick="decreaseQuantity('<%= oggetto.getCod_articolo() %>')"><i class="fas fa-minus"></i></a>
                                </div>
                                <div style="width: 80px;">
                                    <h5 class="mb-0"><%= oggetto.getPrezzo() %>€</h5>
                                </div>
                                <a href="#!" style="color: #cecece; margin-left: auto;" onclick="deleteFromCart('<%= oggetto.getCod_articolo() %>')"><i class="fas fa-trash-alt"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% } else { %>
            <div class="text-center">
                <h5>Nessun articolo aggiunto al carrello</h5>
                <a href="HomePage.jsp" class="btn btn-primary mt-3">Continua lo shopping</a>
             </h5>
                 <div class="logo-container">
                 <img src="logo.png" alt="Logo">
                 </div>   
            </div>
            <% } %>
        </div>
    </div>
</section>

<div class="fixed-payment-details">
    <div class="card bg-white text-dark rounded-3 shadow">
        <div class="card-body">
            <div class="d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Dettagli del pagamento</h5>
                <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/avatar-6.webp" class="img-fluid rounded-circle" style="width: 45px;" alt="Avatar">
            </div>
            <hr>
            <p class="small mb-2">Tipi di carte accettati</p>
            <div class="d-flex mb-3">
                <a href="#!" class="text-dark me-2"><i class="fab fa-cc-mastercard fa-2x"></i></a>
                <a href="#!" class="text-dark me-2"><i class="fab fa-cc-visa fa-2x"></i></a>
                <a href="#!" class="text-dark me-2"><i class="fab fa-cc-amex fa-2x"></i></a>
                <a href="#!" class="text-dark"><i class="fab fa-cc-paypal fa-2x"></i></a>
            </div>
            <% double subtotal = 0.0;
                if (carrellobean != null) {
                    for (OggettiCarrelloBean oggetto : carrellobean) {
                        subtotal += oggetto.getPrezzo() * oggetto.getQuantita();
                    }
                }
            %>
            <div class="d-flex justify-content-between mb-2">
                <p class="mb-0">Subtotale</p>
                <p class="mb-0" id="subtotal"><%= subtotal %>€</p>
            </div>
            <% double costoSpedizione = 10.0; %>
            <div class="d-flex justify-content-between mb-2">
                <p class="mb-0">Spedizione</p>
                <p class="mb-0" id="shippingCost"><%= costoSpedizione %>€</p>
            </div>
            <% double totale = subtotal + costoSpedizione; %>
            <hr>
            <div class="d-flex justify-content-between mb-3">
                <p class="fw-bold mb-0">Totale (incl. tasse)</p>
                <p class="fw-bold mb-0" id="totalAmount"><%= totale %>€</p>
            </div>
            <button type="button" class="btn btn-dark btn-block btn-lg" onclick="checkLogin()">
                <div class="d-flex justify-content-between">
                    <span id="checkoutAmount" class="fw-bold"><%= totale %>€</span>
                    <span class="fw-bold">Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                </div>
            </button>
        </div>
    </div>
</div>

<div id="loginPopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup()">&times;</span>
        <p>Per procedere con il checkout, devi effettuare il login.</p>
        <a href="Login.jsp" class="btn btn-primary">Login</a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.12.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function increaseQuantity(codiceArticolo) {
        const xhr = new XMLHttpRequest();
        const username = '<%= username %>'; // Fetching username from JSP
        xhr.open('GET', 'CarrelloControl?action=addCarrello&cod_articolo=' + codiceArticolo + '&username=' + encodeURIComponent(username), true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                location.reload();
            }
        };
        xhr.send();
    }

    function decreaseQuantity(codiceArticolo) {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'CarrelloControl?action=decreaseQuantity&cod_articolo=' + codiceArticolo, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                location.reload();
            }
        };
        xhr.send();
    }

    function deleteFromCart(codiceArticolo) {
        const xhr = new XMLHttpRequest();
        console.log("Codice Articolo da eliminare: " + codiceArticolo);
        xhr.open('GET', 'CarrelloControl?action=delete&cod_articolo=' + codiceArticolo, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    console.log("Articolo eliminato con successo.");
                    location.reload();
                } else {
                    console.error("Errore nell'eliminazione dell'articolo: " + xhr.status);
                }
            }
        };
        xhr.send();
    }

    function checkLogin() {
        <% if (!loggedIn) { %>
        const popup = document.getElementById('loginPopup');
        popup.style.display = 'block';
        <% } else { %>
        const totalAmount = document.getElementById('totalAmount').innerText.replace('€', '');
        window.location.href = 'Pagamento.jsp?total=' + totalAmount;
        <% } %>
    }

    function closePopup() {
        document.getElementById('loginPopup').style.display = 'none';
    }

    function calculateTotal() {
        let subtotal = 0.0;
        let shippingCost = 10.0; // Costo di spedizione fisso
        let selectedItems = document.querySelectorAll('input[type="checkbox"]:checked');

        selectedItems.forEach(item => {
            let codiceArticolo = item.id.split('_')[1];
            
            <% if(carrellobean!= null){
            for (OggettiCarrelloBean oggetto : carrellobean) { %>
                if ("<%= oggetto.getCod_articolo() %>" === codiceArticolo) {
                    subtotal += <%= oggetto.getPrezzo() %> * <%= oggetto.getQuantita() %>;
                }
            <% } }%>
        });

        document.getElementById('subtotal').innerText = subtotal.toFixed(2) + '€';
        document.getElementById('shippingCost').innerText = shippingCost.toFixed(2) + '€';
        document.getElementById('totalAmount').innerText = (subtotal + shippingCost).toFixed(2) + '€';
        document.getElementById('checkoutAmount').innerText = (subtotal + shippingCost).toFixed(2) + '€';
    }


    function updateCart(codiceArticolo, isChecked) {
        const xhr = new XMLHttpRequest();
        // Usa l'azione corretta basata sul valore di isChecked
        let action = isChecked ? 'selected' : 'deselected';
        xhr.open('GET', 'CarrelloControl?action=' + "selected" + '&cod_articolo=' + codiceArticolo, true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                console.log("Articolo aggiornato con successo.");
                // Non ricaricare la pagina immediatamente
                // Puoi aggiornare lo stato direttamente se necessario
            } else if (xhr.readyState == 4) {
                console.error("Errore nell'aggiornamento dell'articolo: " + xhr.status);
            }
        };
        
        xhr.send();
    }


    document.addEventListener('DOMContentLoaded', function() {
        calculateTotal();
        let checkboxes = document.querySelectorAll('input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function() {
                calculateTotal();
                updateCart(this.id.split('_')[1], this.checked); // Chiama la funzione updateCart
            });
        });
    });

</script>
    <footer>
      <%@ include file="/footer/footer.jsp" %>
    </footer>
</body>
</html>

