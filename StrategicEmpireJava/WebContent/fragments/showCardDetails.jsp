
    <style>
/* Stili per il popup */
.popup {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999; /* Assicura che il popup sia sopra gli altri elementi */
}

.popup-content {
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    text-align: left; /* Allinea il testo a sinistra */
    width: 300px; /* Imposta una larghezza fissa per il popup */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.close-popup {
    float: right;
    cursor: pointer;
    margin-top: -10px; /* Aggiusta la posizione del pulsante di chiusura */
    margin-right: -10px; /* Aggiusta la posizione del pulsante di chiusura */
}

.card-details {
    background-color: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
    text-align: center; /* Centra gli elementi all'interno */
}

.card-details h2 {
    margin-top: 0;
    font-size: 1.5em;
    color: #333;
    text-transform: uppercase;
    letter-spacing: 1px;
    border-bottom: 1px solid #ddd;
    padding-bottom: 10px;
}

.card-info {
    margin-bottom: 15px;
    text-align: left; /* Allinea il testo a sinistra */
}

.card-info p {
    margin: 8px 0;
    font-size: 1em;
}

.card-info strong {
    font-weight: bold;
}

.card-actions {
    text-align: center; /* Centra i bottoni */
    margin-top: 10px; /* Aggiusta lo spazio sopra i bottoni */
}

.btn {
    padding: 8px 16px;
    font-size: 1em;
    cursor: pointer;
    border: none;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

.btn-edit {
    background-color: #007bff;
    color: #fff;
}

.btn-edit:hover {
    background-color: #0056b3;
}

.btn-remove {
    background-color: #dc3545;
    color: #fff;
    margin-left: 10px;
}

.btn-remove:hover {
    background-color: #c82333;
}

        
    </style>
<div id="cardDetails" class="card-details">
    <h2>Dettagli carta</h2>
    <div class="card-info">
        <p><strong>Numero:</strong> <span id="cardNumber">${c.numero}</span></p>
        <p><strong>Nome:</strong> <span id="cardName">${c.nome}</span></p>
        <p><strong>Scadenza:</strong> <span id="cardExpiry">${c.scadenza}</span></p>
        <p><strong>CVV:</strong> <span id="cardCvv">${c.cvv}</span></p>
    </div>
    <div class="card-actions">
        <button class="btn btn-edit" onclick="editValueCard('${c.numero}', '${c.nome}', '${c.scadenza}', '${c.cvv}')">Modifica</button>
        <button class="btn btn-remove" onclick="removeCard('${c.numero}')">Rimuovi</button>
    </div>
</div>


