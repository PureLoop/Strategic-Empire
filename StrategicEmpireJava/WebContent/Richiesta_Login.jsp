<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Recupera le credenziali dall'input dell'utente
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    // Connessione al database (assumendo che tu abbia già configurato la connessione)
    String jdbcURL = "jdbc:mysql://localhost:3306/progettoTSWAggiornato?serverTimezone=UTC";
    String dbUser = "root";
    String dbPassword = "aldodamiano2003";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        // Query per cercare le credenziali nel database
        String query = "SELECT * FROM utente WHERE username = ? AND pw = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, username);
        preparedStatement.setString(2, password);
        
        resultSet = preparedStatement.executeQuery();
        
        // Se trova una corrispondenza nel database
        if (resultSet.next()) {
            out.println("Login effettuato!");
        } else {
            out.println("Login fallito!");
        }
    } catch (SQLException e) {
        out.println("Errore SQL: " + e.getMessage());
    } catch (ClassNotFoundException e) {
        out.println("Driver JDBC non trovato: " + e.getMessage());
    } finally {
        // Chiudi tutte le risorse
        try {
            if (resultSet != null) resultSet.close();
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            out.println("Errore durante la chiusura delle risorse: " + e.getMessage());
        }
    }
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
