
package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.CartaBean;

public interface CartaModel {
    void doSave(CartaBean accessory) throws SQLException;

    boolean doDelete(String code) throws SQLException;

    CartaBean doRetrieveByKey(String username) throws SQLException;

    Collection<CartaBean> doRetrieveAll(String order) throws SQLException;

    Collection<CartaBean> doRetrieveByFilter(String username) throws SQLException;
}
