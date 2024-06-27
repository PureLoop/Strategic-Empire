$(document).ready(function () {
            $('.add-esp-to-cart').off('click').on('click', function (event) {
                event.preventDefault(); // Prevenire la navigazione
                var codEsp = $(this).data('cod-espansione');

                $.ajax({
                    url: 'CarrelloControl',
                    method: 'POST',
                    data: {
                        action: 'AddEspansione',
                        cod_espansione: codEsp
                    },
                    success: function (response) {
                    	$('#toastMessage').text(`Oggetto aggiunto al carrello!`);
                        var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                        toastElement.show();
                        setTimeout(function() {
                            toastElement.hide();
                        }, 1500); // Nasconde il toast dopo 1 secondo
                    },
                    error: function (xhr, status, error) {
                    	$('#toastMessage').text('Errore durante l\'aggiunta del\'espansione al carrello.');
                        var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                        toastElement.show();
                        setTimeout(function() {
                            toastElement.hide();
                        }, 1500); // Nasconde il toast dopo 1 secondo
                    }
                });
            });
        });

$(document).ready(function () {
    $('.add-acc-to-cart').off('click').on('click', function (event) {
        event.preventDefault(); // Prevenire la navigazione
        var codAcc = $(this).data('cod-accessorio');

        $.ajax({
            url: 'CarrelloControl',
            method: 'POST',
            data: {
                action: 'AddAccessorio',
                cod_accessorio: codAcc
            },
            success: function (response) {
            	$('#toastMessage').text(`Oggetto aggiunto al carrello!`);
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            },
            error: function (xhr, status, error) {
            	$('#toastMessage').text('Errore durante l\'aggiunta dell\' accessorio al carrello.');
                var toastElement = new bootstrap.Toast(document.getElementById('cartToast'));
                toastElement.show();
                setTimeout(function() {
                    toastElement.hide();
                }, 1500); // Nasconde il toast dopo 1 secondo
            }
        });
    });
});

$(document).ready(function() {
    $('.add-gioco-to-cart').off('click').on('click', function(event) {
        event.preventDefault(); // Prevenire la navigazione
        var codGioco = $(this).data('cod-gioco');
        var nomeGioco = $(this).data('nomegioco');
        var prezzo = $(this).data('prezzo');

        $.ajax({
            url: 'CarrelloControl',
            method: 'POST',
            data: {
                action: 'AddGioco',
                cod_gioco: codGioco
            },
            success: function(response) {
                $('#toastMessage').text(`Oggetto aggiunto al carrello!`);
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