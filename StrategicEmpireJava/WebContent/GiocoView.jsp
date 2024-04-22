<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Collection<?> giochi = (Collection<?>) request.getAttribute("giochi");
	if(giochi == null) {
		response.sendRedirect("./gioco");	
		return;
	}
	GiocoBean gioco = (GiocoBean) request.getAttribute("gioco");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.GiocoBean"%>

<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<title>Strategic-Empire</title>
</head>

<body>
<%@ include file="/header/header.html" %>
	<h2>Giochi</h2>
	<a href="gioco">Catalogo</a>
<form id="game-form" action="gioco" method="post">
  <input type="hidden" name="action" value="filter"> 
  <div class="section">
    <div class="form-group">
      <label for="game-type">Tipologia:</label>
      <select id="game-type" name="tipologia" required>
        <option value="tavolo">Tavolo</option>
        <option value="carte">Carte</option>
      </select>
    </div>
    <div class="form-group">
      <label for="num-players">Numero giocatori:</label>

      <input type="number" name="N_giocatori" id="num-players" name="num-players" min="1" max="10" >
    </div>
    <div class="form-group">
      <label for="priceInput">Prezzo:</label>
            <input type="number" name="prezzo" id="priceInput" name="num-players" min="1" max="1000" >
    </div>
  </div>
  <button type="submit">Filtra</button>
</form>
<div class="row" >
<%
			if (giochi != null && giochi.size() != 0) {
				Iterator<?> it = giochi.iterator();
				while (it.hasNext()) {
					GiocoBean bean = new GiocoBean();
							bean =(GiocoBean) it.next();
		%>	
  <div class="col-sm-3 mb-3" style="width: 50rem;">
    <div class="card">
    <%=bean.getImmagineCop()%>
      <div class="card-body">
        <h5 class="card-title"><%=bean.getNomegioco()%></h5>
    	<p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
<a href="Dettagli.jsp?action=read&cod_gioco=<%=bean.getCod_Gioco()%>&nomegioco=<%=bean.getNomegioco()%>&edizione=<%=bean.getEdizione()%>&tipologia=<%=bean.getTipologia()%>&prezzo=<%=bean.getPrezzo()%>&descrizione=<%=bean.getDescrizione()%>&n_giocatori=<%=bean.getN_giocatori()%>" class="btn btn-primary">Dettagli</a>
      </div>
    </div>
  </div>
	<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Nessun gioco disponibile</td>
		</tr>
		<%
			}
		%>
		</div>
	<h2>Details</h2>
	
	<h2>Elementi filtrati</h2>
	
	<%
		if (gioco != null) {
	%>
	<table border="1">
		<tr>
			<th>Codice</th>
			<th>Nome</th>
			<th>Edizione</th>
			<th>Tipologia</th>
			<th>Prezzo</th>
			<th>Descrizione</th>
			<th>N_Giocatori</th>
		</tr>
		<tr>
			<td><%=gioco.getCod_Gioco()%></td>
			<td><%=gioco.getNomegioco()%></td>
			<td><%=gioco.getEdizione()%></td>
			<td><%=gioco.getTipologia()%></td>
			<td><%=gioco.getPrezzo()%></td>
			<td><%=gioco.getDescrizione()%></td>
			<td><%=gioco.getN_giocatori()%></td>
		</tr>
	</table>
	<%
		}
	%>
	<%
    Collection<?> giochiFiltrati = (Collection<?>) request.getAttribute("giochiFiltrati");

%>

<div class="row">
<%int count = 0;
	if (giochiFiltrati != null && !giochiFiltrati.isEmpty()) {
		count++;%>
    <% Iterator<?> it = giochiFiltrati.iterator(); %>
    <% while (it.hasNext()) { %>
        <% GiocoBean bean = (GiocoBean) it.next(); %>
        <div class="col-sm-3 mb-3" style="width: 50rem;">
    <div class="card">
    <%=bean.getImmagineCop()%>
      <div class="card-body">
        <h5 class="card-title"><%=bean.getNomegioco()%></h5>
    	<p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
    	<a href="gioco?action=read&cod_gioco=<%=bean.getCod_Gioco()%>" class="btn btn-primary">Dettagli</a>
      </div>
    </div>
  </div>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">Nessun gioco disponibile</td>
		</tr>
		<%
			}
		%>
		</div>
<%@ include file="/footer/footer.html" %>
</body>
</html>