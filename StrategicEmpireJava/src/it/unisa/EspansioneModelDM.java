
package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class EspansioneModelDM implements EspansioneModel {

    private static final String TABLE_NAME = "espansione";

    @Override
    public synchronized void doSave(espansioneBean espansione) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertespansione = "INSERT INTO " + TABLE_NAME +
                "(cod_espansione, cod_gioco, nome_espansione, descrizione, prezzo) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertespansione);
            preparedStatement.setString(1, espansione.getCod_espansione());
            preparedStatement.setString(2, espansione.getCod_gioco());
            preparedStatement.setString(3, espansione.getNomeespansione());
            preparedStatement.setString(4, espansione.getDescrizione());
            preparedStatement.setDouble(5, espansione.getPrezzo());

            preparedStatement.executeUpdate();

            connection.commit();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
    }

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
    public synchronized boolean doDelete(String code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE cod_espansione = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setString(1, code);

            result = preparedStatement.executeUpdate();
        } finally {
            if (preparedStatement != null)
                preparedStatement.close();
            if (connection != null)
                connection.close();
        }
        return (result != 0);
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
}