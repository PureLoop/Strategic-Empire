package it.unisa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.bean.CartaBean;
import it.unisa.model.CartaModelDM;

import javax.servlet.annotation.WebServlet;

@WebServlet("/CartaControl")
public class CartaControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final CartaModel model = new CartaModelDM();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            if (action != null) {
                if (action.equalsIgnoreCase("read")) {
                    boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
                    String username = request.getParameter("username");
                    Collection<CartaBean> carte = (Collection<CartaBean>) model.doRetrieveByKey(username);

                    if (isAjaxRequest) {
                        out.println("<div class=\"row\" id=\"allCard\" style=\"margin-left: 3%; margin-right:3%;margin-top:2%;\">");
                        if (carte != null && !carte.isEmpty()) {
                            for (CartaBean bean : carte) {
                                out.println("<div class=\"col-sm-3 mb-3\" style=\"width: 25%;\">");
                                out.println("<div class=\"card\">");
                                out.println("<div class=\"card-body\">");
                                out.println("<h5 class=\"card-title\">" + bean.getNome() + "</h5>");
                                out.println("<p class=\"card-text\">Prezzo: " + bean.getUsername() + "</p>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</div>");
                            }
                        }
                        out.println("</div>");
                    }
                } else if (action.equalsIgnoreCase("delete")) {
                    String username = request.getParameter("username");
                    model.doDelete(username);
                    out.println("Carta eliminata con successo.");
                } else if (action.equalsIgnoreCase("insert")) {
                    String numero = request.getParameter("numero");
                    int scadenza = Integer.parseInt(request.getParameter("scadenza"));
                    int cvv = Integer.parseInt(request.getParameter("cvv"));
                    String username = request.getParameter("username");
                    String nome = request.getParameter("nome");

                    CartaBean bean = new CartaBean();
                    bean.setNumero(numero);
                    bean.setScadenza(scadenza);
                    bean.setCvv(cvv);
                    bean.setUsername(username);
                    bean.setNome(nome);

                    model.doSave(bean);
                    out.println("Carta inserita con successo.");
                }
            }
        } catch (SQLException e) {
            out.println("Errore: " + e.getMessage());
        } finally {
            out.close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
