package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

public interface RecensioneModel {
	public void doSave(RecensioneBean product) throws SQLException;
	public Collection<RecensioneBean> doRetrieveAll() throws SQLException;
}
