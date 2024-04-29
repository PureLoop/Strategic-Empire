<%@ page import="java.util.*, it.unisa.GiocoBean" %>
<%@ page import="java.net.URLEncoder" %>

<%
    String cod_gioco = request.getParameter("cod_gioco");
    String nomegioco = request.getParameter("nomegioco");
    String edizione = request.getParameter("edizione");
    String tipologia = request.getParameter("tipologia");
    String prezzo = request.getParameter("prezzo");
    String descrizione = request.getParameter("descrizione");
    String n_giocatori = request.getParameter("n_giocatori");
    String img_name = request.getParameter("img_name");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dettagli Gioco</title>
    <link rel="stylesheet" href="DettagliStyle.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">

</style>
</head>
<body>
	<%@ include file="/header/header.html" %>

	<div class="banner">
		<div class="section">
		<br><br>
		<div class="rect-bg">
			<p id="rect"><%= nomegioco %></p>
		</div>
			<div class="container-img">
    			<img src="<%=img_name %>" class="immagine">
			</div>
		</div>
	</div>
			
    <table border="1">
        <tr>
            <th>Immagine</th>
            <th>Codice</th>
            <th>Nome</th>
            <th>Edizione</th>
            <th>Tipologia</th>
            <th>Prezzo</th>
            <th>Descrizione</th>
            <th>Numero Giocatori</th>
        </tr>
        <tr>
            <td><img src="<%=img_name %>" class="card-img-top"></td>
            <td><%= cod_gioco %></td>
            <td><%= nomegioco %></td>
            <td><%= edizione %></td>
            <td><%= tipologia %></td>
            <td><%= prezzo %></td>
            <td><%= descrizione %></td>
            <td><%= n_giocatori %></td>
        </tr>
    </table>
    <div class="b-example-divider"></div>
    <div class="container">
  <div class="row">
      <div class="col-lg-8">
           <div class="description pt-7">
                  <span class="mb-3">Descrizione</span>
                  <p><%= descrizione %></p>
           </div>
              <div class="code mt-5">
                  <p class="mb-0"><strong>COD:</strong> <%= cod_gioco %> </p>
              </div>
      </div>
  </div>
</div>
  <%@ include file="/footer/footer.html" %> 
</body>
</html>
