document.getElementById("userList").addEventListener('click', function(){
    	if(document.getElementById("userTableContainer").style.display === 'flex'){
    		document.getElementById("userTableContainer").style.display = 'none';
    	}else{
    		document.getElementById("userTableContainer").style.display = 'flex';
    	}
    });

$(document).ready(function() {
            $('#userList').on('click', function(event) {
                event.preventDefault(); // Previeni il comportamento predefinito del link

                $.ajax({
                    url: 'AreaPersonaleControl',
                    method: 'GET',
                    data: {
                        action: 'showUsers',
                    },
                    success: function(response) {
                        $('#userTableContainer').html(response); // Inserisci la risposta HTML nel contenitore
                    },
                    error: function(xhr, status, error) {
                        console.error('Error: ' + error); // Gestisci gli errori
                    }
                });
            });
        });

$(document).ready(function() {
    $(document).on('click', '.update-role-button', function(event) {
        event.preventDefault();

        var form = $(this).closest('form');
        var username = form.data('username');
        var role = form.find('select[name="role"]').val();

        
        $.ajax({
            url: 'AreaPersonaleControl',
            method: 'POST',
            data: {
                action: 'updateRole',
                username: username,
                role: role
            },
            success: function(response) {
                alert('Ruolo aggiornato con successo.');
            },
            error: function(xhr, status, error) {
                console.error('Error: ' + error);
                console.error('Status: ' + status);
                console.error('Response: ' + xhr.responseText);
                alert('Errore nell\'aggiornamento del ruolo.');
            }
        });
    });
});
