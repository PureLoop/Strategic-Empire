package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

public interface GiocoModel {
	
	//Gioco
	
	public void doSave(GiocoBean product) throws SQLException;

	public boolean doDelete(String code) throws SQLException;

	public GiocoBean doRetrieveByKey(String code) throws SQLException;
	
	public Collection<GiocoBean> doRetrieveAll(String order) throws SQLException;
	
	public Collection<GiocoBean> doRetrieveByFilter(String tipologia,Double prezzo, Integer nGiocatori, boolean check_prezzo, boolean check_giocatori) throws SQLException;



}