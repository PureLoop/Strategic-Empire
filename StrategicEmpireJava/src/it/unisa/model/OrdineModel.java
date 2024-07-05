package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.OrdineBean;

public interface OrdineModel {
	public Collection<OrdineBean> doRetrieveAll(String username) throws SQLException;
	public Collection<OrdineBean> doRetrieveAllMenager(String username) throws SQLException;
}
