function decreaseQuantity(codiceArticolo) {
    $.ajax({
        type: "POST",
        url: "update_quantity.jsp",
        data: {
            codiceArticolo: codiceArticolo,
            operation: "decrease"
        },
        success: function(response) {
            console.log("Response received (decrease):", response); // Aggiungi questa riga per debug
            var quantityElement = document.getElementById("quantity_" + codiceArticolo);
            quantityElement.innerText = "   " + response.trim(); // Usa .trim() per rimuovere eventuali spazi bianchi
        },
        error: function(xhr, status, error) {
            console.error("Errore durante l'aggiornamento della quantità:", error);
        }
    });
}

function increaseQuantity(codiceArticolo) {
    $.ajax({
        type: "POST",
        url: "update_quantity.jsp",
        data: {
            codiceArticolo: codiceArticolo,
            operation: "increase"
        },
        success: function(response) {
            // Aggiorna il valore della quantità lato client
            var quantityElement = document.getElementById("quantity_" + codiceArticolo);
            quantityElement.innerText = "   " + response;
        },
        error: function(xhr, status, error) {
            console.error("Errore durante l'aggiornamento della quantità:", error);
        }
    });
}
