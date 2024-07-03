package it.unisa.model;
import java.sql.SQLException;
import java.util.Collection;
import it.unisa.bean.User;


public interface UserModel {
	public boolean registerUser(User user);
	public User validateUser(String username, String password);
	public void updateRole(User u) ;
	public Collection<User> doRetrieveAll() throws SQLException;
	public void updateUserRole(String username, String role)  throws SQLException;
	public void UpdateUser(String Username,String email,String indirizzo,String name) throws Exception;
}
