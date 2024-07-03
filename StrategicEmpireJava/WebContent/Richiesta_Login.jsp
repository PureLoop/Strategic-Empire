<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, org.mindrot.jbcrypt.BCrypt,it.unisa.bean.User" %>

<%
    // Recupera le credenziali dall'input dell'utente
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    
    // Connessione al database
    String jdbcURL = "jdbc:mysql://localhost:3306/progettoTSWAggiornato?serverTimezone=UTC";
    String dbUser = "root";
    String dbPassword = "1212";
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        // Query per cercare le credenziali nel database
        String query = "SELECT * FROM utente WHERE email = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, email);
        
        resultSet = preparedStatement.executeQuery();
        
        // Se trova una corrispondenza nel database
        if (resultSet.next()) {    
            String storedPW = resultSet.getString("pw");
            if(BCrypt.checkpw(password, storedPW)) {
                // Recupera le informazioni dell'utente dal risultato della query
                String username = resultSet.getString("username");
                String userEmail = resultSet.getString("email");
                String role = resultSet.getString("ruolo");
                String Indirizzo= resultSet.getString("indirizzo");
                String nome = resultSet.getString("nome");
                String cognome = resultSet.getString("cognome");
                int ncivico = resultSet.getInt("ncivico");
                

                // Crea un nuovo oggetto User con le informazioni recuperate
                User user = new User();
                user.setUsername(username);
                user.setEmail(userEmail);
                user.setRole(role);
                user.setIndirizzo(Indirizzo);
                user.setNome(nome);
                user.setCognome(cognome);
				user.setncivico(ncivico);
                // Memorizza l'oggetto User nella sessione
                session.setAttribute("user", user);

                // Redirige alla HomePage.jsp
                response.sendRedirect("HomePage.jsp");
            } else {
                out.println("Login fallito! Password errata.");
            }
        } else {
            out.println("Login fallito! Utente non trovato.");
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
