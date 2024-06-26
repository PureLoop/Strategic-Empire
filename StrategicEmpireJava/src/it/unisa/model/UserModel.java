package it.unisa.model;
import java.sql.SQLException;
import java.util.Collection;

<<<<<<< HEAD:StrategicEmpireJava/src/it/unisa/UserModel.java
import it.unisa.bean.User;
=======
import it.unisa.User;
>>>>>>> 6bd804a1c16ee5f29e50bc3eb0adf86f6e04983b:StrategicEmpireJava/src/it/unisa/model/UserModel.java

public interface UserModel {
	public boolean registerUser(User user);
	public User validateUser(String username, String password);
	public void updateRole(User u) ;
	public Collection<User> doRetrieveAll() throws SQLException;
	public void updateUserRole(String username, String role)  throws SQLException;
}
