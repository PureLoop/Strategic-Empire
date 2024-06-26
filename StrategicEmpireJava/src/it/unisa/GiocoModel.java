package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.GiocoBean;

public interface GiocoModel {

	public GiocoBean doRetrieveByKey(String code) throws SQLException;
	
	public Collection<GiocoBean> doRetrieveAll(String order) throws SQLException;
	
	public Collection<GiocoBean> doRetrieveByFilter(String tipologia,Double prezzo, Integer nGiocatori, boolean check_prezzo, boolean check_giocatori) throws SQLException;

	void deleteGioco(String codGioco) throws SQLException;
	void insertProd(GiocoBean gioco) throws SQLException;
	void updateGame(GiocoBean gioco, boolean img1, boolean img2) throws SQLException;
	void insertImgGioco(GiocoBean gioco) throws SQLException;
	

}