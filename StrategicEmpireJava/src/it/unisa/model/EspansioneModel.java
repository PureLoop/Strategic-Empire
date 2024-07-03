
package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.GiocoBean;
import it.unisa.bean.espansioneBean;

public interface EspansioneModel {

    espansioneBean doRetrieveByKey(String code) throws SQLException;

    Collection<espansioneBean> doRetrieveAll(String order) throws SQLException;

    Collection<espansioneBean> doRetrieveByFilter(Double prezzo) throws SQLException;
    
    void deleteEsp(String codEsp) throws SQLException;
    
    void insertImgEsp(espansioneBean espansione) throws SQLException;
    
	void insertProd(espansioneBean espansione) throws SQLException;
	
	void updateEspansione(espansioneBean espansione, boolean img1, boolean img2) throws SQLException;
	
	public Collection<espansioneBean>  searchEspansione(String searchParam) throws SQLException;
	
	void addEspansioneToCart(espansioneBean esp, String u, int quantita, boolean controllo) throws SQLException;
	
	public void deleteAcq_Espansione(String codEspansione) throws SQLException;

	public  Collection<espansioneBean> doRetrieveAllDBACQ(String username) throws SQLException;

}