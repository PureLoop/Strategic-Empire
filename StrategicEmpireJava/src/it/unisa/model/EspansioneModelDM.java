
package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import it.unisa.bean.GiocoBean;
import it.unisa.bean.espansioneBean;

public class EspansioneModelDM implements EspansioneModel {

    private static final String TABLE_NAME = "espansione";
    private static final String TABLE_NAME2 = "acq_espansione";


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
    
    

	public synchronized Collection<espansioneBean> doRetrieveAllDBACQ(String username) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet rs = null;
	    Collection<espansioneBean> espansioni = new LinkedList<>();
	    
	    String selectSQL = "SELECT cod_espansione FROM " + EspansioneModelDM.TABLE_NAME2 + " WHERE nome_ut = ?;";

	    try {
	        // Ottieni la connessione dal pool
	        connection = DriverManagerConnectionPool.getConnection();
	        
	        // Prepara la query per ottenere i codici dei giochi
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, username); // Imposta il parametro per il username

	        // Esegui la query per ottenere i codici dei giochi
	        rs = preparedStatement.executeQuery();

	        // Lista per memorizzare i codici dei giochi
	        List<String> codiciEspansioni = new ArrayList<>();

	        // Estrai i codici dei giochi dal ResultSet
	        while (rs.next()) {
	            String codG = rs.getString("cod_espansione");
	            
	            codiciEspansioni.add(codG);
	        }

	        System.out.println("Codici giochi ottenuti: " + codiciEspansioni.size());

	        // Per ogni codice di gioco, recupera i dettagli completi
	        for (String codG : codiciEspansioni) {
	            try {
	                System.out.println("Inizio recupero dettagli per codice gioco: " + codG);
	                espansioneBean esp = doRetrieveByKey(codG);
	                if (esp != null) {
	                    espansioni.add(esp);
	                    System.out.println("Gioco aggiunto: " + esp.getNomeespansione());
	                } else {
	                    System.out.println("Gioco con codice " + codG + " non trovato.");
	                }
	            } catch (Exception e) {
	                System.err.println("Errore durante il recupero del gioco con codice " + codG + ": " + e.getMessage());
	                e.printStackTrace();
	            }
	        }
	        
	        System.out.println("Numero di giochi recuperati: " + espansioni.size());
	    } catch (SQLException e) {
	        e.printStackTrace(); // Log dell'eccezione per il debug
	    } finally {
	        // Assicurati di chiudere la connessione
	        if (connection != null) {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    
	    return espansioni;
	}



	  public synchronized void addEspansioneToCart(espansioneBean esp, String username, int quantita, boolean controllo)
				throws SQLException {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        
	        String query2 = "UPDATE "+TABLE_NAME2+" SET quantita = ?  WHERE(cod_espansione = ?)" ;
	        // Query di inserimento
	        String query = "INSERT INTO " + TABLE_NAME2 + " (cod_espansione, nome_ut, quantita) VALUES (?, ?, 1)";

	        try {
	            connection = DriverManagerConnectionPool.getConnection();

	        	if(controllo) {
		            preparedStatement = connection.prepareStatement(query2);
		            preparedStatement.setInt(1, quantita);  // Imposta il codice del gioco
		            preparedStatement.setString(2, esp.getCod_espansione());  // Imposta il codice del gioco
		            preparedStatement.executeUpdate();

	        	}else {

	            preparedStatement = connection.prepareStatement(query);

	            // Imposta i valori dei parametri
	            preparedStatement.setString(1, esp.getCod_espansione());  // Imposta il codice del gioco
	            preparedStatement.setString(2, username);  // Imposta il codice del gioco
	            preparedStatement.executeUpdate();
	            
	        	}
	        	
				connection.commit();
	        	


	        } catch (SQLException e) {
	            e.printStackTrace(); // Gestione dell'eccezione
	            throw e; // Rilancia l'eccezione per la gestione a livello superiore
	        } finally {
	            // Chiudi le risorse
	            try {
	                if (preparedStatement != null) {
	                    preparedStatement.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            } finally {
	                if (connection != null) {
	                    DriverManagerConnectionPool.releaseConnection(connection);
	                }
	            }
	        }
	    }
		@Override
		public void deleteAcq_Espansione(String codEspansione) throws SQLException {
		    String query1 = "DELETE FROM " + TABLE_NAME2 + " WHERE cod_espansione = ?";
		    Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    try {
		        connection = DriverManagerConnectionPool.getConnection();
		        preparedStatement = connection.prepareStatement(query1);
		        preparedStatement.setString(1, codEspansione);
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
	 public synchronized Collection<espansioneBean> doRetrieveByFilter(Double prezzo) throws SQLException {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        Collection<espansioneBean> beans = new LinkedList<>();
	        String selectSQL = "SELECT * FROM " + TABLE_NAME + " AS e " +
	                "JOIN img_esp AS ie ON ie.cod_esp = e.cod_espansione where ie.copertina = 1 ";
	        if (prezzo > 0) {
	            selectSQL += " and prezzo <= ?";
	        }
	        try {
	            connection = DriverManagerConnectionPool.getConnection();
	            preparedStatement = connection.prepareStatement(selectSQL);
	            if (prezzo >0) {
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
	                bean.setImmagineCop(rs.getString("img_name"));
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
	 
	 public Collection<espansioneBean>  searchEspansione(String searchParam) throws SQLException{
		 String query = "SELECT * FROM " + TABLE_NAME + " AS e " +
	                "JOIN img_esp AS ie ON ie.cod_esp = e.cod_espansione where ie.copertina = 1 and e.nome_espansione like ?";
			Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    Collection<espansioneBean> espansioni = new LinkedList<espansioneBean>();
		    try {
				connection = DriverManagerConnectionPool.getConnection();
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, searchParam);
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
				try {
					if (preparedStatement != null)
						preparedStatement.close();
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}
			return espansioni;
		}

}