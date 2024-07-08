package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import it.unisa.bean.ScontoBean;

public interface ScontoModel {
	public int verificaSconto(String tagSconto) throws SQLException;
	public void deleteSconto(String tagSconto) throws SQLException;
	public void insertSconto(String tagSconto, int percentuale) throws SQLException;
	public Collection<ScontoBean> retrieveAll() throws SQLException;
}
