package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

public interface AccessorioModel {
    void doSave(AccessorioBean accessory) throws SQLException;

    boolean doDelete(String code) throws SQLException;

    AccessorioBean doRetrieveByKey(String code) throws SQLException;

    Collection<AccessorioBean> doRetrieveAll(String order) throws SQLException;

    Collection<AccessorioBean> doRetrieveByFilter(String tipologia, Double prezzo, boolean check_prezzo) throws SQLException;
}
