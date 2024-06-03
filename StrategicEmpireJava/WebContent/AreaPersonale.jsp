<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Barra orizzontale centrata con Bootstrap</title>
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
      width: 80%; /* Larghezza del rettangolo */
      height: 12.5%; /* Altezza del rettangolo */
      border: 1px solid #ccc; /* Bordo del rettangolo */
      border-radius: 8px; /* Angoli arrotondati */
    }
    .rectangle-item {
      display: inline-block;
      text-align: center;
      flex: 1;
    }
    .rectangle-item:not(:last-child) {
      border-right: 1px solid #ccc; /* Aggiunge bordo destro */
    }
    
    .rectangle-item a {
      text-decoration: none; /* Rimuove la sottolineatura */
      color: inherit; /* Usa il colore predefinito */
    }
    .rectangle-item a:hover {
      color: inherit; /* Mantieni il colore durante il passaggio del mouse */
    }
  </style>
</head>
<body>
<header>
	<%@ include file="/header/header.jsp" %>
</header>

<div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="rectangle">
          <span class="rectangle-item"><a href="#">Gestione Account</a></span>
          <span class="rectangle-item"><a href="#">Ordini</a></span>
          <span class="rectangle-item"><a href="#">Rubrica Indirizzi</a></span>
          <span class="rectangle-item"><a href="#">Metodi di pagamento</a></span>
          <% if(user.getRole().equals("Amministratore")){%>
          <span class="rectangle-item"><a href="#">Modifica catalogo</a></span>
          <span class="rectangle-item"><a href="#">Lista utenti</a></span>
          <%} %>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
