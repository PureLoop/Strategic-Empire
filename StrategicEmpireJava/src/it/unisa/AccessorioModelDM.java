package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class AccessorioModelDM implements AccessorioModel {

    private static final String TABLE_NAME = "accessorio";

    @Override
    public synchronized void doSave(AccessorioBean accessory) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertAccessorio = "INSERT INTO " + TABLE_NAME +
                "(cod_accessorio, nome_accessorio, tipologia, prezzo, descrizione) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertAccessorio);
            preparedStatement.setString(1, accessory.getCod_Accessorio());
            preparedStatement.setString(2, accessory.getNomeaccessorio());
            preparedStatement.setString(3, accessory.getTipologia());
            preparedStatement.setDouble(4, accessory.getPrezzo());
            preparedStatement.setString(5, accessory.getDescrizione());

            preparedStatement.executeUpdate();

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
    public synchronized AccessorioBean doRetrieveByKey(String code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        AccessorioBean bean = new AccessorioBean();

        String selectAccessorio = "SELECT * FROM " + TABLE_NAME + " WHERE cod_accessorio = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectAccessorio);
            preparedStatement.setString(1, code);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bean.setCod_accessorio(rs.getString("cod_accessorio"));
                bean.setNomeaccessorio(rs.getString("nome_accessorio"));
                bean.setTipologia(rs.getString("tipologia"));
                bean.setPrezzo(rs.getDouble("prezzo"));
                bean.setDescrizione(rs.getString("descrizione"));
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return bean;
    }

    @Override
    public synchronized boolean doDelete(String code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result = 0;

        String deleteAccessorio = "DELETE FROM " + TABLE_NAME + " WHERE cod_accessorio = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(deleteAccessorio);
            preparedStatement.setString(1, code);

            result = preparedStatement.executeUpdate();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
        return (result != 0);
    }

    @Override
    public synchronized Collection<AccessorioBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<AccessorioBean> accessories = new LinkedList<>();

        
        String selectSQL = "SELECT * FROM " + AccessorioModelDM.TABLE_NAME + " as g " + 
                "join img_acc as ig on ig.cod_acc = g.cod_accessorio";


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
}
