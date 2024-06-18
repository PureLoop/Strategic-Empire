package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

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
	public synchronized CartaBean doRetrieveByKey(String username) throws SQLException {
		Connection connection = null;
		
		PreparedStatement preparedStatement = null;

		CartaBean bean = new CartaBean();


		String selectCarta = "select c.*" + 
				"from " +CartaModelDM.TABLE_NAME +" as c \r\n" + 
				"where c.username = ? ;";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectCarta);
			preparedStatement.setString(1, username);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				bean.setNumero(rs.getString("numero"));
				bean.setScadenza(rs.getInt("scadenza"));
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

	    String selectCarta = "SELECT * FROM " + CartaModelDM.TABLE_NAME + " WHERE username = ?";
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectCarta);
	        preparedStatement.setString(1, username);

	        ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) {
	            CartaBean bean = new CartaBean(); // Creo un nuovo oggetto CartaBean per ogni riga risultante

	            // Imposto i valori della carta dal ResultSet
	            bean.setNumero(rs.getString("numero"));
	            bean.setScadenza(rs.getInt("scadenza"));
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
	        System.out.println("machere");
	        System.out.println(carta.toString());
	        // Imposto i valori della carta da inserire nel PreparedStatement
	        preparedStatement.setString(1, carta.getNumero());
	        preparedStatement.setInt(2, carta.getScadenza());
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
	public boolean doDelete(String code) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
}
