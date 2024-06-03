package it.unisa;

public class User {
    private String Username;
    private String nome;
    private String cognome;
    private String password;
    private String saltPW;
    private String email;
    private String role;
	public User() {
		Username= "";
		password = "";
		email = "";
		role= "";
	}
    
    public String getUsername() {
        return this.Username;
    }

    public void setUsername(String username) {
        this.Username = username;
    }
    public String getNome()
    {
    	return this.nome;
    }
    
    public void setNome(String nome)
    {
    	this.nome = nome;
    }
    public String getCognome()
    {
    	return this.cognome;
    }
    
    public void setCognome(String cognome)
    {
    	this.cognome = cognome;
    } 
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    public String getsaltPassword() {
        return saltPW;
    }

    public void setsaltPassword(String password) {
        this.saltPW = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}