package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import it.unisa.bean.GiocoBean;
import it.unisa.bean.OggettiCarrelloBean;
import it.unisa.bean.OrdineBean;

public class OrdineModelDM implements OrdineModel{

	@Override
	public Collection<OrdineBean> doRetrieveAll(String username) throws SQLException {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    Collection<OrdineBean> ordini = new LinkedList<>();

	    String selectSQL = "SELECT * FROM ordine WHERE cod_utente = ?";
	    String selectRecapItems = "SELECT * FROM recap WHERE num_ordine = ?";

	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(selectSQL);
	        preparedStatement.setString(1, username);
	        ResultSet rs = preparedStatement.executeQuery();

	        while (rs.next()) {
	            OrdineBean ordine = new OrdineBean();
	            ordine.setCarta(rs.getString("carta"));
	            ordine.setCodiceUtente(rs.getString("cod_utente"));
	            ordine.setCodOrdine(rs.getInt("cod_ordine"));
	            ordine.setCodSconto(rs.getString("cod_sconto"));
	            java.sql.Date sqlDate = rs.getDate("data");
	            String dateString = sqlDate.toString();
	            ordine.setData(dateString);

	            // Ora recuperiamo gli elementi di recap per questo ordine
	            PreparedStatement recapStatement = connection.prepareStatement(selectRecapItems);
	            recapStatement.setInt(1, ordine.getCodOrdine());
	            ResultSet recapResultSet = recapStatement.executeQuery();

	            Collection<OggettiCarrelloBean> recapItems = new LinkedList<>();
	            while (recapResultSet.next()) {
	                OggettiCarrelloBean recapItem = new OggettiCarrelloBean();
	                recapItem.setPrezzo(recapResultSet.getDouble("prezzo"));
	                recapItem.setQuantita(recapResultSet.getInt("quantita"));
	                String codArticoloGio = recapResultSet.getString("acq_gio");
	                if (codArticoloGio != null) {
	                    recapItem.setCod_articolo(codArticoloGio);
	                }
	                
	                String codArticoloAcc = recapResultSet.getString("acq_acc");
	                if (codArticoloAcc != null) {
	                    recapItem.setCod_articolo(codArticoloAcc);
	                }
	                
	                String codArticoloEsp = recapResultSet.getString("acq_esp");
	                if (codArticoloEsp != null) {
	                    recapItem.setCod_articolo(codArticoloEsp);
	                }
	                recapItems.add(recapItem);
	            }
	            ordine.setListItems(recapItems);

	            recapStatement.close();

	            ordini.add(ordine);
	        }
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	    return ordini;
	}

	@Override
	public Collection<OrdineBean> doRetrieveAllMenager(String username) throws SQLException {
		return null;
	}

	@Override
	public OrdineBean doRetrieveByCodOrdine(String cod_ordine) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        OrdineBean ordine = null;

        String selectOrderSQL = "SELECT cod_ordine, cod_utente, carta, cod_sconto, data FROM Ordine WHERE cod_ordine = ?";
        String selectItemsSQL = "SELECT * FROM Recap WHERE num_ordine = ?";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectOrderSQL);
            preparedStatement.setString(1, cod_ordine);

            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                ordine = new OrdineBean();
                ordine.setCodOrdine(rs.getInt("cod_ordine"));
                ordine.setCodiceUtente(rs.getString("cod_utente"));
                ordine.setCarta(rs.getString("carta"));
                ordine.setCodSconto(rs.getString("cod_sconto"));
                java.sql.Date sqlDate = rs.getDate("data");
	            String dateString = sqlDate.toString();
	            ordine.setData(dateString);
            }

            if (ordine != null) {
                preparedStatement = connection.prepareStatement(selectItemsSQL);
                preparedStatement.setString(1, cod_ordine);

                rs = preparedStatement.executeQuery();
                Collection<OggettiCarrelloBean> items = new LinkedList<>();

                while (rs.next()) {
                    OggettiCarrelloBean recapItem = new OggettiCarrelloBean();
                    recapItem.setPrezzo(rs.getDouble("prezzo"));
	                recapItem.setQuantita(rs.getInt("quantita"));
	                String codArticoloGio = rs.getString("acq_gio");
	                if (codArticoloGio != null) {
	                    recapItem.setCod_articolo(codArticoloGio);
	                }
	                
	                String codArticoloAcc = rs.getString("acq_acc");
	                if (codArticoloAcc != null) {
	                    recapItem.setCod_articolo(codArticoloAcc);
	                }
	                
	                String codArticoloEsp = rs.getString("acq_esp");
	                if (codArticoloEsp != null) {
	                    recapItem.setCod_articolo(codArticoloEsp);
	                }
	                items.add(recapItem);
                }
                
                ordine.setListItems(items);
            }

        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return ordine;
    }
	
}
