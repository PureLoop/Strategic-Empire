<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.unisa.User" %>
<%
    // Assumiamo che l'oggetto utente sia già stato impostato nella sessione
    User u = (User) session.getAttribute("user");
    boolean loggedIn = false;
    String name = null;

    if (u != null) {
        loggedIn = true;
        name = u.getUsername(); // Supponendo che User abbia un metodo getUsername()
    }
%>
<!DOCTYPE html>
<html>
<head>    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Strategic-Empire</title>
    <style>
        /* Stile per l'header */
        nav.navbar {
            position: fixed; /* Posizionamento fisso */
            top: 0; /* Posizionamento in alto rispetto al viewport */
            width: 100%; /* Larghezza al 100% */
            z-index: 1000; /* Assicura che l'header rimanga sopra gli altri elementi */
        }
        
        /* Stile per il corpo della pagina */
        body {
            padding-top: 85px; /* Aggiunge un margine superiore uguale all'altezza dell'header per evitare sovrapposizioni */
        }
        
        /* Stile per fare in modo che l'header si trovi al di sopra di tutto il contenuto */
        .header-above-all {
            position: relative; /* Assicura che il contenuto dell'header rimanga al di sopra di tutto il resto */
            z-index: 1001; /* Assegna un valore di z-index superiore a quello dell'header */
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info .dropdown {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var input = document.getElementById("insert");
    
	input.addEventListener("input", function(event) {
        var inputValue = event.target.value;
        var sanitizedValue = sanitizeInput(inputValue);
        event.target.value = sanitizedValue;
    });

    function sanitizeInput(inputValue) {
        // Lista dei simboli da bloccare
        var forbiddenSymbols = /[<>!@#\$%^&*()_+={}\[\]:;"'|\\\/?]/g;

        // Rimuovi i simboli indesiderati dall'input
        var sanitizedValue = inputValue.replace(forbiddenSymbols, "");

        return sanitizedValue;
    }
});
</script>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
      <a href="HomePage.jsp"><img src="logo.png" width="70" height="70" class="d-inline-block align-text-top"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="true">
            Catalogo
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="AccessorioView.jsp">Accessori</a></li>
            <li><a class="dropdown-item" href="EspansioneView.jsp">Espansioni</a></li>
            <li><a class="dropdown-item" href="GiocoView.jsp">Giochi</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Consigli</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contatti</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ChiSiamo.jsp">Chi siamo</a>
        </li>
        <li>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" id="insert">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </li>
      </ul>
      <% if (loggedIn == false) { %>
      <tr>
            <td colspan="6"><a href="Carrello.jsp"><img src="IMMAGINI/carrelloICON.png" width="50" height="50">
    </a></td>
        </tr>
        <% } %>
        
      <% if (loggedIn) { %>
      <!-- Se l'utente è loggato, mostra l'icona e il nome utente -->
      <div class="user-info ms-auto">
          <span class="me-2">Ciao, <%= u.getUsername() %>!</span>
          <div class="dropdown">
              <a href="#" role="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                  <img src="./IMMAGINI/profilePic.png" alt="Profile Image" width="60" height="60">
              </a>
              <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                  <li><a class="dropdown-item" href="AreaPersonale.jsp">Area Utente</a></li>
                  <li><a class="dropdown-item" href="Carrello.jsp">Carrello</a></li>
                  <li><a class="dropdown-item" href="logout.jsp">Esci</a></li>
              </ul>
          </div>
      </div>
      <% } else { %>
      <!-- Se l'utente non è loggato, mostra il link di login -->
      <a class="nav-link" href="Login.jsp">Login</a>
      <% } %>
    </div>
  </div>
</nav>
</body>
</html>

