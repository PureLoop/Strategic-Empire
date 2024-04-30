<%@ page import="java.util.*, it.unisa.GiocoBean" %>
<%@ page import="java.net.URLEncoder" %>

<%
	GiocoBean gioco = (GiocoBean) request.getAttribute("cod_gioco");
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
	<%@ include file="/header/header.jsp" %>

	<div class="banner">
		<div class="section">
		<br><br>
		<div class="rect-bg">
			<p id="rect"><%=gioco.getNomegioco() %></p>
		</div>
			<div class="container-img">
    			<img src="<%=gioco.getImmagineCop() %>" class="immagine">
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
            <td><img src="<%=gioco.getImmagineCop() %>" class="card-img-top"></td>
            <td><%= gioco.getCod_Gioco() %></td>
            <td><%= gioco.getNomegioco() %></td>
            <td><%= gioco.getEdizione() %></td>
            <td><%= gioco.getTipologia() %></td>
            <td><%= gioco.getPrezzo() %></td>
            <td><%= gioco.getDescrizione() %></td>
        </tr>
    </table>
    <div class="b-example-divider"></div>
    <div class="container">
  <div class="row">
      <div class="col-lg-8">
           <div class="description pt-7">
                  <span class="mb-3">Descrizione</span>
                  <p><%= gioco.getDescrizione() %></p>
           </div>
              <div class="code mt-5">
                  <p class="mb-0"><strong>COD:</strong> <%= gioco.getCod_Gioco() %></p>
              </div>
      </div>
  </div>
</div>
  <%@ include file="/footer/footer.jsp" %> 
</body>
</html>
