package it.unisa.model;
import java.sql.Timestamp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpSession;

import it.unisa.model.UserModel;
import it.unisa.bean.OggettiCarrelloBean;
import it.unisa.bean.User;

public class UserDAO implements UserModel{
    private Connection connection;
    
	private static final String TABLE_NAME= "ordine";
	private static final String TABLE_NAME2= "recap";


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

    public void UpdateUser(String newName,String newCognome, String newEmail, String newIndirizzo, int newncivico,String Username) throws Exception {
        String updateQuery = "UPDATE utente SET nome=?,cognome=?, email=?, indirizzo=?, ncivico=? WHERE username=?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(updateQuery);

            preparedStatement.setString(1, newName);
            preparedStatement.setString(2, newCognome);
            preparedStatement.setString(3, newEmail);
            preparedStatement.setString(4, newIndirizzo);
            preparedStatement.setInt(5, newncivico);
            preparedStatement.setString(6, Username);

            preparedStatement.executeUpdate();
            connection.commit();
        } catch (SQLException e) {
            if (connection != null) {
                try {
                    connection.rollback();
                } catch (SQLException e1) {
                    e1.printStackTrace();
                }
            }
            throw e;
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
    
    public static int getRowCount() throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int rowCount = 0;

        try {
            // Stabilire la connessione al database
            connection = DriverManagerConnectionPool.getConnection();

            // Creare la query SQL per contare le righe
            String sql = "SELECT COUNT(*) AS row_count FROM " + TABLE_NAME;

            // Preparare la query
            statement = connection.prepareStatement(sql);

            // Eseguire la query
            resultSet = statement.executeQuery();

            // Ottenere il numero di righe
            if (resultSet.next()) {
                rowCount = resultSet.getInt("row_count");
            }
            System.out.println(rowCount);

        } finally {
            // Chiudere il ResultSet
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // Chiudere il PreparedStatement
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // Chiudere la connessione
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return rowCount;
    }

    public void CreateOrdine(String cod_sconto, String username, List<OggettiCarrelloBean> oggettiCarrello, String carta ) {
        Connection connection = null; // Assicurati di avere una connessione valida
        String sql = "INSERT INTO " + TABLE_NAME + " (data ,cod_sconto, cod_utente, carta) VALUES (?, ?, ? , ? )";
        int x;
        System.out.println("entro");
        try {
            // Assumendo che `getConnection()` restituisca una connessione valida
            connection = DriverManagerConnectionPool.getConnection();
            Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

            x = getRowCount();
            System.out.println(x);
            x++;
            // Crea il PreparedStatement
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Gestione del campo cod_sconto, che può essere NULL
                if (cod_sconto!= null) {
                    statement.setString(2,cod_sconto);
                } else {

                    statement.setNull(2, java.sql.Types.VARCHAR); // Imposta NULL se il valore non è presente
                }
                statement.setTimestamp(1,currentTimestamp); // Imposta il valore se non è NULL

                statement.setString(3, username); // Codice utente
                statement.setString(4,carta);
                
                // Esegui l'inserimento
                int rowsInserted = statement.executeUpdate();
                 connection.commit();
                 for(OggettiCarrelloBean oggettoBean: oggettiCarrello) {
                     if (oggettoBean.getCod_articolo().startsWith("g") && oggettoBean.getSelezionato() == true) {
                    	 recap(x,oggettoBean.getCod_articolo(),null,null,oggettoBean.getQuantita(), oggettoBean.getPrezzo());
                    	 
                     } else if (oggettoBean.getCod_articolo().startsWith("a") && oggettoBean.getSelezionato() == true) {
                    	 recap(x,null,oggettoBean.getCod_articolo(),null,oggettoBean.getQuantita(), oggettoBean.getPrezzo());

                     } else if (oggettoBean.getCod_articolo().startsWith("e") && oggettoBean.getSelezionato() == true) {
                    	 recap(x,null,null,oggettoBean.getCod_articolo(),oggettoBean.getQuantita(), oggettoBean.getPrezzo());

                     }

                 }
                 
                 
                 
                if (rowsInserted > 0) {
                    System.out.println("Ordine creato con successo.");
                   
                } else {
                    System.out.println("Nessun ordine creato.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Assicurati di chiudere la connessione in modo appropriato
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    
    public void recap(int ord, String acq_gio, String acq_esp, String acq_acc, int quantita, double prezzo) {
        Connection connection = null;
        String sql = "INSERT INTO recap (num_ordine, acq_gio, acq_esp, acq_acc, quantita, prezzo) VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            // Ottieni una connessione valida
            connection = DriverManagerConnectionPool.getConnection();
            // Disabilita l'auto-commit per gestire manualmente la transazione
            connection.setAutoCommit(false);

            // Crea il PreparedStatement
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                // Imposta i valori nei parametri della query
                statement.setInt(1, ord); // Codice ordine
                statement.setInt(5, quantita);
                statement.setDouble(6, prezzo);
                
                // Imposta NULL se i valori sono nulli, altrimenti imposta il valore
                if (acq_gio != null) {
                    statement.setString(2, acq_gio);
                } else {
                    statement.setNull(2, java.sql.Types.VARCHAR);
                }

                if (acq_esp != null) {
                    statement.setString(3, acq_esp);
                } else {
                    statement.setNull(3, java.sql.Types.VARCHAR);
                }

                if (acq_acc != null) {
                    statement.setString(4, acq_acc);
                } else {
                    statement.setNull(4, java.sql.Types.VARCHAR);
                }

                // Esegui l'inserimento
                int rowsInserted = statement.executeUpdate();
                
                // Commetti la transazione se l'inserimento ha successo
                if (rowsInserted > 0) {
                    connection.commit();
                    System.out.println("Recap creato con successo.");
                } else {
                    System.out.println("Nessun recap creato.");
                }
            } catch (SQLException e) {
                // Rollback in caso di errore
                if (connection != null) {
                    try {
                        connection.rollback();
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                }
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Assicurati di chiudere la connessione in modo appropriato
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
