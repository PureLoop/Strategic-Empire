
var username;

document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(event) {
        event.preventDefault();


        const target = this.getAttribute('data-target');
        document.getElementById('paymentSection').style.display = 'none';
        document.getElementById('Account').style.display = 'none'; // Aggiunto

        if (target === 'paymentSection') {
            document.getElementById(target).style.display = 'block';
        } else if (target === 'Account') { // Aggiunto
            document.getElementById(target).style.display = 'block';
        }
    });
});




  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const target = this.getAttribute('data-target'); 
      document.getElementById('paymentTitle').style.display = 'none';
      document.getElementById('paymentTitle').style.display = 'block';





      
      if (target === 'paymentSection') {
        document.getElementById(target).style.display = 'block';
        showCard(username); // Chiama la funzione showCard e passa il nome utente come argomento
      }
    });
  });




  function addPaymentMethod(username) {
      var fullName = document.getElementById('fullName').value;
      var cardNumber = document.getElementById('cardNumber').value;
      var expiryDate = document.getElementById('expiryDate').value;
      var cvv = document.getElementById('cvv').value;

      $.ajax({
          url: 'AreaPersonaleControl', // Assicurati di specificare il percorso corretto per la tua servlet
          method: 'GET',
          data: {
              action: 'insertCards', // Azione per inserire una nuova carta
              fullName: fullName,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cvv: cvv,
              username: username
          },
          success: function(response) {
              // Gestisci la risposta dal server se necessario
              console.log('Carta aggiunta con successo');
          },
          error: function(xhr, status, error) {
              // Gestisci gli errori se necessario
              console.error('Errore durante l\'aggiunta della carta');
          }
      });
  }
  	
   function showPaymentMethods(username2) {
		
                  username = username2;

  }


function showCard(username) {
    // Effettua una chiamata AJAX per ottenere il fragment delle carte specifiche
    $.ajax({
        url: 'AreaPersonaleControl',
        method: 'GET',
        data: {
            action: 'ShowCards',
            username: username  // Passa il nome utente come parametro
        },
        success: function(response) {
            // Mostra il fragment nel contenitore appropriato
            $('#showSavedPayment').html(response);
            	    handleCardDisplay(true);

        },
        error: function(xhr, status, error) {
            console.error('Errore: ' + error);
        }
    });
}


// Esempio di funzione per gestire la visualizzazione delle carte sulla pagina
function handleCardDisplay(mostraCarte) {
    // Esempio: Mostra o nascondi le carte in base a un evento o a una logica specifica

    if (mostraCarte) {
        $('#showSavedPayment').show(); // Mostra il contenitore delle carte
    } else {
        $('#showSavedPayment').hide(); // Nascondi il contenitore delle carte
    }
}
