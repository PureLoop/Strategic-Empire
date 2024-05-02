package it.unisa;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import java.util.Base64;

public class GiocoModelDM implements GiocoModel{
	private static final String TABLE_NAME = "gioco";

	@Override
	public synchronized void doSave(GiocoBean gioco) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

	String insertGioco = "INSERT INTO 	" +GiocoModelDM.TABLE_NAME 
			+"(cod_gioco, nome_gioco,edizione,tipologia,prezzo,descrizione,n_giocatori_min,n_giocatori_max) VALUES (?,?,?,?,?,?,?,?)";
	try {
		connection = DriverManagerConnectionPool.getConnection();
		preparedStatement = connection.prepareStatement(insertGioco);
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
	public synchronized GiocoBean doRetrieveByKey(String code) throws SQLException {
        Connection connection = null;

        PreparedStatement preparedStatement = null;

        GiocoBean bean = new GiocoBean();


        String selectGioco = "select g.*,ig.img_name,ig.cod_img_gioco\r\n" + 
                "from " +GiocoModelDM.TABLE_NAME +" as g \r\n" + 
                "join img_gioco as ig on ig.cod_gioco = g.cod_gioco\r\n" + 
                "where ig.copertina = true and g.cod_gioco = ? ;";
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
                bean.setN_giocatori_min(rs.getInt("n_giocatori_min"));
                bean.setN_giocatori_max(rs.getInt("n_giocatori_max"));
                bean.setImmagineCop(rs.getString("img_name"));
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
		
		

		String selectSQL = "select g.*,ig.img_name,ig.cod_img_gioco\r\n" + 
				"from " +GiocoModelDM.TABLE_NAME +" as g \r\n" + 
				"join img_gioco as ig on ig.cod_gioco = g.cod_gioco\r\n" + 
				"where ig.copertina = true ;";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				GiocoBean bean = new GiocoBean();
				bean.setCod_gioco(rs.getString("cod_gioco"));
				bean.setNomegioco(rs.getString("nome_gioco"));
				bean.setEdizione(rs.getString("edizione"));
				bean.setTipologia(rs.getString("tipologia"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setN_giocatori_min(rs.getInt("n_giocatori_min"));
				bean.setN_giocatori_max(rs.getInt("n_giocatori_max"));
				bean.setImmagineCop(rs.getString("img_name"));
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
	
	public synchronized Collection<GiocoBean> doRetrieveByFilter(String tipologia, Double prezzo, Integer nGiocatori, boolean check_prezzo, boolean check_giocatori) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    Collection<GiocoBean> beans = new LinkedList<>();
	    
	    String selectSQL = "SELECT g.*, ig.img_name, ig.cod_img_gioco " +
	                       "FROM " + GiocoModelDM.TABLE_NAME + " AS g " +
	                       "JOIN img_gioco AS ig ON ig.cod_gioco = g.cod_gioco " +
	                       "WHERE ig.copertina = true";

	    // Aggiungi la clausola WHERE solo se tipologia non è "Tutti"
	    if (!"Tutti".equals(tipologia)) {
	        selectSQL += " AND g.tipologia = ?";
	    }

	    // Aggiungi le condizioni per prezzo e numero di giocatori se presenti
	    if (prezzo > 0) {    
	        selectSQL += " AND g.prezzo = ?";
	    }   
	    if (nGiocatori > 0) {
	        selectSQL += " AND g.n_giocatori_min = ?";
	    }

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);

	        // Imposta i parametri della query
	        int parameterIndex = 1;
	        if (!"Tutti".equals(tipologia)) {
	            preparedStatement.setString(parameterIndex++, tipologia);
	        }
	        if (check_prezzo) {
	            preparedStatement.setDouble(parameterIndex++, prezzo);
	        }
	        if (check_giocatori) {
	            preparedStatement.setInt(parameterIndex++, nGiocatori);
	        }

	        ResultSet rs = preparedStatement.executeQuery();
	        while (rs.next()) {
	            GiocoBean bean = new GiocoBean();
	            // Imposta i valori del bean con i dati ottenuti dalla query
	            bean.setCod_gioco(rs.getString("cod_gioco"));
	            bean.setNomegioco(rs.getString("nome_gioco"));
	            bean.setEdizione(rs.getString("edizione"));
	            bean.setTipologia(rs.getString("tipologia"));
	            bean.setPrezzo(rs.getDouble("prezzo"));
	            bean.setDescrizione(rs.getString("descrizione"));
	            bean.setN_giocatori_min(rs.getInt("n_giocatori_min"));
	            bean.setN_giocatori_max(rs.getInt("n_giocatori_max"));
	            bean.setImmagineCop(rs.getString("img_name"));
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

	
	private static byte[] readBytes(InputStream inputStream){
        ByteArrayOutputStream byteBuffer = new ByteArrayOutputStream();
        int bufferSize = 1024;
        byte[] buffer = new byte[bufferSize];
        
        int bytesRead;
        try {
			while ((bytesRead = inputStream.read(buffer)) != -1) {
			    byteBuffer.write(buffer, 0, bytesRead);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
        
        return byteBuffer.toByteArray();
    }


}
