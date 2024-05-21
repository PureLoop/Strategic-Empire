<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalida la sessione corrente
    HttpSession Mysession = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }

    // Reindirizza l'utente alla homepage con un messaggio di logout
    response.sendRedirect("HomePage.jsp?logout=true");
%>
