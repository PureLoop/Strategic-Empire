document.addEventListener('DOMContentLoaded', function() {
    // Aggiungi un listener per il submit del form dei commenti
    document.getElementById('comment-form').addEventListener('submit', function(e) {
        e.preventDefault(); // Previeni il comportamento predefinito di invio del form

        // Recupera i valori inseriti dall'utente e rimuovi spazi vuoti iniziali e finali
        const username = document.getElementById('username').value.trim();
        const commentText = document.getElementById('comment').value.trim();

        // Verifica che entrambi i campi siano compilati
        if (username === '' || commentText === '') {
            alert('Nome e commento sono obbligatori');
            return; // Interrompi l'esecuzione della funzione se uno dei campi è vuoto
        }

        // Funzione per inserire il commento nel DOM
        addComment(username, commentText);

        // Resetta il form dopo l'invio del commento
        document.getElementById('username').value = '';
        document.getElementById('comment').value = '';

        // Notifica l'utente che il commento è stato inviato con successo
        showAlert('Commento inviato con successo!');
    });

    // Funzione per aggiungere un commento al DOM
    function addComment(username, commentText) {
        const commentContainer = document.getElementById('comment-container'); // Seleziona il container dei commenti
        const commentDiv = document.createElement('div'); // Crea un nuovo elemento div
        commentDiv.classList.add('comment'); // Aggiungi classi CSS all'elemento div creato
        commentDiv.innerHTML = `<p><strong>${username}:</strong> ${commentText}</p>`; // Inserisci il markup HTML per il commento
        commentContainer.prepend(commentDiv); // Aggiungi il commento all'inizio del container dei commenti
    }

    // Funzione per mostrare un alert temporaneo
    function showAlert(message) {
        const alertDiv = document.createElement('div'); // Crea un elemento div per l'allert
        alertDiv.classList.add('alert', 'alert-success'); // Aggiungi classi Bootstrap per lo stile dell'allert
        alertDiv.textContent = message; // Aggiungi il testo dell'allert
        document.body.appendChild(alertDiv); // Aggiungi l'allert al body del documento

        // Rimuovi l'allert dopo 3 secondi
        setTimeout(function() {
            alertDiv.remove();
        }, 3000); // 3000 millisecondi (3 secondi)
    }
});


