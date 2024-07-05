
package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

import it.unisa.bean.AccessorioBean;
import it.unisa.bean.GiocoBean;

public interface AccessorioModel {

    AccessorioBean doRetrieveByKey(String code) throws SQLException;

    Collection<AccessorioBean> doRetrieveAll(String order) throws SQLException;

    Collection<AccessorioBean> doRetrieveByFilter(String tipologia, Double prezzo) throws SQLException;
    
    void updateAccessorio(AccessorioBean accessorio, boolean img1, boolean img2) throws SQLException;
    void insertProd(AccessorioBean accessorio) throws SQLException;
    void insertImgAcc(AccessorioBean accessorio) throws SQLException;
    void deleteAcc(String codAcc) throws SQLException;
    public Collection<AccessorioBean> searchAccessorio(String searchParam) throws SQLException;
	void addAccessorioToCart(AccessorioBean gioco, String u, int quantita, boolean controllo) throws SQLException;
	public void deleteAcq_Accessorio(String codAccessorio) throws SQLException;
	public  Collection<AccessorioBean> doRetrieveAllDBACQ(String username) throws SQLException;
	public  void setPreferito(String code, String username) throws SQLException;
	public boolean ControllaPreferito(String code, String username) throws SQLException;
	public  void DeletePreferito(String code, String username) throws SQLException;


}
