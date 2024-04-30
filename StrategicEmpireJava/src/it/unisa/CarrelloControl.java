package it.unisa;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CarrelloControl
 */
@WebServlet("/CarrelloControl")
public class CarrelloControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
static GiocoModel model;
	
	static {
			model = new GiocoModelDM();
	}
    public CarrelloControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera il codice del gioco dalla richiesta
        String codiceGioco = request.getParameter("cod_gioco");
        
        // Ottieni la sessione corrente
        HttpSession session = request.getSession();
        
        // Recupera o crea la lista dei giochi nel carrello dalla sessione
        List<GiocoBean> listaGiochiCarrello = (List<GiocoBean>) session.getAttribute("listaGiochiCarrello");
        if (listaGiochiCarrello == null) {
            listaGiochiCarrello = new ArrayList<>();
        }
        
        try {
            // Recupera il gioco dal database utilizzando il codice del gioco
            GiocoBean gioco = model.doRetrieveByKey(codiceGioco);
            
            // Aggiungi il gioco alla lista del carrello
            listaGiochiCarrello.add(gioco);
            
            // Aggiorna la lista dei giochi nel carrello nella sessione
            session.setAttribute("listaGiochiCarrello", listaGiochiCarrello);
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }
        
        // Reindirizza alla pagina "Carrello.jsp"
        response.sendRedirect(request.getContextPath() + "/GiocoView.jsp");
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
