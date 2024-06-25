$(document).on('click', '.nav-link', function(event) {
    var username = "<%= username %>"; // Recupera il nome utente dal markup HTML
    event.preventDefault(); // Impedisce il comportamento predefinito del link
    
    if ($(this).attr('id') === 'payment') { // Verifica se l'elemento cliccato ha l'ID 'payment'
        showCard(username); // Chiama la funzione showCard e passa il nome utente come argomento
    }else{
    	$('#showSavedPayment').hide();
    }
});

document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(event) {
        event.preventDefault();
        const target = this.getAttribute('data-target');
        document.getElementById('paymentSection').style.display = 'none';
        document.getElementById('paymentForm').style.display = 'none';
        document.getElementById('Account').style.display = 'none'; // Aggiunto

        if (target === 'paymentSection') {
            document.getElementById(target).style.display = 'block';
            displaySavedCards();
        } else if (target === 'Account') { // Aggiunto
            document.getElementById(target).style.display = 'block';
        }
    });
});

  function displaySavedCards() {
	    const savedCardsContainer = document.getElementById('savedCards');
	    const noCardsMessage = document.getElementById('noCardsMessage');
		
	    if (savedCards.length === 0) {
	        noCardsMessage.style.display = 'block';
	        savedCardsContainer.style.display = 'none';
	    } else {
	        noCardsMessage.style.display = 'none';
	        savedCardsContainer.style.display = 'block';
	        savedCardsContainer.innerHTML = '';

	        savedCards.forEach((card, index) => {
	            const cardItem = document.createElement('li');
	            cardItem.className = 'card-item'; // Aggiungi classe per lo stile CSS
	            cardItem.innerHTML = `
	                <div class="card-info">
	                    <span><strong>Nome:</strong> ${card.fullName}</span>
	                    <span><strong>Numero di Carta:</strong> ${card.cardNumber}</span>
	                    <span><strong>Data di Scadenza:</strong> ${card.expiryDate}</span>
	                </div>
	              //  <button class="btn btn-secondary btn-sm editCardButton" data-index="${index}">Modifica</button>
	            `;
	            savedCardsContainer.appendChild(cardItem);
	        });
	    }
	}


  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(event) {
      event.preventDefault();
      const target = this.getAttribute('data-target');
      
      document.getElementById('paymentSection').style.display = 'none';
      document.getElementById('paymentForm').style.display = 'none';
      document.getElementById('addCardButton').style.display = 'block';

      
      if (target === 'paymentSection') {
        document.getElementById(target).style.display = 'block';
        displaySavedCards();
      }
    });
  });


  document.getElementById('addCardButton').addEventListener('click', function() {
	    console.log('Bottone cliccato');
	    document.getElementById('paymentTitle').style.display = 'none';
	    document.getElementById('savedCards').style.display = 'none';
	    document.getElementById('noCardsMessage').style.display = 'none';
	    document.getElementById('paymentForm').style.display = 'block';
	    document.getElementById('addCardButton').style.display = 'none';
	});




  document.getElementById('backToCardsButton').addEventListener('click', function() {
    document.getElementById('paymentTitle').style.display = 'block';
    document.getElementById('savedCards').style.display = 'block';
    displaySavedCards();
    document.getElementById('addCardButton').style.display = 'block';
    document.getElementById('paymentForm').style.display = 'none';
  });

  document.getElementById('savedCards').addEventListener('click', function(event) {
    if (event.target.classList.contains('editCardButton')) {
      const index = event.target.getAttribute('data-index');
      const card = savedCards[index];
      
      document.getElementById('fullName').value = card.fullName;
      document.getElementById('cardNumber').value = card.cardNumber.replace(/\d(?=\d{4})/g, '*');
      document.getElementById('expiryDate').value = card.expiryDate;
      document.getElementById('cvv').value = '';
      
      document.getElementById('paymentTitle').style.display = 'none';
      document.getElementById('savedCards').style.display = 'none';
      document.getElementById('noCardsMessage').style.display = 'none';
      document.getElementById('addCardButton').style.display = 'block';
      document.getElementById('paymentForm').style.display = 'block';
    }
  });

  function addPaymentMethod() {
      var fullName = document.getElementById('fullName').value;
      var cardNumber = document.getElementById('cardNumber').value;
      var expiryDate = document.getElementById('expiryDate').value;
      var cvv = document.getElementById('cvv').value;
      var username = '<%= username %>'; // Assicurati che la variabile 'username' sia disponibile nella tua pagina JSP

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


  function showCard(username) {
      // Effettua una chiamata AJAX per ottenere il form di modifica per il gioco specifico
      $.ajax({
          url: 'AreaPersonaleControl',
          method: 'GET',
          data: {
              action: 'ShowCards',
              username: username  // Passa il nome utente come parametro
          },
          success: function(response) {
              // Mostra il form di modifica nel contenitore appropriato
              $('#showSavedPayment').html(response);
          },
          error: function(xhr, status, error) {
              console.error('Errore: ' + error);
          }
      });
  }
  