package it.unisa.model;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import it.unisa.bean.OggettiCarrelloBean;
import it.unisa.bean.User;


public interface UserModel {
	public boolean registerUser(User user);
	public User validateUser(String username, String password);
	public void updateRole(User u) ;
	public Collection<User> doRetrieveAll() throws SQLException;
	public void updateUserRole(String username, String role)  throws SQLException;
	public void UpdateUser(String nome,String cognome,String email,String indirizzo,int ncivico,String Username,String sesso) throws Exception;
    public void CreateOrdine(String cod_sconto, String username, List<OggettiCarrelloBean> oggettiCarrello, String carta );

}
