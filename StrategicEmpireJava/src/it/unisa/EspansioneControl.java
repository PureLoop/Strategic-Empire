package it.unisa;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EspansioneControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static EspansioneModel model;

    static {
        model = new EspansioneModelDM();
    }

    public EspansioneControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        int i = 0;
        try {
            if (action != null) {
                if (action.equalsIgnoreCase("read")) {
                    i = 2;
                    String id = request.getParameter("cod_espansione");
                    request.removeAttribute("espansione");
                    request.setAttribute("espansione", model.doRetrieveByKey(id));
                } else if (action.equalsIgnoreCase("delete")) {
                    String id = request.getParameter("cod_espansione");
                    System.out.println("Deleting expansion with code: " + id);
                    model.doDelete(id);
                } else if (action.equalsIgnoreCase("insert")) {
                    String cod_gioco = request.getParameter("cod_gioco");
                    String cod_espansione = request.getParameter("cod_espansione");
                    String nome_espansione = request.getParameter("nome_espansione");
                    String descrizione = request.getParameter("descrizione");
                    Double prezzo = Double.parseDouble(request.getParameter("prezzo"));

                    espansioneBean bean = new espansioneBean();
                    bean.setCod_gioco(cod_gioco);
                    bean.setCod_espansione(cod_espansione);
                    bean.setNomeespansione(nome_espansione);
                    bean.setDescrizione(descrizione);
                    bean.setPrezzo(prezzo);
                    model.doSave(bean);
                } else if (action.equalsIgnoreCase("filter")) {
                    String tipologia = request.getParameter("tipologia");
                    Double prezzo;
                    boolean check_prezzo = false;

                    // Controllo se il parametro prezzo è vuoto
                    if (request.getParameter("prezzo") == null || request.getParameter("prezzo").isEmpty()) {
                        prezzo = 0.0;
                    } else {
                        prezzo = Double.parseDouble(request.getParameter("prezzo"));
                        check_prezzo = true;
                    }

                    try {
                        Collection<espansioneBean> espansioniFiltrate = model.doRetrieveByFilter(tipologia, prezzo, check_prezzo);
                        request.setAttribute("espansioniFiltrate", espansioniFiltrate);
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        String sort = request.getParameter("sort");

        try {
            request.removeAttribute("espansioni");
            request.setAttribute("espansioni", model.doRetrieveAll(sort));
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        RequestDispatcher dispatcher;
        if (i != 2) {
            dispatcher = getServletContext().getRequestDispatcher("/EspansioneView.jsp");
        } else {
            dispatcher = getServletContext().getRequestDispatcher("/DettagliEspansione.jsp");
        }
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
