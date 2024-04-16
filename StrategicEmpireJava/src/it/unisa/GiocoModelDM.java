package it.unisa;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class GiocoModelDM implements GiocoModel{
	private static final String TABLE_NAME = "gioco";

	@Override
	public synchronized void doSave(GiocoBean gioco) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

	String insertGioco = "INSERT INTO 	" +GiocoModelDM.TABLE_NAME 
			+"(cod_gioco, nome_gioco,edizione,tipologia,prezzo,descrizione,n_giocatori) VALUES (?,?,?,?,?,?,?)";
	try {
		connection = DriverManagerConnectionPool.getConnection();
		preparedStatement = connection.prepareStatement(insertGioco);
		preparedStatement.setString(1, gioco.getCod_Gioco());
		preparedStatement.setString(2, gioco.getNomegioco());
		preparedStatement.setString(3, gioco.getEdizione());
		preparedStatement.setString(4, gioco.getTipologia());
		preparedStatement.setDouble(5, gioco.getPrezzo());
		preparedStatement.setString(6, gioco.getDescrizione());
		preparedStatement.setInt(7, gioco.getN_giocatori());

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
	public synchronized GiocoBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		GiocoBean bean = new GiocoBean();

		String selectGioco = "SELECT * FROM " + GiocoModelDM.TABLE_NAME + " WHERE cod_gioco = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectGioco);
			preparedStatement.setString(1, code);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				bean.setCod_gioco(rs.getString("cod_gioco"));
				bean.setNomegioco(rs.getString("nome_gioco"));
				bean.setEdizione(rs.getString("edizione"));
				bean.setTipologia(rs.getString("tipologia"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setN_giocatori(rs.getInt("n_giocatori"));
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
	public synchronized boolean doDelete(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 0;

		String deleteGioco = "DELETE FROM " + GiocoModelDM.TABLE_NAME + " WHERE cod_gioco = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteGioco);
			preparedStatement.setString(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<GiocoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<GiocoBean> gioco = new LinkedList<GiocoBean>();

		String selectSQL = "SELECT cod_gioco,nome_gioco,prezzo FROM " + GiocoModelDM.TABLE_NAME;

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				GiocoBean bean = new GiocoBean();

				bean.setCod_gioco(rs.getString("cod_gioco"));
				bean.setNomegioco(rs.getString("nome_gioco"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				gioco.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return gioco;
	}
	
	public synchronized Collection<GiocoBean> doRetrieveByFilter(String tipologia, double prezzo, int nGiocatori) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    Collection<GiocoBean> beans = new LinkedList<>();

	    String selectSQL = "SELECT cod_gioco, nome_gioco, prezzo FROM " + GiocoModelDM.TABLE_NAME + " WHERE tipologia = ? AND prezzo = ? AND n_giocatori = ?";

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, tipologia);
	        preparedStatement.setDouble(2, prezzo);
	        preparedStatement.setInt(3, nGiocatori);

	        ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) {
	            GiocoBean bean = new GiocoBean();
	            bean.setCod_gioco(rs.getString("cod_gioco"));
	            bean.setNomegioco(rs.getString("nome_gioco"));
	            bean.setPrezzo(rs.getDouble("prezzo"));
	            beans.add(bean);
	        }
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    return beans;
	}


}
