package it.unisa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class RecensioneModelDM implements RecensioneModel{
	private static final String TABLE_NAME = "recensione";
	@Override
	public synchronized Collection<RecensioneBean> doRetrieveAll() throws SQLException {
	Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<RecensioneBean> review = new LinkedList<RecensioneBean>();
		String selectSQL = "select * from " +RecensioneModelDM.TABLE_NAME;

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				RecensioneBean recensione = new RecensioneBean();
				recensione.setCod_Review(rs.getString("cod_review"));
				recensione.setTitolo(rs.getString("titolo"));
				recensione.setDescrizione(rs.getString("descrizione"));
				recensione.setValutazione(rs.getInt("valutazione"));
				review.add(recensione);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return review;
	}

	@Override
	public void doSave(RecensioneBean product) throws SQLException {
		// TODO Auto-generated method stub
		
	}
}
