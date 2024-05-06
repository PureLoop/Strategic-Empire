package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class EspansioneModelDM implements EspansioneModel {

    private static final String TABLE_NAME = "espansione";

    @Override
    public synchronized void doSave(espansioneBean espansione) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String insertSQL = "INSERT INTO " + TABLE_NAME +
                "(cod_espansione, cod_gioco, nome_espansione, descrizione, prezzo) VALUES (?, ?, ?, ?, ?)";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, espansione.getCod_espansione());
            preparedStatement.setString(2, espansione.getCod_gioco());
            preparedStatement.setString(3, espansione.getNomeespansione());
            preparedStatement.setString(4, espansione.getDescrizione());
            preparedStatement.setDouble(5, espansione.getPrezzo());

            preparedStatement.executeUpdate();

            connection.commit();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
    }

    @Override
    public synchronized espansioneBean doRetrieveByKey(String code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        espansioneBean espansione = new espansioneBean();

        String selectSQL = "SELECT * FROM " + TABLE_NAME + " WHERE cod_espansione = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);
            preparedStatement.setString(1, code);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                espansione.setCod_espansione(rs.getString("cod_espansione"));
                espansione.setCod_gioco(rs.getString("cod_gioco"));
                espansione.setNomeespansione(rs.getString("nome_espansione"));
                espansione.setDescrizione(rs.getString("descrizione"));
                espansione.setPrezzo(rs.getDouble("prezzo"));
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return espansione;
    }

    @Override
    public synchronized boolean doDelete(String code) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        int result = 0;

        String deleteSQL = "DELETE FROM " + TABLE_NAME + " WHERE cod_espansione = ?";
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setString(1, code);

            result = preparedStatement.executeUpdate();
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return (result != 0);
    }

    @Override
    public synchronized Collection<espansioneBean> doRetrieveAll(String order) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        Collection<espansioneBean> espansioni = new LinkedList<>();

        String selectSQL = "SELECT * FROM " + TABLE_NAME;
        try {
            connection = DriverManagerConnectionPool.getConnection();
            preparedStatement = connection.prepareStatement(selectSQL);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                espansioneBean espansione = new espansioneBean();
                espansione.setCod_espansione(rs.getString("cod_espansione"));
                espansione.setCod_gioco(rs.getString("cod_gioco"));
                espansione.setNomeespansione(rs.getString("nome_espansione"));
                espansione.setDescrizione(rs.getString("descrizione"));
                espansione.setPrezzo(rs.getDouble("prezzo"));
                espansioni.add(espansione);
            }
        } finally {
            try {
                if (preparedStatement != null)
                    preparedStatement.close();
            } finally {
                if (connection != null)
                    connection.close();
            }
        }
        return espansioni;
    }

    @Override
    public synchronized Collection<espansioneBean> doRetrieveByFilter(String tipologia, Double prezzo, boolean check_prezzo) throws SQLException {
        // Implementa il recupero delle espansioni in base a filtri specifici
        return null;
    }
}
