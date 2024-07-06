package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;
import it.unisa.bean.GiocoBean;
public interface RegisterModel {
	
    public boolean isEmailRegistered(String email) throws SQLException;
    public boolean isPasswordValid(String password)throws SQLException;
	public void insertUtente(String Username, String nome, String cognome, String password, String email, String indirizzo, int ncivico);
    boolean isUsernameRegistered(String username) throws SQLException;




	
}