
package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import it.unisa.AccessorioModel;
import it.unisa.bean.AccessorioBean;

public class AccessorioModelDM implements AccessorioModel {

    private static final String TABLE_NAME = "accessorio";

    @Override
    public AccessorioBean doRetrieveByKey(String code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        AccessorioBean bean = new AccessorioBean();

        String selectAccessorio = "SELECT a.*, ia.img_name, ia.cod_img_acc " +
                             "FROM accessorio AS a " +
                             "JOIN img_acc AS ia ON ia.cod_acc = a.cod_accessorio " +
                             "WHERE a.cod_accessorio = ?;";

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectAccessorio);
            preparedStatement.setString(1, code);
            rs = preparedStatement.executeQuery();

            String immagine1 = null;
            String immagine2 = null;
            boolean firstRow = true;

            while (rs.next()) {
                if (firstRow) {
                    bean.setCod_accessorio(rs.getString("cod_accessorio"));
                    bean.setNomeaccessorio(rs.getString("nome_accessorio"));
                    bean.setDescrizione(rs.getString("descrizione"));
                    bean.setTipologia(rs.getString("tipologia"));
                    bean.setPrezzo(rs.getDouble("prezzo"));
                    immagine1 = rs.getString("img_name");
                    firstRow = false;
                } else {
                    immagine2 = rs.getString("img_name");
                }
            }

            if (immagine1 != null) {
                bean.setImmagineCop(immagine1);
            }
            if (immagine2 != null) {
                bean.setImmagine2(immagine2);
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return bean;
    }


	@Override
	public synchronized Collection<AccessorioBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<AccessorioBean> accessories = new LinkedList<>();

        
        String selectSQL = "SELECT * FROM " +TABLE_NAME + " as g " + 
                "join img_acc as ig on ig.cod_acc = g.cod_accessorio where ig.copertina = 1";


        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                AccessorioBean bean = new AccessorioBean();
                bean.setCod_accessorio(rs.getString("cod_accessorio"));
                bean.setNomeaccessorio(rs.getString("nome_accessorio"));
                bean.setTipologia(rs.getString("tipologia"));
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setDescrizione(rs.getString("descrizione"));
				bean.setImmagineCop(rs.getString("img_name"));

                accessories.add(bean);
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return accessories;
    }

    @Override
	 public synchronized Collection<AccessorioBean> doRetrieveByFilter(String tipologia, Double prezzo, boolean check_prezzo) throws SQLException {
       Connection connection = null;
       PreparedStatement preparedStatement = null;
       Collection<AccessorioBean> beans = new LinkedList<>();
       String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE tipologia = ?";
       if (check_prezzo && prezzo != null) {
           selectSQL += " AND prezzo = ?";
       }
       try {
           connection = DriverManagerConnectionPool.getConnection();
           preparedStatement = connection.prepareStatement(selectSQL);
           preparedStatement.setString(1, tipologia);
           if (check_prezzo && prezzo != null) {
               preparedStatement.setDouble(2, prezzo);
           }
           ResultSet rs = preparedStatement.executeQuery();
           while (rs.next()) {
               AccessorioBean bean = new AccessorioBean();
               bean.setCod_accessorio(rs.getString("cod_accessorio"));
               bean.setNomeaccessorio(rs.getString("nome_accessorio"));
               bean.setTipologia(rs.getString("tipologia"));
               bean.setPrezzo(rs.getDouble("prezzo"));
               bean.setDescrizione(rs.getString("descrizione"));
               beans.add(bean);
           }
       } finally {
           try {
               if (preparedStatement != null)
                   preparedStatement.close();
           } finally {
               DriverManagerConnectionPool.releaseConnection(connection);
           }
       }
       return beans;
   }
    
    @Override
	public void insertProd(AccessorioBean accessorio) throws SQLException {
	    String query = "INSERT INTO accessorio(cod_accessorio, nome_accessorio, tipologia, prezzo, descrizione) VALUES (?, ?, ?, ?, ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query);

	        // Imposta i parametri della query
	        preparedStatement.setString(1, accessorio.getCod_Accessorio());
	        preparedStatement.setString(2, accessorio.getNomeaccessorio());
	        preparedStatement.setString(3, accessorio.getTipologia());
	        preparedStatement.setDouble(4, accessorio.getPrezzo());
	        preparedStatement.setString(5, accessorio.getDescrizione());

	        // Esegui la query
	        preparedStatement.executeUpdate();

	        // Commit della transazione
	        connection.commit();
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	}
    @Override
	public void insertImgAcc(AccessorioBean accessorio) throws SQLException {
	    String query1 = "INSERT INTO img_acc(cod_img_acc, copertina, img_name, cod_acc) VALUES (?, ?, ?, ?)";
	    String query2 = "INSERT INTO img_acc(cod_img_acc, copertina, img_name, cod_acc) VALUES (?, ?, ?, ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        String cod_img_acc = accessorio.getCod_Accessorio() + "Img1";
	        String cod_img_acc1 = accessorio.getCod_Accessorio() + "Img2";
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query1);

	        preparedStatement.setString(1, cod_img_acc);
	        preparedStatement.setBoolean(2, true);
	        preparedStatement.setString(3, accessorio.getImmagineCop());
	        preparedStatement.setString(4, accessorio.getCod_Accessorio());
	        preparedStatement.executeUpdate();

	        preparedStatement = connection.prepareStatement(query2);

	        preparedStatement.setString(1, cod_img_acc1);
	        preparedStatement.setBoolean(2, false);
	        preparedStatement.setString(3, accessorio.getImmagine2());
	        preparedStatement.setString(4, accessorio.getCod_Accessorio());
	        preparedStatement.executeUpdate();
	        // Commit della transazione
	        connection.commit();
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	}
    
    @Override
	public void deleteAcc(String codAcc) throws SQLException {
	    String query1 = "DELETE FROM accessorio where (cod_accessorio = ?)";
	    String query2 = "DELETE FROM img_acc where (cod_acc = ?)";
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    
	    try {
	        connection = DriverManagerConnectionPool.getConnection();
	        preparedStatement = connection.prepareStatement(query1);
	        preparedStatement.setString(1, codAcc);
	        preparedStatement.executeUpdate();
	        
	        preparedStatement = connection.prepareStatement(query2);
	        preparedStatement.setString(1, codAcc);
	        preparedStatement.executeUpdate();

	        // Commit della transazione
	        connection.commit();
	    } finally {
	        try {
	            if (preparedStatement != null)
	                preparedStatement.close();
	        } finally {
	            DriverManagerConnectionPool.releaseConnection(connection);
	        }
	    }
	}


	@Override
	public void updateAccessorio(AccessorioBean accessorio, boolean img1, boolean img2) throws SQLException {
		String updateGame = "UPDATE `accessorio` SET `nome_accessorio` = ?,`tipologia` = ?, `prezzo` = ?,`descrizione` = ?  WHERE (`cod_accessorio` = ?)";
		String updateImg = "UPDATE img_acc set img_name = ?, copertina = ? where (cod_img_acc = ?)";
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateGame);
			preparedStatement.setString(1, accessorio.getNomeaccessorio());
			preparedStatement.setString(2, accessorio.getTipologia());
			preparedStatement.setDouble(3, accessorio.getPrezzo());
			preparedStatement.setString(4, accessorio.getDescrizione());
			preparedStatement.setString(5, accessorio.getCod_Accessorio());
			preparedStatement.executeUpdate();

			if(img1 == true) {
				preparedStatement = connection.prepareStatement(updateImg);
				preparedStatement.setString(1, accessorio.getImmagineCop());
				preparedStatement.setInt(2, 1);
				preparedStatement.setString(3, accessorio.getCod_Accessorio()+"Img1");
				preparedStatement.executeUpdate();
			}
			
			if(img2 == true) {
				preparedStatement = connection.prepareStatement(updateImg);
				preparedStatement.setString(1, accessorio.getImmagine2());
				preparedStatement.setInt(2, 0);
				preparedStatement.setString(3, accessorio.getCod_Accessorio()+"Img2");
				preparedStatement.executeUpdate();
			}
			connection.commit();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}
}
