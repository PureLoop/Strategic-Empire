package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.unisa.bean.AccessorioBean;
import it.unisa.bean.GiocoBean;
import it.unisa.bean.OggettiCarrelloBean;
import it.unisa.bean.espansioneBean;
import it.unisa.model.AccessorioModelDM;
import it.unisa.model.EspansioneModel;
import it.unisa.model.EspansioneModelDM;
import it.unisa.model.GiocoModelDM;
import it.unisa.model.AccessorioModel;
import it.unisa.model.EspansioneModel;
import it.unisa.model.GiocoModel;

@WebServlet("/CarrelloControl")
public class CarrelloControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static GiocoModel model;
    static EspansioneModel model2;
    static AccessorioModel model3;

    static {
        model = new GiocoModelDM();
        model2 = new EspansioneModelDM();
        model3 = new AccessorioModelDM();
    }

    public CarrelloControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codiceGioco = request.getParameter("cod_gioco");
        String codiceEspansione = request.getParameter("cod_espansione");
        String codiceAccessorio = request.getParameter("cod_accessorio");

        String action = request.getParameter("action");

        HttpSession session = request.getSession();
        List<OggettiCarrelloBean> oggettiCarrello = (List<OggettiCarrelloBean>) session.getAttribute("oggettiCarrello");

        if (oggettiCarrello == null) {
            oggettiCarrello = new ArrayList<>();
        }

        try {
            if ("delete".equals(action)) {
                for (Iterator<OggettiCarrelloBean> iterator = oggettiCarrello.iterator(); iterator.hasNext();) {
                    OggettiCarrelloBean oggetto = iterator.next();
                    if (oggetto.getCod_articolo().equals(codiceGioco)) {
                        iterator.remove();
                        break;
                    }
                }
            } else if ("AddGioco".equals(action)) {

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
            } else if ("AddAccessorio".equals(action)) {
                AccessorioBean accessorio = model3.doRetrieveByKey(codiceAccessorio);
                boolean trovato = false;
                for (OggettiCarrelloBean oggetto : oggettiCarrello) {
                    if (oggetto.getCod_articolo().equals(codiceAccessorio)) {
                        int quant = oggetto.getQuantita();
                        oggetto.setQuantita(quant + 1);
                        trovato = true;
                        break;
                    }
                }
                if (!trovato) {
                    OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                    oggettoCarrello.setCod_articolo(accessorio.getCod_Accessorio());
                    oggettoCarrello.setImmagineCopertina(accessorio.getImmagineCop());
                    oggettoCarrello.setNome_articolo(accessorio.getNomeaccessorio());
                    oggettoCarrello.setPrezzo(accessorio.getPrezzo());
                    oggettoCarrello.setQuantita(1);
                    System.out.println(oggettoCarrello.getCod_articolo());
                    oggettiCarrello.add(oggettoCarrello);
                }
            } else if ("AddEspansione".equals(action)) {
                espansioneBean espansione = model2.doRetrieveByKey(codiceEspansione);
                boolean trovato = false;
                for (OggettiCarrelloBean oggetto : oggettiCarrello) {
                    if (oggetto.getCod_articolo().equals(codiceEspansione)) {
                        int quant = oggetto.getQuantita();
                        oggetto.setQuantita(quant + 1);
                        trovato = true;
                        break;
                    }
                }
                if (!trovato) {
                    OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                    oggettoCarrello.setCod_articolo(espansione.getCod_espansione());
                    oggettoCarrello.setImmagineCopertina(espansione.getImmagineCop());
                    oggettoCarrello.setNome_articolo(espansione.getNomeespansione());
                    oggettoCarrello.setPrezzo(espansione.getPrezzo());
                    oggettoCarrello.setQuantita(1);
                    oggettiCarrello.add(oggettoCarrello);
                }
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true}");
            session.setAttribute("oggettiCarrello", oggettiCarrello);
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        if ("delete".equals(action)) {
            response.sendRedirect(request.getContextPath() + "/Carrello.jsp");
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/GiocoView.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
