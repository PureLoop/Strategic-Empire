
package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

public interface EspansioneModel {

    espansioneBean doRetrieveByKey(String code) throws SQLException;

    Collection<espansioneBean> doRetrieveAll(String order) throws SQLException;

    Collection<espansioneBean> doRetrieveByFilter(Double prezzo, boolean check_prezzo) throws SQLException;
    
    void deleteEsp(String codEsp) throws SQLException;
    
    void insertImgEsp(espansioneBean espansione) throws SQLException;
    
	void insertProd(espansioneBean espansione) throws SQLException;
	
	void updateEspansione(espansioneBean espansione, boolean img1, boolean img2) throws SQLException;
}