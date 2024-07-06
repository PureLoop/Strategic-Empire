package it.unisa.model;
import java.sql.Date;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import it.unisa.model.CartaModel;
import it.unisa.bean.CartaBean;
import it.unisa.model.CartaModel;


public class CartaModelDM implements CartaModel {

	private static final String TABLE_NAME = "carta";

    
    private Connection connection;

/*
    @Override
    public void doSave(CartaBean carta) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUERY)) {
            preparedStatement.setString(1, carta.getNumero());
            preparedStatement.setInt(2, carta.getScadenza());
            preparedStatement.setInt(3, carta.getCvv());
            preparedStatement.setString(4, carta.getUsername());
            preparedStatement.setString(5, carta.getNome());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public boolean doDelete(String numero) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_QUERY)) {
            preparedStatement.setString(1, numero);
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        }
    }*/

    @Override
	public synchronized CartaBean doRetrieveByKey(String numero) throws SQLException {
		Connection connection = null;
		
		PreparedStatement preparedStatement = null;

		CartaBean bean = new CartaBean();


		String selectCarta = "SELECT c.* " + 
                "FROM " + CartaModelDM.TABLE_NAME + " AS c " + 
                "WHERE c.numero = ? " ;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectCarta);
			preparedStatement.setString(1, numero);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				bean.setNumero(rs.getString("numero"));
				bean.setScadenza(rs.getDate("scadenza"));
				bean.setCvv(rs.getInt("cvv"));
				bean.setUsername(rs.getString("Username"));
				bean.setNome(rs.getString("nome"));
			}
		}finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return bean;
	}


	@Override
	public Collection<CartaBean> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<CartaBean> doRetrieveByFilter(String username) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    List<CartaBean> carte = new ArrayList<>(); // Creo una lista per memorizzare le carte

	    String selectCarta = "SELECT c.* " +
                "FROM " + CartaModelDM.TABLE_NAME + " AS c " +
                "WHERE c.username =  ?;";   
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectCarta);
	        preparedStatement.setString(1, username);

	        ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) {
	            CartaBean bean = new CartaBean(); // Creo un nuovo oggetto CartaBean per ogni riga risultante

	            // Imposto i valori della carta dal ResultSet
	            bean.setNumero(rs.getString("numero"));
	            bean.setScadenza(rs.getDate("scadenza"));
	            bean.setCvv(rs.getInt("cvv"));
	            bean.setUsername(rs.getString("username"));
	            bean.setNome(rs.getString("nome"));

	            carte.add(bean); // Aggiungo la carta alla lista
	        }
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    return carte; // Restituisco la lista di carte
	}



	@Override
	public void doSave(CartaBean carta) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    String insertCarta = "INSERT INTO " + CartaModelDM.TABLE_NAME + " (numero, scadenza, cvv, username, nome) VALUES (?, ?, ?, ?, ?)";
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(insertCarta);
	        System.out.println(carta.toString());
	        // Imposto i valori della carta da inserire nel PreparedStatement
	        preparedStatement.setString(1, carta.getNumero());
	        preparedStatement.setDate(2, carta.getScadenza());
	        preparedStatement.setInt(3, carta.getCvv());
	        preparedStatement.setString(4, carta.getUsername());
	        preparedStatement.setString(5, carta.getNome());

	        preparedStatement.executeUpdate(); // Eseguo l'inserimento nel database
			connection.commit();

	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	}


	@Override
	public boolean doDelete(String numero) throws SQLException {
	    String query = "DELETE FROM " + CartaModelDM.TABLE_NAME + " WHERE numero = ?";
	    PreparedStatement preparedStatement = null;
        connection = DriverManagerConnectionPool.getConnection();


	    try {
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, numero);
	        int rowsAffected = preparedStatement.executeUpdate();
			connection.commit();

	        return rowsAffected > 0;
	        
	        
	    }finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }

	}


	@Override
	public void doUpdate(String nome, String numero, Date exp, int cvv, String username) {
	    // Prepara la query di aggiornamento
	    String query = "UPDATE " + CartaModelDM.TABLE_NAME +
	                   " SET nome = ?, scadenza = ?, cvv = ? " +
	                   " WHERE numero = ?";

	    Connection connection = null;
	    PreparedStatement stmt = null;
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        stmt = connection.prepareStatement(query);
	        
	        // Imposta i parametri della query
	        stmt.setString(1, nome);      // Nome della carta
	        stmt.setDate(2, exp);          // Scadenza della carta (presumo sia un int, es. 1223 per dicembre 2023)
	        stmt.setInt(3, cvv);          // CVV della carta
	        stmt.setString(4, numero);    // Numero della carta
	        System.out.println(nome+exp+cvv+numero);
	        // Esegui la query di aggiornamento
	        int rowsUpdated = stmt.executeUpdate();

	        // Verifica se l'aggiornamento ha avuto successo
	        if (rowsUpdated > 0) {
	            System.out.println("Aggiornamento eseguito con successo.");
	            connection.commit(); // Commit della transazione
	        } else {
	            System.out.println("Nessuna carta trovata con il numero specificato.");
	        }
	    } catch (SQLException e) {
	        System.err.println("Errore durante l'esecuzione dell'aggiornamento: " + e.getMessage());
	        if (connection != null) {
	            try {
	                connection.rollback(); // Rollback in caso di errore
	            } catch (SQLException rollbackEx) {
	                System.err.println("Errore durante il rollback della transazione: " + rollbackEx.getMessage());
	            }
	        }
	    } finally {
	        // Chiudi le risorse PreparedStatement e Connection
	        try {
	            if (stmt != null) {
	                stmt.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            System.err.println("Errore durante la chiusura delle risorse: " + e.getMessage());
	        }
	    }
	}


}