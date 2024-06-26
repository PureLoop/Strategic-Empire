
package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import it.unisa.bean.espansioneBean;

public class EspansioneModelDM implements EspansioneModel {

    private static final String TABLE_NAME = "espansione";

    @Override
	public espansioneBean doRetrieveByKey(String code) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet rs = null;
	    espansioneBean bean = new espansioneBean();

	    String selectEspansione = "SELECT e.*, ig.img_name, ig.cod_img_esp " + 
	                         "FROM espansione AS e " + 
	                         "JOIN img_esp AS ig ON ig.cod_esp = e.cod_espansione " + 
	                         "AND e.cod_espansione = ?;";

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectEspansione);
	        preparedStatement.setString(1, code);
	        rs = preparedStatement.executeQuery();
	        String immagine1 = null;
            String immagine2 = null;
            boolean firstRow = true;
	        
	        while (rs.next()) {
	        	if(firstRow){
	            bean.setCod_espansione(rs.getString("cod_espansione"));
	            bean.setNomeespansione(rs.getString("nome_espansione"));
	            bean.setDescrizione(rs.getString("descrizione"));
	            bean.setPrezzo(rs.getDouble("prezzo"));
	            immagine1 = rs.getString("img_name");
                firstRow = false;
            } else {
                immagine2 = rs.getString("img_name");
            }
	        }
	        if (immagine1 != null) {
                bean.setImmagineCop(immagine1);
            }
            if (immagine2 != null) {
                bean.setImmagine2(immagine2);
            }
            System.out.println(bean.getImmagine2());
	    } finally {
	        if (rs != null) {
	            rs.close();
	        }
	        if (preparedStatement != null) {
	            preparedStatement.close();
	        }
	        if (connection != null) {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    return bean;
	}

    @Override
	public synchronized Collection<espansioneBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<espansioneBean> espansioni = new LinkedList<>();

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " AS e " +
                "JOIN img_esp AS ie ON ie.cod_esp = e.cod_espansione where ie.copertina = 1";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                espansioneBean espansione = new espansioneBean();
                espansione.setCod_espansione(rs.getString("cod_espansione"));
                espansione.setCod_gioco(rs.getString("cod_gioco"));
                espansione.setNomeespansione(rs.getString("nome_espansione"));
                espansione.setDescrizione(rs.getString("descrizione"));
                espansione.setPrezzo(rs.getDouble("prezzo"));
                espansione.setImmagineCop(rs.getString("img_name"));
                espansioni.add(espansione);
            }
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
        return espansioni;
    }

    @Override
	 public synchronized Collection<espansioneBean> doRetrieveByFilter(Double prezzo, boolean check_prezzo) throws SQLException {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        Collection<espansioneBean> beans = new LinkedList<>();
	        String selectSQL = "SELECT * FROM " + TABLE_NAME;
	        if (check_prezzo && prezzo != null) {
	            selectSQL += " WHERE prezzo = ?";
	        }
	        try {
	            connection = DriverManagerConnectionPool.getConnection();
	            preparedStatement = connection.prepareStatement(selectSQL);
	            if (check_prezzo && prezzo != null) {
	                preparedStatement.setDouble(1, prezzo);
	            }
	            ResultSet rs = preparedStatement.executeQuery();
	            while (rs.next()) {
	                espansioneBean bean = new espansioneBean();
	                bean.setCod_espansione(rs.getString("cod_espansione"));
	                bean.setCod_gioco(rs.getString("cod_gioco"));
	                bean.setNomeespansione(rs.getString("nome_espansione"));
	                bean.setDescrizione(rs.getString("descrizione"));
	                bean.setPrezzo(rs.getDouble("prezzo"));
	                beans.add(bean);
	            }
	        } finally {
	            if (preparedStatement != null)
	                preparedStatement.close();
	            if (connection != null)
	                DriverManagerConnectionPool.releaseConnection(connection);
	        }
	        return beans;
	    }
	 
	 @Override
		public void insertImgEsp(espansioneBean espansione) throws SQLException {
		    String query1 = "INSERT INTO img_esp(cod_img_esp, copertina, img_name, cod_esp) VALUES (?, ?, ?, ?)";
		    String query2 = "INSERT INTO img_esp(cod_img_esp, copertina, img_name, cod_esp) VALUES (?, ?, ?, ?)";
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    
		    try {
		    	String cod_img_esp = espansione.getCod_espansione() + "Img1";
		    	String cod_img_esp2 = espansione.getCod_espansione() + "Img2";
		        connection = DriverManagerConnectionPool.getConnection();
		        preparedStatement = connection.prepareStatement(query1);
		        preparedStatement.setString(1, cod_img_esp);
		        preparedStatement.setBoolean(2, true);
		        preparedStatement.setString(3, espansione.getImmagineCop());
		        preparedStatement.setString(4, espansione.getCod_espansione());
		        preparedStatement.executeUpdate();
		        
		        preparedStatement = connection.prepareStatement(query2);
		        preparedStatement.setString(1, cod_img_esp2);
		        preparedStatement.setBoolean(2, false);
		        preparedStatement.setString(3, espansione.getImmagineCop());
		        preparedStatement.setString(4, espansione.getCod_espansione());
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
		public void deleteEsp(String codEsp) throws SQLException {
		    String query1 = "DELETE FROM espansione where (cod_espansione = ?)";
		    String query2 = "DELETE FROM img_esp where (cod_esp = ?)";
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    
		    try {
		        connection = DriverManagerConnectionPool.getConnection();
		        preparedStatement = connection.prepareStatement(query1);
		        preparedStatement.setString(1, codEsp);
		        preparedStatement.executeUpdate();
		        
		        preparedStatement = connection.prepareStatement(query2);
		        preparedStatement.setString(1, codEsp);
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
	 
	 @Override
		public void updateEspansione(espansioneBean espansione, boolean img1, boolean img2) throws SQLException {
		    String updateGame = "UPDATE `espansione` SET `nome_espansione` = ?, `prezzo` = ?, `descrizione` = ? WHERE (`cod_espansione` = ?)";
		    String updateImg = "UPDATE img_esp set img_name = ?, copertina = ? where (cod_img_esp = ?)";
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    
		    try {
		    	connection = DriverManagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(updateGame);
				preparedStatement.setString(1,espansione.getNomeespansione());
				preparedStatement.setDouble(2, espansione.getPrezzo());
				preparedStatement.setString(3, espansione.getDescrizione());
				preparedStatement.setString(4, espansione.getCod_espansione());
				preparedStatement.executeUpdate();
		        
		        if(img1 == true) {
					preparedStatement = connection.prepareStatement(updateImg);
					preparedStatement.setString(1, espansione.getImmagineCop());
					preparedStatement.setInt(2, 1);
					preparedStatement.setString(3, espansione.getCod_espansione()+"Img1");
					preparedStatement.executeUpdate();
				}
				
				if(img2 == true) {
					preparedStatement = connection.prepareStatement(updateImg);
					preparedStatement.setString(1, espansione.getImmagine2());
					preparedStatement.setInt(2, 0);
					preparedStatement.setString(3, espansione.getCod_espansione()+"Img2");
					preparedStatement.executeUpdate();
				}
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