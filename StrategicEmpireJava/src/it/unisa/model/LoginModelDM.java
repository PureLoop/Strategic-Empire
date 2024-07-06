package it.unisa.model;

import it.unisa.bean.User;
import it.unisa.model.DriverManagerConnectionPool;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginModelDM implements LoginModel {

    @Override
    public boolean isEmailRegistered(String email) throws SQLException {
        String sql = "SELECT 1 FROM utente WHERE email = ?";
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        }
    }

    @Override
    public boolean isPasswordValid(String email, String password) throws SQLException {
        String sql = "SELECT pw FROM utente WHERE email = ?";
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String hashedPassword = resultSet.getString("pw");
                    return BCrypt.checkpw(password, hashedPassword);
                }
                return false;
            }
        }
    }

    @Override
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM utente WHERE email = ?";
        try (Connection connection = DriverManagerConnectionPool.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    User user = new User();
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setRole(resultSet.getString("ruolo"));
                    user.setIndirizzo(resultSet.getString("indirizzo"));
                    user.setNome(resultSet.getString("nome"));
                    user.setCognome(resultSet.getString("cognome"));
                    user.setncivico(resultSet.getInt("ncivico"));
                    user.setsesso(resultSet.getString("sesso"));
                    return user;
                }
                return null;
            }
        }
    }
}
