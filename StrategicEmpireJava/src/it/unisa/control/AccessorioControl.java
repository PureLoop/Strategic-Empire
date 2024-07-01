package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.bean.AccessorioBean;
import it.unisa.model.AccessorioModelDM;
import it.unisa.model.AccessorioModel;

public class AccessorioControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    static AccessorioModel model;

    static {
        model = new AccessorioModelDM();
    }

    public AccessorioControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if (action != null) {
                if (action.equalsIgnoreCase("read")) {
                    String id = request.getParameter("cod_accessorio");
                    request.removeAttribute("accessorio");
                    request.setAttribute("accessorio", model.doRetrieveByKey(id));
                } else if (action.equalsIgnoreCase("delete")) {
                    String id = request.getParameter("cod_accessorio");
                    System.out.println("Deleting accessory with code: " + id);
                    model.deleteAcc(id);
                } else if (action.equalsIgnoreCase("insert")) {
                    String cod = request.getParameter("Codice");
                    String nome = request.getParameter("Nome");
                    String tipologia = request.getParameter("Tipologia");
                    String descrizione = request.getParameter("Descrizione");
                    Double prezzo = Double.parseDouble(request.getParameter("Prezzo"));

                    AccessorioBean bean = new AccessorioBean();
                    bean.setCod_accessorio(cod);
                    bean.setNomeaccessorio(nome);
                    bean.setTipologia(tipologia);
                    bean.setPrezzo(prezzo);
                    bean.setDescrizione(descrizione);
                    model.insertProd(bean);
                } else if (action.equalsIgnoreCase("filter")) {
                    String tipologia = request.getParameter("tipologia");
                    double prezzo;
                    boolean check_prezzo = false;

                    // Controllo se il parametro prezzo è vuoto
                    if (request.getParameter("prezzo") == null || request.getParameter("prezzo").isEmpty()) {
                        prezzo = 0;
                    } else {
                        prezzo = Double.parseDouble(request.getParameter("prezzo"));
                        check_prezzo = true;
                    }

                    try {
                        Collection<AccessorioBean> accessoriFiltrati = model.doRetrieveByFilter(tipologia, prezzo, check_prezzo);
                        request.setAttribute("accessoriFiltrati", accessoriFiltrati);
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
            request.removeAttribute("accessori");
            request.setAttribute("accessori", model.doRetrieveAll(sort));
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AccessorioView.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
