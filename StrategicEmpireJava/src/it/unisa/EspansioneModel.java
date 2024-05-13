
package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

public interface EspansioneModel {
    void doSave(espansioneBean espansione) throws SQLException;

    boolean doDelete(String code) throws SQLException;

    espansioneBean doRetrieveByKey(String code) throws SQLException;

    Collection<espansioneBean> doRetrieveAll(String order) throws SQLException;

    Collection<espansioneBean> doRetrieveByFilter(Double prezzo, boolean check_prezzo) throws SQLException;
}