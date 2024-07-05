package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.LinkedList;
import java.util.UUID;

import it.unisa.model.RecensioneModel;
import it.unisa.bean.RecensioneBean;
import it.unisa.model.RecensioneModel;

public class RecensioneModelDM implements RecensioneModel{
	private static final String TABLE_NAME = "recensione";
	@Override
	public synchronized Collection<RecensioneBean> doRetrieveAll() throws SQLException {
	Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<RecensioneBean> review = new LinkedList<RecensioneBean>();
		String selectSQL = "select * from " +RecensioneModelDM.TABLE_NAME;

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				RecensioneBean recensione = new RecensioneBean();
				recensione.setCod_Review(rs.getInt("cod_review"));
				recensione.setTitolo(rs.getString("titolo"));
				recensione.setDescrizione(rs.getString("descrizione"));
				recensione.setValutazione(rs.getInt("valutazione"));
				recensione.setUsername(rs.getString("username"));
				review.add(recensione);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return review;
	}

	@Override
	public void doSave(RecensioneBean product) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RecensioneBean retrieveReview(String username, int codice) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    RecensioneBean review = null;
	    String selectSQL = "SELECT * FROM " + RecensioneModelDM.TABLE_NAME + " WHERE username = ? AND codOrdine = ?";

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, username);
	        preparedStatement.setInt(2, codice);
	        ResultSet rs = preparedStatement.executeQuery();

	        if (rs.next()) { // Se trova almeno una riga
	            review = new RecensioneBean();
	            review.setCod_Review(rs.getInt("cod_review"));
	            review.setTitolo(rs.getString("titolo"));
	            review.setDescrizione(rs.getString("descrizione"));
	            review.setValutazione(rs.getInt("valutazione"));
	            review.setUsername(rs.getString("username"));
	            review.setCodOrdine(rs.getInt("codOrdine"));
	        } else {
	            System.out.println("Nessuna recensione trovata per username: " + username + " e codice ordine: " + codice);
	        }

	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    return review;
	}



	@Override
	public void insertReview(String username, String titolo, String descrizione, int valutazione, int codOrdine) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());
	    String insertSQL = "INSERT INTO " + RecensioneModelDM.TABLE_NAME + " (titolo, descrizione, data_review,valutazione, username, codOrdine) VALUES (?, ?, ?, ?, ?,?)";
	    System.out.println(username + titolo + descrizione + valutazione +codOrdine);
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS);

	        preparedStatement.setString(1, titolo);
	        preparedStatement.setString(2, descrizione);
	        preparedStatement.setTimestamp(3,currentTimestamp);
	        preparedStatement.setInt(4, valutazione);
	        preparedStatement.setString(5, username);
	        preparedStatement.setInt(6, codOrdine);

	        int rowsAffected = preparedStatement.executeUpdate();
	        connection.commit();
	        if (rowsAffected == 0) {
	            throw new SQLException("Inserimento della recensione fallito, nessuna riga aggiornata.");
	        }

	        // Recupera il valore auto-generato per codReview
	        ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
	        if (generatedKeys.next()) {
	            int codReview = generatedKeys.getInt(1);
	            // Puoi fare qualcosa con codReview se necessario, ma in questo caso è auto-incrementale quindi non serve.
	        } else {
	            throw new SQLException("Impossibile ottenere il codice generato per la recensione.");
	        }

	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	}

}
