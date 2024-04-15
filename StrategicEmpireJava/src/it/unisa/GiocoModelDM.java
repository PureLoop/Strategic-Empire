package it.unisa;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class GiocoModelDM implements GiocoModel{
	private static final String TABLE_NAME = "gioco";

	@Override
	public synchronized void doSave(GiocoBean gioco) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + GiocoModelDM.TABLE_NAME
				+ " (NAME, DESCRIPTION, PRICE, QUANTITY) VALUES (?, ?, ?, ?)";
	}

	@Override
	public synchronized GiocoBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		GiocoBean bean = new GiocoBean();

		String selectSQL = "SELECT * FROM " + GiocoModelDM.TABLE_NAME + " WHERE CODE = ?";
		return bean;
	}

	@Override
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + GiocoModelDM.TABLE_NAME + " WHERE CODE = ?";
		return true;
	}

	@Override
	public synchronized Collection<GiocoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<GiocoBean> products = new LinkedList<GiocoBean>();

		String selectSQL = "SELECT * FROM " + GiocoModelDM.TABLE_NAME;
		return products;
	}

}
