package it.unisa.model;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.util.ArrayList;

import java.util.LinkedList;

import it.unisa.bean.GiocoBean;
import it.unisa.model.GiocoModel;

import java.util.Base64;

public class GiocoModelDM implements GiocoModel{
	private static final String TABLE_NAME = "gioco";
	private static final String TABLE_NAME2 = "espansione";
	private static final String TABLE_NAME3= "accessorio";
	private static final String TABLE_NAME4= "acq_gioco";
	


	public synchronized GiocoBean doRetrieveByKey(String code) throws SQLException {
		
		Connection connection = null;
		
		PreparedStatement preparedStatement = null;

		GiocoBean bean = new GiocoBean();


		String selectGioco = "select g.*,ig.img_name,ig.cod_img_gioco\r\n" + 
				"from " +GiocoModelDM.TABLE_NAME +" as g \r\n" + 
				"join img_gioco as ig on ig.cod_gioco = g.cod_gioco\r\n" + 
				"where  g.cod_gioco = ? ;";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectGioco);
			preparedStatement.setString(1, code);
			String immagine1 = null;
            String immagine2 = null;
            boolean firstRow = true;
            
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
			if(firstRow){
				bean.setCod_gioco(rs.getString("cod_gioco"));
				bean.setNomegioco(rs.getString("nome_gioco"));
				bean.setEdizione(rs.getString("edizione"));
				bean.setTipologia(rs.getString("tipologia"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setN_giocatori_min(rs.getInt("n_giocatori_min"));
				bean.setN_giocatori_max(rs.getInt("n_giocatori_max"));
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
	
	
	
	  public synchronized void addGiocoToCart(GiocoBean gioco, String username, int quantita,boolean controllo) throws SQLException {
	        Connection connection = null;
	        PreparedStatement preparedStatement = null;
	        
	        String query2 = "UPDATE "+TABLE_NAME4+" SET quantita = ?  WHERE(cod_gioco = ?)" ;
	        // Query di inserimento
	        String query = "INSERT INTO " + TABLE_NAME4 + " (cod_gioco, nome_ut, quantita) VALUES (?, ?, 1)";

	        try {
	            connection = DriverManagerConnectionPool.getConnection();

	        	if(controllo) {
		            preparedStatement = connection.prepareStatement(query2);
		            preparedStatement.setInt(1, quantita);  // Imposta il codice del gioco
		            preparedStatement.setString(2, gioco.getCod_Gioco());  // Imposta il codice del gioco
		            preparedStatement.executeUpdate();

	        	}else {

	            preparedStatement = connection.prepareStatement(query);

	            // Imposta i valori dei parametri
	            preparedStatement.setString(1, gioco.getCod_Gioco());  // Imposta il codice del gioco
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
		

	public synchronized Collection<GiocoBean> doRetrieveAllDBACQ(String username) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet rs = null;
	    Collection<GiocoBean> giochi = new LinkedList<>();
	    
	    String selectSQL = "SELECT cod_gioco FROM " + GiocoModelDM.TABLE_NAME4 + " WHERE nome_ut = ?;";

	    try {
	        // Ottieni la connessione dal pool
	        connection = DriverManagerConnectionPool.getConnection();
	        
	        // Prepara la query per ottenere i codici dei giochi
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, username); // Imposta il parametro per il username

	        // Esegui la query per ottenere i codici dei giochi
	        rs = preparedStatement.executeQuery();

	        // Lista per memorizzare i codici dei giochi
	        List<String> codiciGiochi = new ArrayList<>();

	        // Estrai i codici dei giochi dal ResultSet
	        while (rs.next()) {
	            String codG = rs.getString("cod_gioco");
	            
	            codiciGiochi.add(codG);
	        }

	        System.out.println("Codici giochi ottenuti: " + codiciGiochi.size());

	        // Per ogni codice di gioco, recupera i dettagli completi
	        for (String codG : codiciGiochi) {
	            try {
	                System.out.println("Inizio recupero dettagli per codice gioco: " + codG);
	                GiocoBean gioco = doRetrieveByKey(codG);
	                if (gioco != null) {
	                    giochi.add(gioco);
	                    System.out.println("Gioco aggiunto: " + gioco.getNomegioco());
	                } else {
	                    System.out.println("Gioco con codice " + codG + " non trovato.");
	                }
	            } catch (Exception e) {
	                System.err.println("Errore durante il recupero del gioco con codice " + codG + ": " + e.getMessage());
	                e.printStackTrace();
	            }
	        }
	        
	        System.out.println("Numero di giochi recuperati: " + giochi.size());
	    } catch (SQLException e) {
	        e.printStackTrace(); // Log dell'eccezione per il debug
	    } finally {
	        // Assicurati di chiudere la connessione
	        if (connection != null) {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    
	    return giochi;
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

	

	

	@Override
	public Collection<GiocoBean> doRetrieveByFilter(String tipologia, Double prezzo, Integer nGiocatori) throws SQLException {
		 Connection connection = null;
		    PreparedStatement preparedStatement = null;
		    Collection<GiocoBean> beans = new LinkedList<>();
		    String selectSQL = "select g.*,ig.img_name,ig.cod_img_gioco\r\n" + 
					"from " +GiocoModelDM.TABLE_NAME +" as g \r\n" + 
					"join img_gioco as ig on ig.cod_gioco = g.cod_gioco\r\n" + 
					"where ig.copertina = true AND g.tipologia = ?";
		    int p2 = 0,p3= 0;
		    if(prezzo > 0) {	
		    	selectSQL += " AND g.prezzo <= ?";
		    	p2 ++;
		    } 	
		    if(nGiocatori > 0) {
		    	selectSQL += " AND g.n_giocatori_min >= ?";
		    	p3++;
		    }
		    try {
		    	
		        connection = DriverManagerConnectionPool.getConnection();
		        preparedStatement = connection.prepareStatement(selectSQL);
		        
		        preparedStatement.setString(1, tipologia);
		       
		        if(p2 == 1 && p3 == 0) {
			        preparedStatement.setDouble(2, prezzo);

		        }
		        else if(p2 == 0 && p3 == 1) {
			        preparedStatement.setInt(2, nGiocatori);
		        }
		        
		        else if(p2 == 1 && p3 == 1) {
			        preparedStatement.setDouble(2, prezzo);
			        preparedStatement.setInt(3, nGiocatori);

		        }
		        
		        System.out.println("Query SQL: " + selectSQL);
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
		   
		        return  beans;		
	}

	@Override
	public void updateGame(GiocoBean gioco, boolean img1, boolean img2) throws SQLException {
		String updateGame = "UPDATE `gioco` SET `nome_gioco` = ?,`edizione` = ?,`tipologia` = ?, `prezzo` = ?,`descrizione` = ? ,`n_giocatori_min` = ? ,`n_giocatori_max` = ? WHERE (`cod_gioco` = ?)";
		String updateImg = "UPDATE img_gioco set img_name = ?, copertina = ? where (cod_img_gioco = ?)";
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
			
			if(img1 == true) {
				preparedStatement = connection.prepareStatement(updateImg);
				preparedStatement.setString(1, gioco.getImmagineCop());
				preparedStatement.setInt(2, 1);
				preparedStatement.setString(3, gioco.getCod_Gioco()+"Img1");
				preparedStatement.executeUpdate();
			}
			
			if(img2 == true) {
				preparedStatement = connection.prepareStatement(updateImg);
				preparedStatement.setString(1, gioco.getImmagine2());
				preparedStatement.setInt(2, 0);
				preparedStatement.setString(3, gioco.getCod_Gioco()+"Img2");
				preparedStatement.executeUpdate();
			}
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
	public void insertImgGioco(GiocoBean gioco) throws SQLException {
	    String query1 = "INSERT INTO img_gioco(cod_img_gioco, copertina, img_name, cod_gioco) VALUES (?, ?, ?, ?)";
	    String query2 = "INSERT INTO img_gioco(cod_img_gioco, copertina, img_name, cod_gioco) VALUES (?, ?, ?, ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        String cod_img_gioco = gioco.getCod_Gioco() + "Img1";
	        String cod_img_gioco2 = gioco.getCod_Gioco() + "Img2";
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query1);

	        preparedStatement.setString(1, cod_img_gioco);
	        preparedStatement.setBoolean(2, true);
	        preparedStatement.setString(3, gioco.getImmagineCop());
	        preparedStatement.setString(4, gioco.getCod_Gioco());
	        preparedStatement.executeUpdate();

	        
	        preparedStatement = connection.prepareStatement(query2);

	        preparedStatement.setString(1, cod_img_gioco2);
	        preparedStatement.setBoolean(2, false);
	        preparedStatement.setString(3, gioco.getImmagineCop());
	        preparedStatement.setString(4, gioco.getCod_Gioco());
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
	public void deleteGioco(String codGioco) throws SQLException {
	    String query1 = "DELETE FROM gioco where (cod_gioco = ?)";
	    String query2 = "DELETE FROM img_gioco where (cod_gioco = ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query1);
	        preparedStatement.setString(1, codGioco);
	        preparedStatement.executeUpdate();
	        
	        preparedStatement = connection.prepareStatement(query2);
	        preparedStatement.setString(1, codGioco);
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
	public void deleteAcq_Gioco(String codGioco) throws SQLException {
	    String query1 = "DELETE FROM " + TABLE_NAME4 + " WHERE cod_gioco = ?";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query1);
	        preparedStatement.setString(1, codGioco);
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
	
	public Collection<GiocoBean>  searchGioco(String searchParam) throws SQLException{
		String query = "select g.*,ig.img_name,ig.cod_img_gioco\r\n" + 
				"from " +GiocoModelDM.TABLE_NAME +" as g \r\n" + 
				"join img_gioco as ig on ig.cod_gioco = g.cod_gioco\r\n" + 
				"where ig.copertina = true and g.nome_gioco like ?;";
		Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    Collection<GiocoBean> gioco = new LinkedList<GiocoBean>();
	    try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, searchParam);
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

}