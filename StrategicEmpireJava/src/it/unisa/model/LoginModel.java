package it.unisa.model;

import it.unisa.bean.User;

import java.sql.SQLException;

public interface LoginModel {
    boolean isEmailRegistered(String email) throws SQLException;
    boolean isPasswordValid(String email, String password) throws SQLException;
    User getUserByEmail(String email) throws SQLException;
}
