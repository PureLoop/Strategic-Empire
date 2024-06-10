package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class AreaPersonaleModelDM implements AreaPersonaleModel{
	private static final String TABLE_NAME1 = "gioco";
	private static final String TABLE_NAME2 = "espansione";
	private static final String TABLE_NAME3 = "accessorio";
	@Override
	public void updateGame(GiocoBean gioco) throws SQLException {
		String updateGame = "UPDATE `gioco` SET `nome_gioco` = ?,`edizione` = ?,`tipologia` = ?, `prezzo` = ?,`descrizione` = ? ,`n_giocatori_min` = ? ,`n_giocatori_max` = ? WHERE (`cod_gioco` = ?)";
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateGame);
			preparedStatement.setString(1, gioco.getNomegioco());
			preparedStatement.setString(2, gioco.getEdizione());
			preparedStatement.setString(3, gioco.getTipologia());
			preparedStatement.setDouble(4, gioco.getPrezzo());
			preparedStatement.setString(5, gioco.getDescrizione());
			preparedStatement.setInt(6, gioco.getN_giocatori_min());
			preparedStatement.setInt(7, gioco.getN_giocatori_max());
			preparedStatement.setString(8, gioco.getCod_Gioco());
			
			
			preparedStatement.executeUpdate();

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
	public void updateEspansione(espansioneBean espansione) throws SQLException {
	    String updateGame = "UPDATE `espansione` SET `nome_espansione` = ?, `prezzo` = ?, `descrizione` = ? WHERE (`cod_espansione` = ?)";

	    Connection connection = null;
	    PreparedStatement statement = null;
	    
	    try {
	    	connection = DriverManagerConnectionPool.getConnection();
			statement = connection.prepareStatement(updateGame);
	        statement.setString(1,espansione.getNomeespansione());
	        statement.setDouble(2, espansione.getPrezzo());
	        statement.setString(3, espansione.getDescrizione());
	        statement.executeUpdate();
	        connection.commit();
	    } finally {
	        try {
	            if (statement != null)
	                statement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	}

	@Override
	public void updateAccessorio(AccessorioBean accessorio) throws SQLException {
		String updateGame = "UPDATE `accessorio` SET `nome_accessorio` = ?,`tipologia` = ?, `prezzo` = ?,`descrizione` = ?  WHERE (`cod_accessorio` = ?)";
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateGame);
			preparedStatement.setString(1, accessorio.getNomeaccessorio());
			preparedStatement.setString(2, accessorio.getTipologia());
			preparedStatement.setDouble(3, accessorio.getPrezzo());
			preparedStatement.setString(4, accessorio.getDescrizione());
			preparedStatement.setString(5, accessorio.getCod_Accessorio());
			
			
			preparedStatement.executeUpdate();

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
	public void insertProd(GiocoBean gioco) throws SQLException {
		String query = "insert into gioco(cod_gioco,nome_gioco,edizione,tipologia,prezzo,descrizione,n_giocatori_min,n_giocatori_max) values (?,?,?,?,?,?,?,?)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, gioco.getCod_Gioco());
			preparedStatement.setString(2, gioco.getNomegioco());
			preparedStatement.setString(3, gioco.getEdizione());
			preparedStatement.setString(4, gioco.getTipologia());
			preparedStatement.setDouble(5, gioco.getPrezzo());
			preparedStatement.setString(6, gioco.getDescrizione());
			preparedStatement.setInt(7, gioco.getN_giocatori_min());
			preparedStatement.setInt(8, gioco.getN_giocatori_max());
			preparedStatement.executeUpdate();

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
	public void insertProd(AccessorioBean accessorio) throws SQLException {
	    String query = "INSERT INTO accessorio(cod_accessorio, nome_accessorio, tipologia, prezzo, descrizione) VALUES (?, ?, ?, ?, ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query);

	        // Imposta i parametri della query
	        preparedStatement.setString(1, accessorio.getCod_Accessorio());
	        preparedStatement.setString(2, accessorio.getNomeaccessorio());
	        preparedStatement.setString(3, accessorio.getTipologia());
	        preparedStatement.setDouble(4, accessorio.getPrezzo());
	        preparedStatement.setString(5, accessorio.getDescrizione());

	        // Esegui la query
	        preparedStatement.executeUpdate();

	        // Commit della transazione
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
	public void insertProd(espansioneBean espansione) throws SQLException {
	    String query = "INSERT INTO espansione(cod_espansione, nome_espansione, descrizione, prezzo, cod_gioco) VALUES (?, ?, ?, ?, ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query);

	        // Imposta i parametri della query
	        preparedStatement.setString(1, espansione.getCod_espansione());
	        preparedStatement.setString(2, espansione.getNomeespansione());
	        preparedStatement.setString(3, espansione.getDescrizione());
	        preparedStatement.setDouble(4, espansione.getPrezzo());
	        preparedStatement.setString(5, espansione.getCod_gioco());

	        // Esegui la query
	        preparedStatement.executeUpdate();
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

}
