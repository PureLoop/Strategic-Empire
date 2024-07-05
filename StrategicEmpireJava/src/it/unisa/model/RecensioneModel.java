package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.RecensioneBean;

public interface RecensioneModel {
	public void doSave(RecensioneBean product) throws SQLException;
	public Collection<RecensioneBean> doRetrieveAll() throws SQLException;
	public RecensioneBean retrieveReview(String username,int codice) throws SQLException;
	public void insertReview(String username, String titolo, String descrizione, int valutazione, int codOrdine) throws SQLException;
}
