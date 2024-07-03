<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Aggiornamento Account - Risultato</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            text-align: center;
            margin-top: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Aggiornamento Account - Risultato</h1>
        <%
            Boolean updateSuccess = (Boolean) request.getAttribute("updateSuccess");
            String message = "";

            if (updateSuccess != null && updateSuccess) {
                message = "Le informazioni dell'account sono state aggiornate con successo.";
            } else {
                message = "Si è verificato un errore durante l'aggiornamento delle informazioni dell'account. Riprova più tardi.";
            }
        %>
        <script>
            // Mostra l'alert con il messaggio appropriato
            alert("<%= message %>");
            // Reindirizza l'utente alla sua Area personale o alla pagina desiderata
            window.location.href = "AreaPersonale.jsp"; // Modifica il percorso a seconda della tua struttura
        </script>
    </div>
</body>
</html>