<!DOCTYPE html>
<html>
<head>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
     
}
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
      <a href="HomePage.jsp"><img src="logo.png" width="70" height="70" class="d-inline-block align-text-top"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
        
      	<li><form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
        </form></li>
       

      
      </ul>
      
            <a class="nav-link" href="Login.jsp">Login</a>
            
        <!-- Aggiungi il codice qui -->
        <tr>
            <td colspan="6"><a href="Carrello.jsp"><img src="IMMAGINI/carrelloICON.png" width="50" height="50">
    </a></td>
        </tr>
       
    </div>
  </div>
</nav>
</body>
</html>
