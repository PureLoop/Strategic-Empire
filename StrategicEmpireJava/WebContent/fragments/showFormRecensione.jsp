<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="it.unisa.bean.RecensioneBean" %>
<html>
<head>
    <title>Inserimento Recensione</title>
    <style>
        /* Stili per il form di inserimento recensione */
    </style>
</head>
<body>
    <h1>Inserimento Recensione</h1>
    
    <form action="InserimentoRecensioneControl" method="POST">
        <input type="hidden" name="codiceOrdine" value="${codiceOrdine}">
        <input type="hidden" name="username" value="${username}">
        
        <!-- Campi del form per inserire la recensione -->
        <label for="titolo">Titolo:</label>
        <input type="text" id="titolo" name="titolo" required>
        
        <label for="descrizione">Descrizione:</label>
        <textarea id="descrizione" name="descrizione" required></textarea>
        
        <label for="valutazione">Valutazione:</label>
        <input type="number" id="valutazione" name="valutazione" min="1" max="5" required>
        
        <button type="submit">Invia Recensione</button>
    </form>
</body>
</html>

