package it.unisa;

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


/**
 * Servlet implementation class GiocoControl
 */
@WebServlet("/DettagliControl")
public class DettagliControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static GiocoModel model;
	
	static {
			model = new GiocoModelDM();
	}
	
	public DettagliControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String codiceGioco = (String) request.getParameter("cod_gioco");
		try {
			GiocoBean gioco = model.doRetrieveByKey(codiceGioco);
			request.setAttribute("cod_gioco",gioco);
			System.out.println(gioco.getNomegioco());
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
