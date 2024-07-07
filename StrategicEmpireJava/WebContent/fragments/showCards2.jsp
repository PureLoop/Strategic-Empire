<%@ page import="it.unisa.bean.CartaBean" %>
<%@ page import="java.util.Collection" %>
<%@ page import="it.unisa.bean.User" %>

<% 
Collection<CartaBean> carte = (Collection<CartaBean>) request.getAttribute("prodottiAP");
CartaBean carta = (CartaBean) request.getAttribute("c");
User user = (User) session.getAttribute("user");
String username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
CartaBean CartaEdit = new CartaBean();
%>

<!-- Aggiunto div per il messaggio -->
<div class="container" style="margin-top: 20px;">
    <% if (carte.isEmpty()) { %>
        <p class="text-center">Nessun metodo di pagamento inserito.</p>
    <% } %>
</div>

<div class="container" id="allCard" style="margin-top: 2%;">
    <% if (carte != null && !carte.isEmpty()) { 
        int counter = 1; // Inizializzazione del contatore
        for (CartaBean bean : carte) { %>
            <div class="credit-card mb-4" onclick="selectCard('<%= bean.getNumero() %>', '<%= bean.getNome() %>', '<%= bean.getScadenza() %>', '<%= bean.getCvv() %>')">
                <div class="card-chip"></div>
                <div class="card-number"><%= bean.getNumero() %></div>
                <div class="card-name"><%= bean.getNome() %></div>
                <div class="card-expiry">Valid Thru: <%= bean.getScadenza() %></div>
                <div class="cvv"><%= bean.getCvv() %></div>
                
                <div class="card-counter">Carta <%= counter %></div> <!-- Numerazione della carta -->
            </div>
            <% counter++; // Incremento del contatore dopo ogni carta %>
        <% } %>
    <% } else { %>
        <p class="text-center">Nessuna carta disponibile.</p>
    <% } %>    
</div>

<script type="text/javascript">
    function selectCard(cardNumber, cardName, cardExpiry, cvv) {
        // Salva i dettagli della carta in localStorage
        localStorage.setItem('selectedCardNumber', cardNumber);
        localStorage.setItem('selectedCardName', cardName);
        localStorage.setItem('selectedCardExpiry', cardExpiry);
        localStorage.setItem('selectedCardCvv',cvv);
                // Reindirizza alla pagina pagamento.jsp
        window.location.href = 'Pagamento.jsp';
    }
</script>

<style>
.cvv {
    display: none; /* Nasconde completamente l'elemento */
}
    /* Stili per la carta */
    .credit-card {
        position: relative;
        width: 240px;
        height: 150px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        background: linear-gradient(to right, #4e4e4e, #2b2b2b);
        color: white;
        padding: 15px;
        font-family: 'Arial', sans-serif;
        cursor: pointer;
        overflow: hidden;
        margin: 0 auto 20px;
    }

    .credit-card .card-chip {
        width: 30px;
        height: 20px;
        background: #d4af37;
        border-radius: 3px;
        position: absolute;
        top: 8px;
        left: 8px;
    }

    .credit-card .card-number {
        position: absolute;
        top: 40px;
        left: 15px;
        font-size: 0.9em;
        letter-spacing: 1px;
    }

    .credit-card .card-name {
        position: absolute;
        bottom: 30px;
        left: 15px;
        font-size: 0.7em;
        text-transform: uppercase;
    }

    .credit-card .card-expiry {
        position: absolute;
        bottom: 15px;
        right: 15px;
        font-size: 0.6em;
    }

    .credit-card .card-counter {
        position: absolute;
        top: 15px;
        right: 15px;
        font-size: 0.8em;
        background-color: rgba(255, 255, 255, 0.1);
        padding: 3px 8px;
        border-radius: 5px;
    }
</style>
