package it.unisa.model;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.OrdineBean;
import it.unisa.bean.RecensioneBean;

public interface OrdineModel {
	public Collection<OrdineBean> doRetrieveAll(String username) throws SQLException;
	public OrdineBean doRetrieveByCodOrdine(String cod_ordine) throws SQLException;
	public Collection<OrdineBean> doRetrieveNomeAdmin(String username) throws SQLException;
	public Collection<OrdineBean> doRetrieveDataAdmin(Date data) throws SQLException;


}
