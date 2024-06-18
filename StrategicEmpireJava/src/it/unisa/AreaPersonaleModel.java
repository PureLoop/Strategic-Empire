package it.unisa;

import java.sql.SQLException;

public interface AreaPersonaleModel {
	void updateGame(GiocoBean gioco) throws SQLException;
	void updateEspansione(espansioneBean espansione) throws SQLException;
	void updateAccessorio(AccessorioBean accessorio) throws SQLException;
	void insertProd(GiocoBean gioco) throws SQLException;
	void insertProd(AccessorioBean accessorio) throws SQLException;
	void insertProd(espansioneBean espansione) throws SQLException;
	void insertImgAcc(AccessorioBean accessorio) throws SQLException;
	void insertImgGioco(GiocoBean gioco) throws SQLException;
	void insertImgEsp(espansioneBean espansione) throws SQLException;
	void deleteAcc(String codAcc) throws SQLException;
	void deleteEsp(String codEsp) throws SQLException;
	void deleteGioco(String codGioco) throws SQLException;
}
