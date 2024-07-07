<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="it.unisa.bean.User" %>
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
<head>    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
    <title>Strategic-Empire</title>
    <style>
    /* Stile per il link di navigazione */
.nav-link {
    position: relative;
    display: inline-block;
    color: #333; /* Colore del testo */
    text-decoration: none; /* Rimuove la sottolineatura del link */
    padding-bottom: 5px; /* Spaziatura inferiore */
}

/* Stile per l'effetto hover */
.nav-link::after {
    content: "";
    position: absolute;
    width: 0;
    height: 2px;
    display: block;
    margin-top: 5px;
    right: 0;
    background: #000080; /* Colore giallo dorato */
    transition: width 0.4s ease; /* Animazione per la larghezza */
}

/* Aumenta la larghezza quando si passa sopra il link */
.nav-link:hover::after {
    width: 100%;
    left: 0;
    background: #000080; /* Colore giallo dorato */
}
    
        /* Stile per l'header */
        nav.navbar {
            position: fixed; /* Posizionamento fisso */
            top: 0; /* Posizionamento in alto rispetto al viewport */
            width: 100%; /* Larghezza al 100% */
            z-index: 1000; /* Assicura che l'header rimanga sopra gli altri elementi */
            background-color:#D5E8FF !important;
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
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
      <a href="HomePage.jsp"><img src="logo.png" width="70" height="70" class="d-inline-block align-text-top"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="catalogo.jsp">Catalogo</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="News.jsp">News</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Consigli.jsp">Consigli</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Contatti.jsp">Contatti</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ChiSiamo.jsp">Chi siamo</a>
        </li>

            </ul>
            
            <script>
    $(document).ready(function(){
        $("#searchForm").submit(function(event){
            event.preventDefault(); // Impedisce il comportamento predefinito del form (evita il refresh della pagina)
            var query = $("#searchbar").val().trim(); // Ottiene il testo dalla barra di ricerca

            if(query !== ""){
                $.get("./RicercaProdotto", {"query": query}, function(data){
                    $(".risultati").empty(); // Svuota i risultati precedenti
                    if(data.length > 0){
                        $(".risultati").css({"display": "block"}); // Mostra i risultati
                        $.each(data, function(i, item){
                            // Aggiungi ogni risultato alla lista dei risultati
                            var resultItem = "<div class='item' id='item-" + item.idProdotto + "'>" +
                                             "<img src='" + item.immagine + "' width='65' height='65' />" +
                                             "<p>" + item.nome + "</p>" +
                                             "</div>";
                            $(".risultati").append(resultItem);

                            // Aggiungi l'evento click per visualizzare i dettagli del prodotto
                            $("#item-" + item.idProdotto).click(function(){
                                $.get("./dettagli", {"id": item.idProdotto}, function(){
                                    window.location = "./Dettagli.jsp";
                                });
                            });
                        });
                    } else {
                        $(".risultati").css({"display": "none"}); // Nascondi i risultati se non ce ne sono
                    }
                });
            } else {
                $(".risultati").empty().css({"display": "none"}); // Svuota e nascondi i risultati se la barra di ricerca è vuota
            }
        });
    });
</script>
            
            
            
            <!-- Sezione per il carrello e l'utente -->
 
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
            <img src="<%= getProfileImage(u.getsesso()) %>" alt="Profile Image" width="60" height="60">
        </a>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
            <li><a class="dropdown-item" href="AreaPersonale.jsp">Area Utente</a></li>
            <li><a class="dropdown-item" id="carrelloLink" href="Carrello.jsp">Carrello</a></li>
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


<%-- Funzione per ottenere l'immagine del profilo in base al sesso --%>
<%! 
    public String getProfileImage(String sesso) {
        String imagePath = "./IMMAGINI/nb.png"; // Immagine di default
        
        if (sesso != null) {
            if (sesso.equalsIgnoreCase("uomo")) {
                imagePath = "./IMMAGINI/profilePic.png"; // Immagine per uomo
            } else if (sesso.equalsIgnoreCase("donna")) {
                imagePath = "./IMMAGINI/cartoon-girl.png"; // Immagine per donna
            }
        }
        
        return imagePath;
    }
%>


<script>
    $(document).ready(function(){
        // Aggiungi l'evento click sul link del carrello
        $("#carrelloLink").click(function(event){
            // Evita il comportamento predefinito del link
            event.preventDefault();
            
            // Ottieni il nome utente dal codice JSP
            var username = "<%= name %>";

            // Chiamata AJAX per eseguire l'azione desiderata
            $.ajax({
                url: 'CarrelloControl', // URL dell'azione che vuoi eseguire
                type: 'GET',
                data: {
                    action: 'TakeDB', // Parametro per l'azione desiderata
                    username: username // Passa il nome utente come parametro
                },
                success: function(response) {
                    // Dopo la chiamata AJAX, reindirizza alla pagina Carrello.jsp
                    window.location.href = 'Carrello.jsp';
                },
                error: function(xhr, status, error) {
                    console.log('Errore nella chiamata AJAX:', error);
                    // Eventuale gestione dell'errore
                }
            });
        });
    });
</script>


</html>

