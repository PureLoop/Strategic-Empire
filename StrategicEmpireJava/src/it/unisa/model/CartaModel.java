
package it.unisa.model;
import java.sql.Date;

import java.sql.SQLException;
import java.util.Collection;
import it.unisa.bean.CartaBean;

public interface CartaModel {
    void doSave(CartaBean accessory) throws SQLException;

    boolean doDelete(String code) throws SQLException;
    
    void doUpdate(String s, String s2, Date x, int y, String a)throws SQLException;

    CartaBean doRetrieveByKey(String s) throws SQLException;

    Collection<CartaBean> doRetrieveAll(String order) throws SQLException;

    Collection<CartaBean> doRetrieveByFilter(String username) throws SQLException;
}
