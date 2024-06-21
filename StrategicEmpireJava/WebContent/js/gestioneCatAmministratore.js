document.getElementById("Modifica").addEventListener('click', function(){
    	document.getElementById("choiceProdottiUp").style.display = 'flex';
    	document.getElementById("btnChoice").style.display = 'none';
    });
    
    document.getElementById("Inserisci").addEventListener('click', function(){
    	document.getElementById("choiceProdotti").style.display = 'flex';
    	document.getElementById("btnChoice").style.display = 'none';
    	
    });
    
    document.getElementById("addUpdateCatalog").addEventListener('click', function(){
    	if(document.getElementById("btnChoice").style.display === 'flex'){
    		document.getElementById("btnChoice").style.display = 'none';
    	}else{
    		document.getElementById("btnChoice").style.display = 'flex';
    	}
    });
    
    $(document).ready(function() { 	
    	
    	$('#giochiIns').off('click').on('click',function(event){
    		event.preventDefault(); // Prevenire la navigazione
    		$("#choiceProdotti").css('display','none');
    		$.ajax({
    			url: 'AreaPersonaleControl',
    			method: "GET",
    			data:{
    				action: 'showInsForm',
    				type: 'gioco'
    			},
    			success: function(response){
    				$('#insertCatContainer').html(response);
    				attachInputValidation()
    			},
    			error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
    		});
    	});
    	
    	$('#accessoriIns').off('click').on('click',function(event){
    		event.preventDefault(); // Prevenire la navigazione
    		$("#choiceProdotti").css('display','none');
    		$.ajax({
    			url: 'AreaPersonaleControl',
    			method: "GET",
    			data:{
    				action: 'showInsForm',
    				type: 'accessorio'
    			},
    			success: function(response){
    				$('#insertCatContainer').html(response);
    				attachInputValidation()
    			},
    			error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
    		});
    	});
    	
    	$('#espansioniIns').off('click').on('click',function(event){
    		event.preventDefault(); // Prevenire la navigazione
    		$("#choiceProdotti").css('display','none');
    		$.ajax({
    			url: 'AreaPersonaleControl',
    			method: "GET",
    			data:{
    				action: 'showInsForm',
    				type: 'espansione'
    			},
    			success: function(response){
    				$('#insertCatContainer').html(response);
    				attachInputValidation()
    			},
    			error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
    		});
    	});
    	
        $('#giochi').off('click').on('click', function(event) {
            event.preventDefault(); // Prevenire la navigazione
            $("#choiceProdottiUp").css('display','none');
            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'GET',
                data: {
                    action: 'ShowGioco',
                },
                success: function(response) {
                    $('#updateCatContainer').html(response);
                    attachInputValidation()
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        });
        
        $('#accessori').off('click').on('click', function(event) {
            event.preventDefault(); // Prevenire la navigazione
            $("#choiceProdottiUp").css('display','none');
            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'GET',
                data: {
                    action: 'ShowAccessorio',
                },
                success: function(response) {
                    $('#updateCatContainer').html(response);
                    attachInputValidation()
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        });
        
        $('#espansioni').off('click').on('click', function(event) {
            event.preventDefault(); // Prevenire la navigazione
            $("#choiceProdottiUp").css('display','none');
            $.ajax({
                url: 'AreaPersonaleControl',
                method: 'GET',
                data: {
                    action: 'ShowEspansione',
                },
                success: function(response) {
                    $('#updateCatContainer').html(response);
                    attachInputValidation()
                },
                error: function(xhr, status, error) {
                    console.error('Errore: ' + error);
                }
            });
        });
    });
    
    function showModifyGameForm(gameId) {
        // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'GameModifyForm',
                gameId: gameId
            },
            success: function(response) {
                // Mostra il form di modifica nel contenitore appropriato
                $('#updateCatContainer').html(response);
                attachInputValidation()
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }

    function showModifyAccForm(accId) {
        // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'AccModifyForm',
                accId: accId
            },
            success: function(response) {
                // Mostra il form di modifica nel contenitore appropriato
                $('#updateCatContainer').html(response);
                attachInputValidation()
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }
    
    function showModifyEspForm(espId) {
        // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'EspModifyForm',
                espId: espId
            },
            success: function(response) {
                // Mostra il form di modifica nel contenitore appropriato
                $('#updateCatContainer').html(response);
                attachInputValidation()
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    }
    
    function isValidImage(file) {
        var validTypes = ['image/jpeg', 'image/jpg', 'image/png'];
        return file && validTypes.includes(file.type);
    }
    
    function submitInsForm() {
        var form = document.getElementById('insertForm');
        var formData = new FormData(form); // Crea un oggetto FormData con i dati del form
        var imgCopertina = $('#imgCopertina')[0].files[0];
        var img2 = $('#img2')[0].files[0];

        // Verifica i file selezionati
        if (!isValidImage(imgCopertina)) {
            alert('Il file della COPERTINA deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault(); 
            return;
        }

        if (!isValidImage(img2)) {
            alert('Il file della SECONDA IMG deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault();
            return;
        }
        formData.append('action', 'insertDB'); 

        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            processData: false, // Impedisce a jQuery di trasformare i dati in stringa di query
            contentType: false, // Dice a jQuery di non impostare il content-type
            success: function(response) {
                alert('Prodotto inserito con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'inserimento del prodotto');
            }
        });
    }

    
    function submitGameForm() {
    	var form = document.getElementById('ModifyGameForm');
        var formData = new FormData(form);

        // Aggiungi un campo nascosto 'action' per l'azione della servlet
        formData.append('action', 'updateGame');

        var imgCopertina = $('#imgCopertina')[0].files[0];
        var img2 = $('#img2')[0].files[0];

     // Verifica i file selezionati
        if (!isValidImage(imgCopertina)) {
            alert('Il file della COPERTINA deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault(); 
            return;
        }

        if (!isValidImage(img2)) {
            alert('Il file della SECONDA IMG deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault();
            return;
        }
        
        if (imgCopertina) {
            formData.append('imgCopertina', imgCopertina);
        }

        if (img2) {
            formData.append('img2', img2);
        }
        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            processData: false, // Evita che jQuery trasformi i dati in una stringa di query
            contentType: false, // Usa il boundary del multipart/form-data impostato automaticamente
            success: function(response) {
                alert('Gioco aggiornato con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'aggiornamento del gioco');
            }
        });
    }
    
    function submitAccForm() {
        var form = document.getElementById('ModifyAccForm');
        var formData = new FormData(form);

        // Aggiungi un campo nascosto 'action' per l'azione della servlet
        formData.append('action', 'updateAccessorio');

        var imgCopertina = $('#imgCopertina')[0].files[0];
        var img2 = $('#img2')[0].files[0];

     // Verifica i file selezionati
        if (!isValidImage(imgCopertina)) {
            alert('Il file della COPERTINA deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault(); 
            return;
        }

        if (!isValidImage(img2)) {
            alert('Il file della SECONDA IMG deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault();
            return;
        }
        
        if (imgCopertina) {
            formData.append('imgCopertina', imgCopertina);
        }

        if (img2) {
            formData.append('img2', img2);
        }

        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            processData: false, // Evita che jQuery trasformi i dati in una stringa di query
            contentType: false, // Usa il boundary del multipart/form-data impostato automaticamente
            success: function(response) {
                alert('Accessorio aggiornato con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'aggiornamento del gioco');
            }
        });
    }
    
    function submitEspForm() {
    	var form = document.getElementById('ModifyEspForm');
        var formData = new FormData(form);

        // Aggiungi un campo nascosto 'action' per l'azione della servlet
        formData.append('action', 'updateEspansione');

        var imgCopertina = $('#imgCopertina')[0].files[0];
        var img2 = $('#img2')[0].files[0];

     // Verifica i file selezionati
        if (!isValidImage(imgCopertina)) {
            alert('Il file della COPERTINA deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault(); 
            return;
        }

        if (!isValidImage(img2)) {
            alert('Il file della SECONDA IMG deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault();
            return;
        }
        
        if (imgCopertina) {
            formData.append('imgCopertina', imgCopertina);
        }

        if (img2) {
            formData.append('img2', img2);
        }

        $.ajax({
            type: 'POST',
            url: 'AreaPersonaleControl',
            data: formData,
            processData: false, // Evita che jQuery trasformi i dati in una stringa di query
            contentType: false, // Usa il boundary del multipart/form-data impostato automaticamente
            success: function(response) {
                alert('Espansione aggiornato con successo');
            },
            error: function(xhr, status, error) {
                alert('Errore durante l\'aggiornamento del gioco');
            }
        });
    }
    // Gestisci il click sui pulsanti "Modifica"
    $(document).on('click', '.edit-Game-button', function() {
        var gameId = $(this).data('game-id');
        showModifyGameForm(gameId);
    });
    
    $(document).on('click', '.edit-Acc-button', function() {
        var accId = $(this).data('acc-id');
        showModifyAccForm(accId);
    });
    
    $(document).on('click', '.edit-Esp-button', function() {
        var espId = $(this).data('esp-id');
        showModifyEspForm(espId);
    });
    
    $(document).on('click','.del-Esp-button', function(){
    	var espId = $(this).data('esp-id');
    	$.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'delEsp',
                espId: espId
            },
            success: function(response) {
            	alert('Prodotto eliminato con successo');
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
    
    $(document).on('click','.del-Gioco-button', function(){
    	var giocoId = $(this).data('game-id');
    	$.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'delGioco',
                giocoId: giocoId
            },
            success: function(response) {
            	alert('Prodotto eliminato con successo');
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
    
    $(document).on('click','.del-Acc-button', function(){
    	var accId = $(this).data('acc-id');
    	$.ajax({
            url: 'AreaPersonaleControl',
            method: 'GET',
            data: {
                action: 'delAcc',
                accId: accId
            },
            success: function(response) {
            	alert('Prodotto eliminato con successo');
            },
            error: function(xhr, status, error) {
                console.error('Errore: ' + error);
            }
        });
    });
    
    document.getElementById('insertForm').addEventListener('click', function(event) {
        var imgCopertina = document.getElementById('imgCopertina').files[0];
        var img2 = document.getElementById('img2').files[0];
        
        // Funzione per verificare il tipo di file
        function isValidImage(file) {
            var validTypes = ['image/jpeg', 'image/jpg', 'image/png'];
            return file && validTypes.includes(file.type);
        }

        // Verifica i file selezionati
        if (!isValidImage(imgCopertina)) {
            alert('Il file della COPERTINA deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault(); // Blocca l'invio del form
        }

        if (!isValidImage(img2)) {
            alert('Il file della SECONDA IMG deve essere un\'immagine JPEG, JPG o PNG.');
            event.preventDefault(); // Blocca l'invio del form
        }
    });