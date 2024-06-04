package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class CartaModelDM implements CartaModel {

	private static final String TABLE_NAME = "carta";

    
    private Connection connection;

/*
    @Override
    public void doSave(CartaBean carta) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_QUERY)) {
            preparedStatement.setString(1, carta.getNumero());
            preparedStatement.setInt(2, carta.getScadenza());
            preparedStatement.setInt(3, carta.getCvv());
            preparedStatement.setString(4, carta.getUsername());
            preparedStatement.setString(5, carta.getNome());
            preparedStatement.executeUpdate();
        }
    }

    @Override
    public boolean doDelete(String numero) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(DELETE_QUERY)) {
            preparedStatement.setString(1, numero);
            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        }
    }*/

    @Override
	public synchronized CartaBean doRetrieveByKey(String username) throws SQLException {
		Connection connection = null;
		
		PreparedStatement preparedStatement = null;

		CartaBean bean = new CartaBean();


		String selectCarta = "select c.*" + 
				"from " +CartaModelDM.TABLE_NAME +" as c \r\n" + 
				"where c.username = ? ;";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectCarta);
			preparedStatement.setString(1, username);
			
			ResultSet rs = preparedStatement.executeQuery();
			while(rs.next()) {
				bean.setNumero(rs.getString("numero"));
				bean.setScadenza(rs.getInt("scadenza"));
				bean.setCvv(rs.getInt("cvv"));
				bean.setUsername(rs.getString("Username"));
				bean.setNome(rs.getString("nome"));
			}
		}finally {
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
	public Collection<CartaBean> doRetrieveAll(String order) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<CartaBean> doRetrieveByFilter(String username) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void doSave(CartaBean accessory) throws SQLException {
		// TODO Auto-generated method stub
		
	}


	@Override
	public boolean doDelete(String code) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
}
