<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="it.unisa.bean.RecensioneBean" %>
<html>
<head>
    <title>Visualizzazione Recensione</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        /* Stili per le stelline e il pop-up */
        .stars {
            display: inline-block;
            font-size: 20px;
        }

        .star {
            color: #FFD700; /* Colore giallo per le stelline */
        }

        .review-popup {
            display: none; /* Inizialmente nascosto */
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5); /* Sfondo semi-trasparente */
            z-index: 9999; /* Z-index alto per essere sopra tutto */
            overflow: auto;
            padding-top: 50px;
        }

        .review-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Stili per il form di inserimento recensione */
        #reviewForm {
            display: flex;
            flex-direction: column;
        }

        #reviewForm label {
            margin-top: 10px;
            font-weight: bold;
        }

        #reviewForm input[type="text"],
        #reviewForm textarea,
        #reviewForm input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        #reviewForm button {
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        #reviewForm button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h1>Visualizzazione Recensione</h1>
    
    <!-- Visualizzazione dettagli recensione -->
    <div id="reviewDetails">
        <% 
            RecensioneBean recensione = (RecensioneBean) request.getAttribute("recensione");
            if (recensione != null) {
        %>
            <p><strong>Codice Recensione:</strong> <%= recensione.getCod_Review() %></p>
            <p><strong>Titolo:</strong> <%= recensione.getTitolo() %></p>
            <p><strong>Descrizione:</strong> <%= recensione.getDescrizione() %></p>
            <p><strong>Valutazione:</strong>
                <div class="stars">
                    <% for (int i = 1; i <= recensione.getValutazione(); i++) { %>
                        <span class="star">&#9733;</span>
                    <% } %>
                </div>
            </p>
            <p><strong>Utente:</strong> <%= recensione.getUsername() %></p>
            <p><strong>Codice Ordine:</strong> <%= recensione.getCodOrdine() %></p>
        <% } else { %>
            <p>Nessuna recensione trovata.</p>
            <!-- Pulsante per aprire il pop-up di inserimento recensione -->
            <button onclick="showReviewFormPopup()">Inserisci Recensione</button>
            
            <!-- Pop-up per il form di inserimento recensione -->
            <div id="reviewFormPopup" class="review-popup">
                <div class="review-content">
                    <span class="close" onclick="closeReviewFormPopup()">&times;</span>
                    <h2>Inserimento Recensione</h2>
                    <form id="reviewForm">
                        <input type="hidden" id="codiceOrdine" name="codiceOrdine" value="<%= request.getAttribute("codiceOrdine") %>">
                        <input type="hidden" id="username" name="username" value="<%= request.getAttribute("username") %>">
                        
                        <!-- Campi del form per inserire la recensione -->
                        <label for="titolo">Titolo:</label>
                        <input type="text" id="titolo" name="titolo" required>
                        
                        <label for="descrizione">Descrizione:</label><br>
                        <textarea id="descrizione" name="descrizione" required></textarea><br>
                        
                        <label for="valutazione">Valutazione:</label><br>
                        <input type="number" id="valutazione" name="valutazione" min="1" max="5" required>
                        
                        <button type="button" onclick="saveRecensione()">Invia Recensione</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>

    <script>
        // Funzione per mostrare il pop-up del form di inserimento recensione
        function showReviewFormPopup() {
            // Resettare i campi del form quando viene mostrato il pop-up
            document.getElementById('titolo').value = "";
            document.getElementById('descrizione').value = "";
            document.getElementById('valutazione').value = "";
            
            document.getElementById('reviewFormPopup').style.display = 'block';
        }

        // Funzione per inviare i dati del form alla servlet usando jQuery
        function saveRecensione() {
            var codiceOrdine = $('#codiceOrdine').val();
            var username = $('#username').val();
            var titolo = $('#titolo').val();
            var descrizione = $('#descrizione').val();
            var valutazione = $('#valutazione').val();
            
            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'POST',
                data: {
                    action: 'insertRev',
                    codiceOrdine: codiceOrdine,
                    username: username,
                    titolo: titolo,
                    descrizione: descrizione,
                    valutazione: valutazione
                },
                success: function(response) {
                    // Aggiorna la parte della pagina con i dettagli della recensione
                    $('#reviewDetails').html(response);
                    // Chiudi il pop-up dopo l'invio della recensione
                    closeReviewFormPopup();
                },
                error: function(xhr, status, error) {
                    console.error('Errore durante l\'invio della recensione:', status, error);
                    // Gestisci l'errore se necessario
                }
            });
        }

        // Funzione per chiudere il pop-up del form di inserimento recensione
        function closeReviewFormPopup() {
            document.getElementById('reviewFormPopup').style.display = 'none';
        }
    </script>
</body>
</html>