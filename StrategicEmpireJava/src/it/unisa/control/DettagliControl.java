package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.AccessorioModelDM;
import it.unisa.EspansioneModelDM;
import it.unisa.GiocoModelDM;
import it.unisa.model.AccessorioModel;
import it.unisa.model.EspansioneModel;
import it.unisa.model.GiocoModel;


/**
 * Servlet implementation class GiocoControl
 */
@WebServlet("/DettagliControl")
public class DettagliControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static GiocoModel model;
	static AccessorioModel model2;
	static EspansioneModel model3;
	
	static {
			model = new GiocoModelDM();
			model2 = new AccessorioModelDM();
			model3 = new EspansioneModelDM();
	}
	
	public DettagliControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        Integer DES_VER = Integer.parseInt(request.getParameter("DES"));

		try {
			if(DES_VER == 1) {
				String codiceGioco = (String) request.getParameter("cod_gioco");
				GiocoBean gioco = model.doRetrieveByKey(codiceGioco);
				request.setAttribute("cod_gioco",gioco);
			}
			if(DES_VER == 2) {
				String codiceAccessorio = (String) request.getParameter("cod_accessorio");
				AccessorioBean accessorio = model2.doRetrieveByKey(codiceAccessorio);
				request.setAttribute("cod_accessorio",accessorio);
			}
			if(DES_VER == 3) {
				String codiceEspansione = (String) request.getParameter("cod_espansione");
				espansioneBean espansione = model3.doRetrieveByKey(codiceEspansione);
				request.setAttribute("cod_espansione",espansione);
			}
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Dettagli.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
