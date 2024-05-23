package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean registerUser(User user) {
        String sql = "INSERT INTO users (username,nome,cognome, password,saltPW, email, role) VALUES (?, ?,?,?,?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
        	statement.setString(1, user.getUsername());
        	statement.setString(2, user.getNome());
        	statement.setString(3, user.getCognome());
            statement.setString(4, user.getPassword());
            statement.setString(5, user.getsaltPassword());
            statement.setString(6, user.getEmail());
            statement.setString(7, user.getRole());
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User validateUser(String username, String password) {
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
}
