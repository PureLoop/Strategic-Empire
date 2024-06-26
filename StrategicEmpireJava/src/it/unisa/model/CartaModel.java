
package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

<<<<<<< HEAD:StrategicEmpireJava/src/it/unisa/CartaModel.java
import it.unisa.bean.CartaBean;
=======
import it.unisa.CartaBean;
>>>>>>> 6bd804a1c16ee5f29e50bc3eb0adf86f6e04983b:StrategicEmpireJava/src/it/unisa/model/CartaModel.java

public interface CartaModel {
    void doSave(CartaBean accessory) throws SQLException;

    boolean doDelete(String code) throws SQLException;

    CartaBean doRetrieveByKey(String username) throws SQLException;

    Collection<CartaBean> doRetrieveAll(String order) throws SQLException;

    Collection<CartaBean> doRetrieveByFilter(String username) throws SQLException;
}
