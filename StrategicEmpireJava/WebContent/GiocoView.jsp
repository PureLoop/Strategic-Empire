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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="GiocoStyle.css" rel="stylesheet" type="text/css">
	<title>Strategic-Empire</title>
</head>

<body>
	<h2>Giochi</h2>
	<a href="gioco">Catalogo</a>
	<table border="1">
		<tr>
			<th>Codice <a href="gioco?sort=cod_gioco">Sort</a></th>
			<th>Nome <a href="gioco?sort=nome_gioco">Sort</a></th>
			<th>Prezzo <a href="gioco?sort=prezzo">Sort</a></th>
		</tr>
		<%
			if (giochi != null && giochi.size() != 0) {
				Iterator<?> it = giochi.iterator();
				while (it.hasNext()) {
					GiocoBean bean = (GiocoBean) it.next();
		%>
		<tr>
			<td><%=bean.getCod_Gioco()%></td>
			<td><%=bean.getNomegioco()%></td>
			<td><%=bean.getPrezzo()%></td>
			<td><a href="gioco?action=delete&cod_gioco=<%=bean.getCod_Gioco()%>">Delete</a><br>
				<a href="gioco?action=read&cod_gioco=<%=bean.getCod_Gioco()%>">Details</a></td>
		</tr>
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
	</table>
	
	<h2>Details</h2>
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
	<h2>Insert</h2>
	<form action="gioco" method="post">
		<input type="hidden" name="action" value="insert"> 
		
		<label for="Codice">Codice gioco:</label><br> 
		<input name="Codice" type="text" maxlength="20" required placeholder="Inserisci codice"><br> 
		
		<label for="Nome">Nome gioco:</label><br> 
		<input name="Nome" type="text" maxlength="20" required placeholder="Inserisci nome"><br> 
		
		<label for="Edizione">Edizione:</label><br>
		<input name="Edizione" type="text" maxlength="20" required placeholder="Inserisci Edizione"><br>
		
		<label for="Tipologia">Tipologia:</label><br>
		<input name="Tipologia" type="text" maxlength="20" required placeholder="Inserisci Tipologia"><br>
		
		<label for="Prezzo">Prezzo:</label><br> 
		<input name="Prezzo" type="number" min="0" value="0" required><br>
		
		<label for="Descrizione">Descrizione:</label><br>
		<textarea name="Descrizione" maxlength="100" rows="3" required placeholder="Inserisci descrizione"></textarea><br>

		<label for="N_giocatori">Numero giocatori:</label><br> 
		<input name="N_giocatori" type="number" min="1" value="1" required><br>

		<input type="submit" value="Add"><input type="reset" value="Reset">

	</form>
</body>
</html>