package it.unisa.model;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import java.util.ArrayList;

import java.util.LinkedList;

import it.unisa.bean.GiocoBean;
import it.unisa.model.DriverManagerConnectionPool;
import it.unisa.model.GiocoModel;

import java.util.Base64;






public class RegisterModelDM implements RegisterModel{
	

	public void insertUtente(String username, String nome, String cognome, String password, String email, String indirizzo, int ncivico) {
	    Connection connection = null;
	    PreparedStatement statement = null;

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        connection.setAutoCommit(false); // Disable auto-commit for transaction control

	        String sql = "INSERT INTO utente (Username, nome, cognome, pw, saltPW, email, ruolo, indirizzo, ncivico, sesso) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	        statement = connection.prepareStatement(sql);

	        // Generate salt and hash the password
	        String salt = BCrypt.gensalt();
	        String hashedPW = BCrypt.hashpw(password, salt);

	        // Set parameters
	        statement.setString(1, username);
	        statement.setString(2, nome);
	        statement.setString(3, cognome);
	        statement.setString(4, hashedPW); // Use the hashed password
	        statement.setString(5, salt); // Store the salt separately
	        statement.setString(6, email);
	        statement.setString(7, "cliente"); // Default role
	        statement.setString(8, indirizzo);
	        statement.setInt(9, ncivico);
	        statement.setString(10, "non specificato");
	        

	        // Execute the statement
	        int rowsInserted = statement.executeUpdate();

	        // Commit the transaction if insertion is successful
	        if (rowsInserted > 0) {
	            connection.commit();
	        } else {
	            // Rollback if no rows are inserted
	            connection.rollback();
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Print stack trace for debugging
	        try {
	            if (connection != null) {
	                connection.rollback(); // Rollback in case of an error
	            }
	        } catch (SQLException rollbackEx) {
	            rollbackEx.printStackTrace();
	        }
	    } finally {
	        // Close resources
	        try {
	            if (statement != null) {
	                statement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException closeEx) {
	            closeEx.printStackTrace();
	        }
	    }
	}
	
	 public boolean isEmailRegistered(String email) throws SQLException {
	        String sql = "SELECT 1 FROM utente WHERE email = ?";
	        try (Connection connection = DriverManagerConnectionPool.getConnection();
	             PreparedStatement statement = connection.prepareStatement(sql)) {
	            statement.setString(1, email);
	            try (ResultSet resultSet = statement.executeQuery()) {
	                return resultSet.next(); // Check if any record exists
	            }
	        }
	    }
    
    
    
    
    
    public boolean isPasswordValid(String password)throws SQLException {
        if (password == null) {
            return false;
        }
        boolean hasUpperCase = password.chars().anyMatch(Character::isUpperCase);
        boolean hasNumber = password.chars().anyMatch(Character::isDigit);
        boolean hasSpecialChar = password.chars().anyMatch(ch -> "!@#$%^&*(),.?\":{}|<>".indexOf(ch) >= 0);
        boolean isLengthValid = password.length() >= 8 && password.length() <= 16;
        return isLengthValid && hasUpperCase && hasNumber && hasSpecialChar;
    }
    
    public boolean isUsernameRegistered(String username) throws SQLException {
        String sql = "SELECT 1 FROM utente WHERE Username = ?";
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next(); // Check if any record exists
            }
        }
    }

}