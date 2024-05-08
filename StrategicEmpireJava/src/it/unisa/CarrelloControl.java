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

    static GiocoModel model;

    static {
        model = new GiocoModelDM();
    }

    public CarrelloControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recupera il codice del gioco dalla richiesta
        String codiceGioco = request.getParameter("cod_gioco");
        String action = request.getParameter("action");

        // Ottieni la sessione corrente
        HttpSession session = request.getSession();

        // Recupera la lista degli oggetti nel carrello dalla sessione
        List<OggettiCarrelloBean> oggettiCarrello = (List<OggettiCarrelloBean>) session.getAttribute("oggettiCarrello");

        if (oggettiCarrello == null) {
            oggettiCarrello = new ArrayList<>();
        }

        try {
            if ("delete".equals(action)) {
                // Se l'azione è "delete", elimina l'oggetto con il codice specificato dalla lista
                for (Iterator<OggettiCarrelloBean> iterator = oggettiCarrello.iterator(); iterator.hasNext();) {
                    OggettiCarrelloBean oggetto = iterator.next();
                    if (oggetto.getCod_articolo().equals(codiceGioco)) {
                        iterator.remove();
                        break; // Esci dopo aver rimosso l'oggetto
                    }
                }
            } else {
                // Altrimenti, aggiungi o incrementa la quantità dell'oggetto nel carrello
                GiocoBean gioco = model.doRetrieveByKey(codiceGioco);
                boolean trovato = false;
                for (OggettiCarrelloBean oggetto : oggettiCarrello) {
                    if (oggetto.getCod_articolo().equals(codiceGioco)) {
                        int quant = oggetto.getQuantita();
                        oggetto.setQuantita(quant + 1);
                        trovato = true;
                        break;
                    }
                }
                if (!trovato) {
                    OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                    oggettoCarrello.setCod_articolo(gioco.getCod_Gioco());
                    oggettoCarrello.setImmagineCopertina(gioco.getImmagineCop());
                    oggettoCarrello.setNome_articolo(gioco.getNomegioco());
                    oggettoCarrello.setPrezzo(gioco.getPrezzo());
                    oggettoCarrello.setQuantita(1);
                    oggettiCarrello.add(oggettoCarrello);
                }
            }

            // Aggiorna la lista degli oggetti nel carrello nella sessione
            session.setAttribute("oggettiCarrello", oggettiCarrello);
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }
        if ("delete".equals(action)) {
            response.sendRedirect(request.getContextPath() + "/Carrello.jsp");
            return; // Esci dopo aver reindirizzato
        } else {
            // Reindirizza alla pagina "GiocoView.jsp"
            response.sendRedirect(request.getContextPath() + "/GiocoView.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
