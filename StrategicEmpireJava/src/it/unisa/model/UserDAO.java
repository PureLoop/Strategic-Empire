package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import it.unisa.model.UserModel;
import it.unisa.bean.User;

public class UserDAO implements UserModel{
    private Connection connection;

    public boolean registerUser(User user) {
    	connection = null;
        String sql = "INSERT INTO users (username,nome,cognome, password,saltPW, email, role,Indirizzo,ncivico) VALUES (?, ?,?,?,?, ?, ?, ?,?,?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
        	statement.setString(1, user.getUsername());
        	statement.setString(2, user.getNome());
        	statement.setString(3, user.getCognome());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getsaltPassword());
            statement.setString(6, user.getEmail());
            statement.setString(7, user.getRole());
            statement.setString(8, user.getIndirizzo());
            statement.setInt(9, user.getncivico());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User validateUser(String username, String password) {
    	connection = null;
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void updateRole(User u) {
    	connection = null;
    }
    
    public synchronized Collection<User> doRetrieveAll() throws SQLException{
        connection = null;
        PreparedStatement preparedStatement = null;
        Collection<User> user = new LinkedList<>();

        String selectSQL = "SELECT * FROM utente";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setNome(rs.getString("nome"));
                u.setCognome(rs.getString("cognome"));
                u.setPassword(rs.getString("pw"));
                u.setsaltPassword(rs.getString("saltPW"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("ruolo"));
                u.setIndirizzo(rs.getString("indirizzo"));
                u.setncivico(rs.getInt("ncivico"));
                user.add(u);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
        return user;
    }
    
    public void updateUserRole(String username, String role) throws SQLException {
        String updateQuery = "UPDATE utente SET ruolo = ? WHERE Username = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(updateQuery);
            
            preparedStatement.setString(1, role); // Imposta il primo parametro (ruolo)
            preparedStatement.setString(2, username); // Imposta il secondo parametro (username)
            
            preparedStatement.executeUpdate();
            connection.commit();
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }


}
