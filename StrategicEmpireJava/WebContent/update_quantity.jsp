<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, it.unisa.OggettiCarrelloBean"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String codiceArticolo = request.getParameter("codiceArticolo");
    String operation = request.getParameter("operation");
    
    // Ottieni la lista degli oggetti nel carrello dalla sessione
    List<OggettiCarrelloBean> carrellobean = (List<OggettiCarrelloBean>) session.getAttribute("oggettiCarrello");
    
    // Cerca l'oggetto nel carrello con il codice articolo specificato
    OggettiCarrelloBean oggetto = null;
    if (carrellobean != null) {
        for (OggettiCarrelloBean item : carrellobean) {
            if (item.getCod_articolo().equals(codiceArticolo)) {
                oggetto = item;
                break;
            }
        }
    }
    
    int newQuantity = 0;
    if (oggetto != null) {
        newQuantity = oggetto.getQuantita(); // Quantità iniziale
        
        // Aggiorna la quantità in base all'operazione
        if ("decrease".equals(operation) && newQuantity > 1) {
            newQuantity--;
        } else if ("increase".equals(operation)) {
            newQuantity++;
        }
        
        // Imposta la nuova quantità nell'oggetto nel carrello
        oggetto.setQuantita(newQuantity);
    }

    // Restituisci il nuovo valore della quantità come semplice testo
    response.setContentType("text/plain");
    response.getWriter().write(String.valueOf(newQuantity));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>