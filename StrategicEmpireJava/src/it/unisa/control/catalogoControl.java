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

import it.unisa.bean.AccessorioBean;
import it.unisa.bean.GiocoBean;
import it.unisa.bean.espansioneBean;
import it.unisa.model.AccessorioModel;
import it.unisa.model.AccessorioModelDM;
import it.unisa.model.AreaPersonaleModelDM;
import it.unisa.model.CartaModelDM;
import it.unisa.model.EspansioneModel;
import it.unisa.model.EspansioneModelDM;
import it.unisa.model.GiocoModel;
import it.unisa.model.GiocoModelDM;
import it.unisa.model.UserDAO;

/**
 * Servlet implementation class catalogoControl
 */
@WebServlet("/catalogoControl")
public class catalogoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static GiocoModel modelGioco;
	static AccessorioModel modelAcc;
	static EspansioneModel modelEsp;
	
	static {
		modelGioco = new GiocoModelDM();
		modelAcc = new AccessorioModelDM();
		modelEsp = new EspansioneModelDM();
}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public catalogoControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String sort = request.getParameter("sort");
		request.setAttribute("pageType", "catalogo");
		if (action != null && action.equalsIgnoreCase("ShowGioco")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            try {
                Collection<GiocoBean> giochi = modelGioco.doRetrieveAll(sort);
                request.setAttribute("prodotti", giochi);
                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showGioco.jsp");
                    dispatcher.include(request, response);
                } else {
                    request.removeAttribute("prodotti");
                    request.setAttribute("prodotti", giochi);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                System.out.println("Error:" + e.getMessage());
            }
        }else if (action != null && action.equalsIgnoreCase("ShowAccessorio")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            try {
                Collection<AccessorioBean> accessori = modelAcc.doRetrieveAll(sort);
                request.setAttribute("prodotti", accessori);

                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showAccessorio.jsp");
                    dispatcher.include(request, response);
                } else {
                    request.removeAttribute("prodotti");
                    request.setAttribute("prodotti", accessori);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                System.out.println("Error:" + e.getMessage());
            }
        }else if (action != null && action.equalsIgnoreCase("ShowEspansione")) {
       	 boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

         try {
             Collection<espansioneBean> espansioni = modelEsp.doRetrieveAll(sort);
             request.setAttribute("prodotti", espansioni);

             if (isAjaxRequest) {
                 response.setContentType("text/html");
                 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showEspansione.jsp");
                 dispatcher.include(request, response);
             } else {
                 request.removeAttribute("prodotti");
                 request.setAttribute("prodotti", espansioni);
                 RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
                 dispatcher.forward(request, response);
             }
         } catch (SQLException e) {
             System.out.println("Error:" + e.getMessage());
         }
         }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
