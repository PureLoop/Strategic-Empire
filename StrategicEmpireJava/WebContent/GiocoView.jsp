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
    <link rel="stylesheet" href="GiocoStyle.css">
    
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<title>Strategic-Empire</title>
	<style>
    .card-img-top {
        transition: transform 0.3s ease;
    }

    .card-img-top:hover {
        transform: scale(1.1);
    }  

        body {
            margin-top: 50px; /* Altezza dell'header */
        }
</style>

</head>

<body>
<header>
        <!-- Contenuto dell'header -->
	<%@ include file="/header/header.html" %>
        <nav>
            <!-- Il tuo menu di navigazione -->
        </nav>
    </header>
    <br>

<table id="game-table">
    <tr>
        <td>
            <select id="game-type" name="tipologia" required>
                <option value="" disabled selected>Tipo di gioco</option>
                <option value="tavolo">Tavolo</option>
                <option value="carte">Carte</option>
            </select>
        </td>
        <td>
            <input type="number" name="N_giocatori" id="num-players" name="num-players" min="1" max="10" placeholder="Numero giocatori">
        </td>
        <td>
            <input type="number" name="prezzo" id="priceInput" name="num-players" min="1" max="1000" placeholder="Prezzo">
        </td>
        <td>
            <button type="submit" class="submit-button">Filtra</button>
        </td>
    </tr>
</table>


	<div class="row" >
	<%
		if (giochi != null && giochi.size() != 0) 
		{
			Iterator<?> it = giochi.iterator();
			while (it.hasNext())
			{
				GiocoBean bean = new GiocoBean();
				bean =(GiocoBean) it.next();
	%>	
				 <div class="col-sm-3 mb-3" style="width: 50rem;">
    <div class="card">
        <a href="Dettagli.jsp?cod_gioco=<%=bean.getCod_Gioco()%>
            &img_name=<%=bean.getImmagineCop()%>
            &nomegioco=<%=bean.getNomegioco()%>
            &edizione=<%=bean.getEdizione()%>
            &tipologia=<%=bean.getTipologia()%>
            &prezzo=<%=bean.getPrezzo()%>
            &descrizione=<%=bean.getDescrizione()%>
            &n_giocatori=<%=bean.getN_giocatori()%>">
            <div class="card-body">
                <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                <h5 class="card-title"><%=bean.getNomegioco()%></h5>
                <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
            </div>
        </a>
    </div>
</div>
				<%
			}
			}else 
			
			{
				%>
					<tr>
						<td colspan="6">Nessun gioco disponibile</td>
					</tr>
				<%
			}
			%>
			</div>
		
		<h2>Elementi filtrati</h2>
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
        <a href="Dettagli.jsp?cod_gioco=<%=bean.getCod_Gioco()%>
       		&img_name=<%=bean.getImmagineCop()%>
            &nomegioco=<%=bean.getNomegioco()%>
            &edizione=<%=bean.getEdizione()%>
            &tipologia=<%=bean.getTipologia()%>
            &prezzo=<%=bean.getPrezzo()%>
            &descrizione=<%=bean.getDescrizione()%>
            &n_giocatori=<%=bean.getN_giocatori()%>">
            <div class="card-body">
                <img src="<%=bean.getImmagineCop()%>" class="card-img-top">
                <h5 class="card-title"><%=bean.getNomegioco()%></h5>
                <p class="card-text">Prezzo: <%=bean.getPrezzo()%></p>
            </div>
        </a>
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
