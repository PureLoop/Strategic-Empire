package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

<<<<<<< HEAD:StrategicEmpireJava/src/it/unisa/GiocoModel.java
import it.unisa.bean.GiocoBean;
=======
import it.unisa.GiocoBean;
>>>>>>> 6bd804a1c16ee5f29e50bc3eb0adf86f6e04983b:StrategicEmpireJava/src/it/unisa/model/GiocoModel.java

public interface GiocoModel {

	public GiocoBean doRetrieveByKey(String code) throws SQLException;
	
	public Collection<GiocoBean> doRetrieveAll(String order) throws SQLException;
	
	public Collection<GiocoBean> doRetrieveByFilter(String tipologia,Double prezzo, Integer nGiocatori, boolean check_prezzo, boolean check_giocatori) throws SQLException;

	void deleteGioco(String codGioco) throws SQLException;
	void insertProd(GiocoBean gioco) throws SQLException;
	void updateGame(GiocoBean gioco, boolean img1, boolean img2) throws SQLException;
	void insertImgGioco(GiocoBean gioco) throws SQLException;
	

}