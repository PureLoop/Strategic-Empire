<%@ page import="it.unisa.User" %>
<%
    // Assumiamo che l'oggetto utente sia già stato impostato nella sessione
    User user = (User) session.getAttribute("user");
    String username = null;
	String Email= null;
	String Indirizzo=null;
    if (user != null) {
        username = user.getUsername(); // Supponendo che User abbia un metodo getUsername()
        Email = user.getEmail();
        Indirizzo= user.getIndirizzo();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Area Personale</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .rectangle {
            display: flex;
            position: absolute;
            top: 15%;
            justify-content: center;
            align-items: center;
            left: 10%;
            width: 80%;
            height: 12.5%;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .rectangle-item {
            display: inline-block;
            text-align: center;
            flex: 1;
        }
        .rectangle-item:not(:last-child) {
            border-right: 1px solid #ccc;
        }
        .rectangle-item a {
            text-decoration: none;
            color: inherit;
        }
        .rectangle-item a:hover {
            color: inherit;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
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
        .user-info {
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="rectangle">
                    <span class="rectangle-item"><a href="#">Gestione Account</a></span>
                    <span class="rectangle-item"><a href="#">Ordini</a></span>
                    <span class="rectangle-item"><a href="#">Rubrica Indirizzi</a></span>
                    <span class="rectangle-item"><a href="#">Metodi di pagamento</a></span>
                    <% if (user != null && "Amministratore".equals(user.getRole())) { %>
                        <span class="rectangle-item"><a href="#">Modifica catalogo</a></span>
                        <span class="rectangle-item"><a href="#">Lista utenti</a></span>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    
    <br><br><br><br>
    <br><br><br><br>
    <div class="container">
        <h1>Area Utente - Gestione Account</h1>
        <div class="user-info">
            <h2>Informazioni Utente</h2>
            <div class="row">
                <div class="col-md-4">
                    <label>Nome:</label>
                    <p><%= username %></p>
                </div>
                <div class="col-md-4">
                    <label>Email:</label>
                    <p><%= user != null ? Email : "N/A" %></p>
                </div>
                <div class="col-md-4">
                    <label>Indirizzo:</label>
                    <p><%= user!=null ? Indirizzo : "N/A"%></p>
                </div>
            </div>
        </div>
        <form action="updateAccount.jsp" method="post">
            <h2>Modifica Informazioni</h2>
            <div class="form-group">
                <label for="name">Nome:</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= user != null ? user.getUsername() : "" %>">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" value="<%= user != null ? user.getEmail() : "" %>">
            </div>
            <div class="form-group">
                <label for="address">Indirizzo:</label>
			<textarea id="address" name="address" class="form-control"><%= user != null ? user.getIndirizzo() : "N/A" %></textarea>
            </div>
            <input type="submit" value="Salva Modifiche" class="btn btn-primary mt-3">
        </form>
    </div>
</body>
</html>
