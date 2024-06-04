<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*"%>
<%@ page import="it.unisa.User" %>
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
            String name = request.getParameter("Username");
            String email = request.getParameter("email");
            String address = request.getParameter("Indirizzo");
            
            // Esegui il salvataggio delle informazioni dell'account nell'archivio o nel database
            
            // Simuliamo un'operazione di aggiornamento riuscita
            boolean updateSuccess = true;
            
            if(updateSuccess) {
        %>
            <p>Le informazioni dell'account sono state aggiornate con successo.</p>
        <%
            } else {
        %>
            <p>Si è verificato un errore durante l'aggiornamento delle informazioni dell'account. Riprova più tardi.</p>
        <%
            }
        %>
    </div>
</body>
</html>
