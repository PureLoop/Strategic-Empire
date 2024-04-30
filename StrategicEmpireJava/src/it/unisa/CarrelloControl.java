package it.unisa;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
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
        String action = request.getParameter("action");

        // Ottieni la sessione corrente
        HttpSession session = request.getSession();

        // Recupera o crea la lista dei giochi nel carrello dalla sessione
        List<GiocoBean> listaGiochiCarrello = (List<GiocoBean>) session.getAttribute("listaGiochiCarrello");
        if (listaGiochiCarrello == null) {
            listaGiochiCarrello = new ArrayList<>();
        }

        try {
            if (action != null && action.equals("delete")) {
                // Se l'azione è "delete", elimina il gioco con il codice specificato dalla lista
                for (Iterator<GiocoBean> iterator = listaGiochiCarrello.iterator(); iterator.hasNext();) {
                    GiocoBean gioco = iterator.next();
                    if (gioco.getCod_Gioco().equals(codiceGioco)) {
                        iterator.remove();
                        break; // Esci dopo aver rimosso il gioco
                    }
                }
            } else {
                // Altrimenti, aggiungi il gioco alla lista del carrello
                GiocoBean gioco = model.doRetrieveByKey(codiceGioco);
                listaGiochiCarrello.add(gioco);
            }

            // Aggiorna la lista dei giochi nel carrello nella sessione
            session.setAttribute("listaGiochiCarrello", listaGiochiCarrello);
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        if(action=="delete") {
            response.sendRedirect(request.getContextPath() + "/Carrello.jsp");
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
