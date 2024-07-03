  $('.add-esp-to-cart').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione

        var codEsp = $(this).data('cod-espansione');
        var username = $(this).data('username'); // Recupera l'username
        console.log(codEsp);
        console.log(username);
        // Imposta i dati di base
        var data = {
            action: 'addCarrello',
            cod_articolo: codEsp
        };

        // Aggiungi l'username ai dati se è diverso da null
        if (username && username !== "null") {
            data.username = username;
        }

        $.ajax({
            url: 'CarrelloControl',
            method: 'POST',
            data: data,
            success: function(response) {
                $('#toastMessage').text('Oggetto aggiunto al carrello!');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            },
            error: function(xhr, status, error) {
                $('#toastMessage').text('Errore durante l\'aggiunta dell\'espansione al carrello.');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            }
        });
    });

  $('.add-acc-to-cart').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione

        var codAcc = $(this).data('cod-accessorio');
        var username = $(this).data('username'); // Recupera l'username
        console.log(codAcc);
        console.log(username);
        // Imposta i dati di base
        var data = {
            action: 'addCarrello',
            cod_articolo: codAcc
        };

        // Aggiungi l'username ai dati se è diverso da null
        if (username && username !== "null") {
            data.username = username;
        }

        $.ajax({
            url: 'CarrelloControl',
            method: 'POST',
            data: data,
            success: function(response) {
                $('#toastMessage').text('Oggetto aggiunto al carrello!');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            },
            error: function(xhr, status, error) {
                $('#toastMessage').text('Errore durante l\'aggiunta dell\'accessorio al carrello.');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            }
        });
    });

$(document).ready(function() {
    $('.add-gioco-to-cart').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione

        var codGioco = $(this).data('cod-gioco');
        var nomeGioco = $(this).data('nomegioco');
        var prezzo = $(this).data('prezzo');
        var username = $(this).data('username'); // Recupera l'username
        console.log(codGioco);
		console.log(username);
        // Imposta i dati di base
        var data = {
            action: 'addCarrello',
            cod_articolo: codGioco
        };

        // Aggiungi l'username ai dati se è diverso da null
        if (username && username !== "null") {
            data.username = username;
        }

        $.ajax({
            url: 'CarrelloControl',
            method: 'POST',
            data: data,
            success: function(response) {
                $('#toastMessage').text('Oggetto aggiunto al carrello!');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            },
            error: function(xhr, status, error) {
                $('#toastMessage').text('Errore durante l\'aggiunta del gioco al carrello.');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            }
        });
    });
});
