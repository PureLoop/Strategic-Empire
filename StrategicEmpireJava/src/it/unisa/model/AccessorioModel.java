
package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

<<<<<<< HEAD:StrategicEmpireJava/src/it/unisa/AccessorioModel.java
import it.unisa.bean.AccessorioBean;
=======
import it.unisa.AccessorioBean;
>>>>>>> 6bd804a1c16ee5f29e50bc3eb0adf86f6e04983b:StrategicEmpireJava/src/it/unisa/model/AccessorioModel.java

public interface AccessorioModel {

    AccessorioBean doRetrieveByKey(String code) throws SQLException;

    Collection<AccessorioBean> doRetrieveAll(String order) throws SQLException;

    Collection<AccessorioBean> doRetrieveByFilter(String tipologia, Double prezzo, boolean check_prezzo) throws SQLException;
    
    void updateAccessorio(AccessorioBean accessorio, boolean img1, boolean img2) throws SQLException;
    void insertProd(AccessorioBean accessorio) throws SQLException;
    void insertImgAcc(AccessorioBean accessorio) throws SQLException;
    void deleteAcc(String codAcc) throws SQLException;

}
