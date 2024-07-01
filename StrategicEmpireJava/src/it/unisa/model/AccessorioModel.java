
package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.AccessorioBean;

public interface AccessorioModel {

    AccessorioBean doRetrieveByKey(String code) throws SQLException;

    Collection<AccessorioBean> doRetrieveAll(String order) throws SQLException;

    Collection<AccessorioBean> doRetrieveByFilter(String tipologia, Double prezzo) throws SQLException;
    
    void updateAccessorio(AccessorioBean accessorio, boolean img1, boolean img2) throws SQLException;
    void insertProd(AccessorioBean accessorio) throws SQLException;
    void insertImgAcc(AccessorioBean accessorio) throws SQLException;
    void deleteAcc(String codAcc) throws SQLException;
    public Collection<AccessorioBean> searchAccessorio(String searchParam) throws SQLException;
}
