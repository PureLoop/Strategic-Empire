package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import it.unisa.bean.ScontoBean;

public class ScontoModelDM implements ScontoModel {

    @Override
    public int verificaSconto(String tagSconto) throws SQLException {
        String query = "SELECT perc_sconto FROM sconto WHERE nome_sconto = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        int perc = 0;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, tagSconto);
            rs = preparedStatement.executeQuery();

            if (rs.next()) {
                perc = rs.getInt("perc_sconto");
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
        return perc;
    }

    @Override
    public void deleteSconto(String tagSconto) throws SQLException {
        String query = "DELETE FROM sconto WHERE nome_sconto = ?";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, tagSconto);
            preparedStatement.executeUpdate();
            connection.commit();
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                DriverManagerConnectionPool.releaseConnection(connection);
            }
        }
    }


    @Override
    public void insertSconto(String tagSconto, int perc) throws SQLException {
        System.out.println("ciao");
        String sql = "INSERT INTO sconto (nome_sconto, perc_sconto) VALUES (?, ?)";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        connection = DriverManagerConnectionPool.getConnection();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, tagSconto);
            statement.setInt(2, perc);
            statement.executeUpdate();
            connection.commit();
        }
    }

    @Override
    public Collection<ScontoBean> retrieveAll() throws SQLException {
    	System.out.println("no");
        List<ScontoBean> sconti = new ArrayList<>();
        String query = "SELECT nome_sconto, perc_sconto FROM sconto";
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;

        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(query);
            rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String nomeSconto = rs.getString("nome_sconto");
                int percSconto = rs.getInt("perc_sconto");

                ScontoBean sconto = new ScontoBean();
                sconto.setNomeSconto(nomeSconto);
                sconto.setPercentuale(percSconto);
                sconti.add(sconto);
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

        return sconti;
    }
}
