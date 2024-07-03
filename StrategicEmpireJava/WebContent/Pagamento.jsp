<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, it.unisa.bean.OggettiCarrelloBean" %>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <%@ include file="header/header.jsp" %>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        .cont {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 100%;
            max-width: 700px;
            background: white;
            padding: 20px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 70vh;
        }

        .cont form {
            width: 100%;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form .row {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .row .column {
            flex: 1 1 250px;
        }

        .column .title {
            font-size: 20px;
            color: #333;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        .column .input-box {
            margin: 15px 0;
        }

        .input-box span {
            display: block;
            margin-bottom: 10px;
        }

        .input-box input {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
        }

        .column .flex {
            display: flex;
            gap: 15px;
        }

        .flex .input-box {
            margin-top: 5px;
        }

        .input-box img {
            height: 34px;
            margin-top: 10px;
            filter: drop-shadow(0 0 1px #000);
        }

        form .btn2 {
            width: 100%;
            padding: 12px;
            background: #8175d3;
            border: none;
            outline: none;
            border-radius: 6px;
            font-size: 17px;
            color: #fff;
            margin-top: 5px;
            cursor: pointer;
            transition: .5s;
        }

        form .btn2:hover {
            background: #6a5acd;
        }

        body {
            background-color: #f8f9fa;
        }

        .input-box input.valid {
            border-color: #4caf50;
        }

        .input-box input.invalid {
            border-color: #f44336;
        }

        .fixed-payment-details {
            position: sticky;
            top: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #4ca1af;
        }

        .btn-primary {
            background-color: #4ca1af;
            border-color: #4ca1af;
        }

        .btn-primary:hover {
            background-color: #357e85;
            border-color: #357e85;
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
            animation: fadeIn 0.5s ease-in-out;
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
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            animation: zoomIn 0.5s ease-in-out;
        }

        .popup-content h3 {
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        .close-popup {
            color: #aaa;
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            cursor: pointer;
        }

        .close-popup:hover,
        .close-popup:focus {
            color: black;
            text-decoration: none;
        }

        .btn-see-cards {
            position: absolute;
            top: 20px;
            right: 20px;
            z-index: 1000;
        }
        
        .checkmark-wrapper {
            margin: 20px auto;
            width: 100px;
            height: 100px;
        }

        .checkmark {
            width: 100%;
            height: 100%;
            transform: rotate(45deg);
        }

        .checkmark-circle {
            stroke: #4CAF50;
            stroke-width: 2;
            fill: none;
        }

        .checkmark-check {
            stroke: #4CAF50;
            stroke-width: 4;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes zoomIn {
            from { transform: scale(0.7); opacity: 0; }
            to { transform: scale(1); opacity: 1; }
        }
    </style>
</head>
<body>
<%

List<OggettiCarrelloBean> carrellobean = (List<OggettiCarrelloBean>) request.getSession().getAttribute("oggettiCarrello");
System.out.println("Pamaneto"+carrellobean.size());
	String total = request.getParameter("total");
    u = (User) session.getAttribute("user");
    loggedIn = (u != null);
    

%>

<div class="cont">
    <form id="paymentForm">
        <div class="row">
            <div class="column">
                <h3 class="title">Indirizzo di fatturazione</h3>
                <div class="input-box">
                    <span>Nome completo:</span>
                    <input type="text" id="fullName" placeholder="Jacob Aiden" value="<%= loggedIn ? u.getNome() : "" %>">
                </div>
                <div class="input-box">
                    <span>Email:</span>
                    <input type="text" id="email" placeholder="example@example.com" value="<%= loggedIn ? u.getEmail() : "" %>">
                </div>
                <div class="input-box">
                    <span>Indirizzo:</span>
                    <input type="text" id="address" placeholder="Via - Numero civico - Località" value="<%= loggedIn ? u.getIndirizzo() : "" %>">
                </div>
                <div class="input-box">
                    <span>Città:</span>
                    <input type="text" id="city" placeholder="Berlino">
                </div>
                <div class="flex">
                    <div class="input-box">
                        <span>Stato:</span>
                        <input type="text" id="state" placeholder="Germania">
                    </div>
                    <div class="input-box">
                        <span>CAP:</span>
                        <input type="text" id="postalCode" placeholder="12345" maxlength="5" inputmode="numeric">
                    </div>
                </div>
            </div>
            <br>
            <div class="column">
                <h3 class="title">Pagamento</h3>
                <div class="input-box">
                    <span>Carte accettate:</span>
                    <img src="imgcards.png" alt="Immagine della carta">
                </div>
                <div class="input-box">
                    <span>Nome sulla carta:</span>
                    <input type="text" id="cardName" placeholder="Nome sulla carta">
                </div>
                <div class="input-box">
                    <span>Numero della carta di credito:</span>
                    <input type="text" id="cardNumber" placeholder="Numero della carta di credito" maxlength="16">
                </div>
                <div class="input-box">
                    <span>Mese di scadenza:</span>
                    <input type="text" id="cardExpiryMonth" placeholder="Mese di scadenza">
                </div>
                <div class="flex">
                    <div class="input-box">
                        <span>Anno Scadenza:</span>
                        <input type="text" id="cardExpiryYear" placeholder="Anno di scadenza">
                    </div>
                    <div class="input-box">
                        <span>CVV:</span>
                        <input type="text" id="cardCVV" placeholder="CVV" maxlength="3">
                    </div>
                </div>
            </div>
        </div>
		<div class="input-box">
    <span>Totale:</span>
    <div id="totalValue"></div>
</div>


        <div>
            <button type="submit" class="btn2">Invia</button>
        </div>a
        
        <!-- Aggiunta del pulsante "Vedi le tue carte" -->
        <button type="button" class="btn btn-primary mb-3 btn-see-cards" onclick="openCardPopup()">Vedi le tue carte</button>
        
    </form>
</div>

<!-- Pop-up per le carte salvate -->
<div id="popup" class="popup">
    <div class="popup-content">
        <span class="close-popup" onclick="closeCardPopup()">&times;</span>
        <h3>Seleziona carta</h3>
        <div id="cardList" class="text-center">
            <!-- Carte inserite dinamicamente -->
        </div>
    </div>
</div>

<!-- Pop-up per il completamento del pagamento -->
<div id="paymentCompletePopup" class="popup">
    <div class="popup-content payment-complete-content">
        <span class="close-popup" onclick="closePaymentCompletePopup()">&times;</span>
        <h3>Pagamento Completato!</h3>
        <div class="checkmark-wrapper">
            <svg class="checkmark" viewBox="0 0 52 52" xmlns="http://www.w3.org/2000/svg">
                <circle class="checkmark-circle" cx="26" cy="26" r="25" fill="none"/>
                <path class="checkmark-check" fill="none" d="M14 27l7 7 14-14"/>
            </svg>
        </div>
        <p>Il pagamento è stato completato con successo.</p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    // Funzione per validare un campo di input
    function validateInput(input) {
        const id = input.id;

        // Valida il campo in base al suo ID
        let isValid = false;
        switch(id) {
            case 'postalCode':
                isValid = /^[0-9]{5}$/.test(input.value);
                break;
            case 'state':
            case 'cardName':
                isValid = /^[a-zA-Z\s]+$/.test(input.value);
                break;
            case 'cardNumber':
                isValid = /^[0-9]{16}$/.test(input.value);
                break;
            case 'cardCVV':
                isValid = /^[0-9]{3}$/.test(input.value);
                break;
            default:
                isValid = input.value.trim() !== '';
        }

        if (isValid) {
            input.classList.add('valid');
            input.classList.remove('invalid');
        } else {
            input.classList.add('invalid');
            input.classList.remove('valid');
        }
    }

    // Funzione per limitare la lunghezza dell'input a 16 caratteri
    function limitCardNumberLength() {
        const cardNumberInput = document.getElementById('cardNumber');
        cardNumberInput.addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, ''); // Rimuove caratteri non numerici
            if (this.value.length > 16) {
                this.value = this.value.slice(0, 16);
            }
            validateInput(this);
        });
    }

    // Funzione per impedire l'inserimento di caratteri non numerici
    function restrictNonNumericInput(input) {
        input.addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, ''); // Rimuove caratteri non numerici
            validateInput(this);
        });
    }

    // Funzione per impedire l'inserimento di caratteri non alfabetici
    function restrictNonAlphabeticInput(input) {
        input.addEventListener('input', function() {
            this.value = this.value.replace(/[^a-zA-Z\s]/g, ''); // Rimuove caratteri non alfabetici e spazi
            validateInput(this);
        });
    }

    // Funzione per validare tutti i campi di input
    function validateAllInputs() {
        var inputs = document.querySelectorAll('.input-box input');
        inputs.forEach(input => validateInput(input));
    }

    // Funzione per caricare le carte salvate tramite AJAX e popolare il pop-up
    function showCard(username) {
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'ShowCards2',
                username: username
            },
            success: function(response) {
                $('#cardList').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }

    // Aprire il pop-up delle carte
    function openCardPopup() {
        showCard('<%= u.getUsername() %>');
        document.getElementById('popup').style.display = 'block';
    }

    // Chiudere il pop-up delle carte
    function closeCardPopup() {
        document.getElementById('popup').style.display = 'none';
    }

    // Funzione per mostrare il pop-up di completamento del pagamento
    function showPaymentCompletePopup() {
        document.getElementById('paymentCompletePopup').style.display = 'block';
    }

    // Funzione per chiudere il pop-up di completamento del pagamento
    function closePaymentCompletePopup() {
        document.getElementById('paymentCompletePopup').style.display = 'none';
    }

    // Funzione per prepopolare il modulo con i dati della carta selezionata
    function populateCardDetails() {
        var cardNumber = localStorage.getItem('selectedCardNumber');
        var cardName = localStorage.getItem('selectedCardName');
        var cardExpiry = localStorage.getItem('selectedCardExpiry');

        if (cardNumber && cardName && cardExpiry) {
            var expiryParts = cardExpiry.split('/');
            document.getElementById('cardNumber').value = cardNumber;
            document.getElementById('cardName').value = cardName;
            document.getElementById('cardExpiryMonth').value = expiryParts[0] || '';
            document.getElementById('cardExpiryYear').value = expiryParts[1] || '';
            // Assumendo che il CVV non è salvato nel localStorage; se necessario, può essere aggiunto
        }
    }
    function RemoveOggettiPagati() {
        $.ajax({
            url: 'CarrelloControl',
            method: 'GET',
            data: {
                action: 'removeOggettiPagati',
                username: '<%= u.getUsername() %>'
            },
            success: function(response) {
                $('#cardList').html(response);
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }
    // Validare il modulo al submit
    document.getElementById('paymentForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Previene l'invio reale del modulo
        validateAllInputs(); // Validare tutti i campi

        // Verificare se tutti i campi sono validi
        const isFormValid = [...document.querySelectorAll('.input-box input')].every(input => input.classList.contains('valid'));
        if (isFormValid) {
            showPaymentCompletePopup(); // Mostra il pop-up di completamento del pagamento
            RemoveOggettiPagati()         
            }
        
    });

    
    // Popolare i dettagli della carta quando la pagina viene caricata
    window.onload = function() {
        populateCardDetails();
        validateAllInputs(); // Controlla lo stato dei campi all'avvio
        limitCardNumberLength(); // Limita la lunghezza del numero della carta
        restrictNonNumericInput(document.getElementById('postalCode'));
        restrictNonNumericInput(document.getElementById('cardCVV'));
        restrictNonAlphabeticInput(document.getElementById('state'));
        restrictNonAlphabeticInput(document.getElementById('cardName'));
    };

    // Aggiungi listener per l'evento 'input' su tutti i campi di input
    document.querySelectorAll('.input-box input').forEach(input => {
        if (input.id === 'postalCode' || input.id === 'cardNumber' || input.id === 'cardCVV') {
            restrictNonNumericInput(input);
        } else if (input.id === 'state' || input.id === 'cardName') {
            restrictNonAlphabeticInput(input);
        } else {
            input.addEventListener('input', function() {
                validateInput(this);
            });
        }
    });
    
    
    document.addEventListener('DOMContentLoaded', () => {
        // Funzione per aggiornare il valore del total solo se è valido
        function updateTotal(total) {
            // Solo se il valore non è null e non è una stringa vuota
            if (total && total.trim() !== '') {
                localStorage.setItem('total', total);
                console.log("Total updated in localStorage:", total); // Verifica che il valore sia aggiornato
            }
        }

        // Recupera il parametro 'total' dalla richiesta
        const totalFromRequest = '<%= request.getParameter("total") %>';
        console.log("Total from request:", totalFromRequest); // Verifica il valore

        // Solo se 'total' è passato e non è null o vuoto, aggiorna il localStorage
        if (totalFromRequest && totalFromRequest.trim() !== 'null') {
            updateTotal(totalFromRequest);
        }

        // Recupera il valore di 'total' dal localStorage
        const totalFromStorage = localStorage.getItem('total');
        console.log("Total retrieved from localStorage:", totalFromStorage); // Verifica che il valore venga recuperato

        // Visualizza il valore di 'total' nel campo desiderato
        const totalElement = document.getElementById('totalValue');
        if (totalElement) {
            totalElement.textContent = totalFromStorage ? totalFromStorage : 'N/A'; // Mostra 'N/A' se non ci sono valori
        } else {
            console.error("Element with id 'totalValue' not found."); // Verifica che l'elemento esista
        }
    });
    
</script>

</body>
</html>