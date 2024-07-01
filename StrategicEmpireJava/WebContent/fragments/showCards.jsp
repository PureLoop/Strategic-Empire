<%@ page import="it.unisa.bean.CartaBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="it.unisa.bean.User" %>

<div id="popup" class="popup">
    <div class="popup-content">
        <span class="close-popup" onclick="closePopup()">&times;</span>
        <div id="popup-card-details"></div>
    </div>
</div>

<% 
Collection<CartaBean> carte = (Collection<CartaBean>) request.getAttribute("prodottiAP");
CartaBean carta = (CartaBean) request.getAttribute("c");
User user = (User) session.getAttribute("user");
String username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
CartaBean CartaEdit = new CartaBean();
%>

<!-- Aggiunto div per il messaggio -->
<div class="container" style="margin-top: 20px;">
    <% if (carte.isEmpty()) { %>
        <p class="text-center">Nessun metodo di pagamento inserito.</p>
    <% } %>
</div>


<div class="container" id="allCard" style="margin-top: 2%;">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
        <% if (carte != null && !carte.isEmpty()) { 
            for (CartaBean bean : carte) { %>
                <div class="col mb-4">
                    <div class="credit-card" data-username="<%= bean.getUsername() %>" data-card-number="<%= bean.getNumero() %>">
                        <div class="edit-card" onclick="editCard('<%= bean.getNumero() %>')">Modifica</div>
                        <div class="card-chip"></div>
                        <div class="card-number"><%= bean.getNumero() %></div>
                        <div class="card-name"><%= bean.getNome() %></div>
                        <div class="card-expiry">Valid Thru: <%= bean.getScadenza() %></div>
                    </div>
                </div>
            <% } %>
        <% } %>

        <!-- Spazio per la carta trasparente per l'aggiunta di una nuova carta -->
        <div class="col mb-4">
            <div class="credit-card add-card" onclick="openAddCardPopup()">
                <div class="add-icon">+</div>
            </div>
        </div>
    </div>
</div>


<div id="addCardPopup" class="popup">
    <div class="popup-content">
        <span class="close-popup" onclick="closeAddCardPopup()">&times;</span>
        <h2>Inserisci Nuova Carta</h2>
        <form id="newCardForm">
            <div class="form-group">
                <label for="newCardNumber">Numero Carta:</label>
                <input type="text" id="newCardNumber" class="form-control" placeholder="Numero della carta" required>
            </div>
            <div class="form-group">
                <label for="newCardName">Nome:</label>
                <input type="text" id="newCardName" class="form-control" placeholder="Nome sulla carta" required>
            </div>
            <div class="form-group">
                <label for="newCardExpiry">Scadenza:</label>
                <input type="text" id="newCardExpiry" class="form-control" placeholder="Scadenza (MM/YY)" required>
            </div>
            <div class="form-group">
                <label for="newcvv">CVV:</label>
                <input type="text" id="newcvv" class="form-control" placeholder="CVV" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="saveNewCard()">Salva</button>
        </form>
    </div>
</div>


<div id="editCardPopup" class="popup">
    <div class="popup-content">
        <span class="close-popup" onclick="closeEditCardPopup()">&times;</span>
        <h2>Modifica Dati Carta</h2>
        <form id="editCardForm">
            <div class="form-group">
                <label for="editCardNumber">Numero Carta:</label>
                <input type="text" id="editCardNumber" class="form-control" placeholder="Numero della carta" readonly>
            </div>
            <div class="form-group">
                <label for="editCardName">Nome:</label>
                <input type="text" id="editCardName" class="form-control" placeholder="Nome sulla carta" required>
            </div>
            <div class="form-group">
                <label for="editCardExpiry">Scadenza:</label>
                <input type="text" id="editCardExpiry" class="form-control" placeholder="Scadenza (MM/YY)" required>
            </div>
            <div class="form-group">
                <label for="editcvv">CVV:</label>
                <input type="text" id="editcvv" class="form-control" placeholder="CVV" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="editValue()">Salva</button>
        </form>
    </div>
</div>



<style>
    /* Stili per la carta */
    .credit-card {
        position: relative;
        width: 240px;
        height: 150px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        background: linear-gradient(to right, #4e4e4e, #2b2b2b);
        color: white;
        padding: 15px;
        font-family: 'Arial', sans-serif;
        cursor: pointer;
        overflow: hidden; /* Per nascondere il contenuto in eccesso */
    }

    .credit-card .edit-card {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: #007bff;
        color: white;
        padding: 2px 2px;
        border-radius: 5px;
        font-size: 0.8em;
        cursor: pointer;
    }

    .credit-card .edit-card:hover {
        background-color: #0056b3;
    }

    .credit-card .card-chip {
        width: 30px;
        height: 20px;
        background: #d4af37;
        border-radius: 3px;
        position: absolute;
        top: 8px;
        left: 8px;
    }

    .credit-card .card-number {
        position: absolute;
        top: 40px;
        left: 15px;
        font-size: 0.9em;
        letter-spacing: 1px;
    }

    .credit-card .card-name {
        position: absolute;
        bottom: 25px;
        left: 15px;
        font-size: 0.7em;
        text-transform: uppercase;
    }

    .credit-card .card-expiry {
        position: absolute;
        bottom: 10px;
        right: 15px;
        font-size: 0.6em;
    }

    .add-card {
        position: relative;
        width: 240px;
        height: 150px;
        border-radius: 10px;
        border: 2px dashed rgba(255, 255, 255, 0.3); /* Bordo tratteggiato */
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        transition: border-color 0.3s ease;
    }

    .add-card:hover {
        border-color: rgba(255, 255, 255, 0.5); /* Cambia colore del bordo al passaggio del mouse */
    }

    .add-icon {
        font-size: 3em;
        color: rgba(255, 255, 255, 0.5); /* Icona + trasparente */
    }

    .popup {
        display: none;
        position: fixed;
        z-index: 999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        overflow: auto;
    }

    .popup-content {
        background-color: #fefefe;
        margin: 15% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 400px;
        border-radius: 10px;
        position: relative;
    }

    .close-popup {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close-popup:hover,
    .close-popup:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .popup {
    /* Stili generici per il popup */
    display: none;
    position: fixed;
    z-index: 999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    overflow: auto;
}

.popup-content {
    /* Stili per il contenuto del popup */
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 400px;
    border-radius: 10px;
    position: relative;
    text-align: center; /* Centra il contenuto */
}

.close-popup {
    /* Stili per il pulsante di chiusura */
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close-popup:hover,
.close-popup:focus {
    color: black;
    text-decoration: none;
}

h2 {
    /* Stili per il titolo */
    margin-top: 0;
    font-size: 1.5em;
    color: #333;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.form-group {
    /* Stili per il gruppo di input */
    margin-bottom: 20px;
}

label {
    /* Stili per le etichette */
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-control {
    /* Stili per gli input */
    width: calc(100% - 20px); /* Calcola la larghezza sottraendo il padding */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 1em;
    box-sizing: border-box; /* Assicura che il padding non aggiunga larghezza */
}

button {
    /* Stili per il pulsante */
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #0056b3;
}

button:focus {
    outline: none;
}

button:active {
    transform: translateY(1px);
}
    
</style>

<script>
function editCard(numero) {
	
	console.log(numero);
    $.ajax({
        url: 'AreaPersonaleControl',
        method: 'GET',
        data: {
            action: 'viewCard',
            numero: numero
        },
        success: function(response) {
            var popup = document.getElementById('popup');
            var popupCardDetails = document.getElementById('popup-card-details');
            popupCardDetails.innerHTML = response;
            popup.style.display = 'block';
        },
        error: function(xhr, status, error) {
            console.error('Errore durante il recupero dei dettagli della carta');
            alert('Errore durante il recupero dei dettagli della carta');
        }
    });
}

function editValueCard(numero, nome, scadenza, cvv) {
    openEditCardPopup(numero, nome, scadenza, cvv);
}

function editValue() {
    var numero = document.getElementById('editCardNumber').value;
    var nome = document.getElementById('editCardName').value;
    var scadenza = document.getElementById('editCardExpiry').value;
    var cvv = document.getElementById('editcvv').value;

    $.ajax({
        url: 'AreaPersonaleControl',
        method: 'GET',
        data: {
            action: 'editCard',
            cardNumber: numero,
            fullName: nome,
            expiryDate: scadenza,
            newcvv: cvv,
            username: '<%= user.getUsername() %>'
        },
        success: function(response) {
            // Chiudi il popup dopo il salvataggio
            closeEditCardPopup();
            closeAddCardPopup();
            closePopup()

            // Aggiorna l'interfaccia della carta modificata
            var cardDiv = $('[data-card-number="' + numero + '"]').closest('.credit-card');
            cardDiv.find('.card-number').text(numero);
            cardDiv.find('.card-name').text(nome);
            cardDiv.find('.card-expiry').text('Valid Thru: ' + scadenza);

            // Resetta il form di modifica della carta
            document.getElementById('editCardForm').reset();
        },
        error: function(xhr, status, error) {
            console.error('Errore durante il salvataggio della carta');
            alert('Errore durante il salvataggio della carta');
        }
    });
}




    function openAddCardPopup() {
        var addCardPopup = document.getElementById('addCardPopup');
        addCardPopup.style.display = 'block';
    }

    function closeAddCardPopup() {
        var addCardPopup = document.getElementById('addCardPopup');
        addCardPopup.style.display = 'none';
    }

    function openEditCardPopup(numero, nome, scadenza, cvv) {
        var editCardPopup = document.getElementById('editCardPopup');
        document.getElementById('editCardNumber').value = numero;
        document.getElementById('editCardName').value = nome;
        document.getElementById('editCardExpiry').value = scadenza;
        document.getElementById('editcvv').value = cvv;
        editCardPopup.style.display = 'block';
    }


    function closeEditCardPopup() {
        var EditCardPopup = document.getElementById('editCardPopup');
        EditCardPopup.style.display = 'none';
    }

    function saveNewCard() {
        var newCardNumber = document.getElementById('newCardNumber').value;
        var newCardName = document.getElementById('newCardName').value;
        var newCardExpiry = document.getElementById('newCardExpiry').value;
        var newcvv = document.getElementById('newcvv').value;

        // Esegui una richiesta AJAX per aggiungere la nuova carta
        $.ajax({
            url: 'AreaPersonaleControl', // Sostituisci con il percorso corretto per la tua servlet
            method: 'GET',
            data: {
                action: 'insertCards', // Azione per inserire una nuova carta
                fullName: newCardName,
                cardNumber: newCardNumber,
                expiryDate: newCardExpiry,
                cvv: newcvv,
                username: '<%= user.getUsername() %>' // Assicura che username sia accessibile e correttamente passato
            },
            success: function(response) {
                // Verifica che i dati siano correttamente ricevuti
                console.log(response);

                // Crea gli elementi HTML per la nuova carta
                var colDiv = document.createElement('div');
                colDiv.classList.add('col', 'mb-4');

                var creditCardDiv = document.createElement('div');
                creditCardDiv.classList.add('credit-card');
                creditCardDiv.setAttribute('data-username', response.username);
                creditCardDiv.setAttribute('data-card-number', newCardNumber);

                var editCardDiv = document.createElement('div');
                editCardDiv.classList.add('edit-card');
                editCardDiv.textContent = 'Modifica';
                editCardDiv.onclick = function() {
                    editCard(newCardNumber); // Chiama la funzione editCard passando il numero della carta
                };

                var cardChipDiv = document.createElement('div');
                cardChipDiv.classList.add('card-chip');

                var cardNumberDiv = document.createElement('div');
                cardNumberDiv.classList.add('card-number');
                cardNumberDiv.textContent = newCardNumber;

                var cardNameDiv = document.createElement('div');
                cardNameDiv.classList.add('card-name');
                cardNameDiv.textContent = newCardName;

                var cardExpiryDiv = document.createElement('div');
                cardExpiryDiv.classList.add('card-expiry');
                cardExpiryDiv.textContent = 'Valid Thru: ' + newCardExpiry;

                // Costruisci la struttura gerarchica degli elementi
                creditCardDiv.appendChild(editCardDiv);
                creditCardDiv.appendChild(cardChipDiv);
                creditCardDiv.appendChild(cardNumberDiv);
                creditCardDiv.appendChild(cardNameDiv);
                creditCardDiv.appendChild(cardExpiryDiv);

                colDiv.appendChild(creditCardDiv);

                // Aggiungi il nuovo elemento al DOM
                var allCardDiv = document.getElementById('allCard');
                var rowDiv = allCardDiv.querySelector('.row');
                rowDiv.insertBefore(colDiv, rowDiv.firstChild); // Inserisci la nuova carta come prima figlia della row

                // Chiudi il popup dopo il salvataggio
                closeAddCardPopup();

                // Resetta i campi del form
                document.getElementById('newCardForm').reset();
            },
            error: function(xhr, status, error) {
                console.error('Errore durante l\'aggiunta della carta', error);
                alert('Errore durante l\'aggiunta della carta');
            }
        });
    }


    function removeCard(numero) {
        $.ajax({
            url: 'AreaPersonaleControl', // Sostituisci con il percorso corretto per la tua servlet
            method: 'GET',
            data: {
                action: 'deleteCard', // Azione per eliminare una carta
                numero: numero // Passa il numero della carta da eliminare
            },
            success: function(response) {
                $('[data-card-number="' + numero + '"]').closest('.col').remove(); // Rimuove la carta dal DOM
                closePopup(); // Chiudi il popup dei dettagli della carta se � ancora aperto

            },
            error: function(xhr, status, error) {
                console.error('Errore durante l\'eliminazione della carta', error);
                alert('Errore durante l\'eliminazione della carta');
            }
        });
    }


    function closePopup() {
        var popup = document.getElementById('popup');
        if (popup.style.display === 'block') {
            popup.style.display = 'none';
        }
    }

</script>
