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
    <link rel="stylesheet" href="DettagliStyle.css">
    <title>Dettagli Gioco</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css"></style>
</head>
<body>
	<%@ include file="/header/header.jsp" %>

	<body style="background-image: url(https://tse3.mm.bing.net/th/id/OIG4.UDvvmeUoZ7X.xOwpxtj3?pid=ImgGn); background-size: auto; background-position: center ;  background-repeat: no-repeat;">

	
	
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="title-box">
               <h2 class="game-title" style="background-image: url(imdett2.jpeg);"><%= nomegioco %></h2>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="container-img">
                <img src="<%=img_name %>" class="img-fluid">
            </div>
        </div>
        <div class="col-md-6">
            <div class="description">
                <h3 class="pastel-green">Descrizione</h3>
                <p><%= descrizione %></p>
            </div>
            <div class="details mt-4">
                <p><strong>Codice:</strong> <%= cod_gioco %></p>
                <p><strong>Edizione:</strong> <%= edizione %></p>
                <p><strong>Tipologia:</strong> <%= tipologia %></p>
                <p><strong>Prezzo:</strong> <%= prezzo %></p>
                <p><strong>Numero Giocatori:</strong> <%= n_giocatori %></p>
            </div>
        </div>
    </div>
</div>

</body>
</html>

</body>

  <%@ include file="/footer/footer.jsp" %> 
</body>
</html>
