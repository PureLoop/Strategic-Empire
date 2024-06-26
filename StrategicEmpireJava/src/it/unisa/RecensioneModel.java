package it.unisa;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.RecensioneBean;

public interface RecensioneModel {
	public void doSave(RecensioneBean product) throws SQLException;
	public Collection<RecensioneBean> doRetrieveAll() throws SQLException;
}
