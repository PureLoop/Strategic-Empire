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

import it.unisa.bean.ScontoBean;
import it.unisa.model.ScontoModel;
import it.unisa.model.ScontoModelDM;

/**
 * Servlet implementation class ScontoControl
 */
@WebServlet("/ScontoControl")
public class ScontoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       static ScontoModel modelSconto;
       static {
    	   modelSconto = new ScontoModelDM();
       }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScontoControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action != null && action.equalsIgnoreCase("verificaSconto")) {
            String nome_sconto = request.getParameter("codSconto");
            
            try {
                int percentuale = modelSconto.verificaSconto(nome_sconto);
                HttpSession session = request.getSession();
                session.setAttribute("nomeScontoApplicato", nome_sconto);
                // Invia la percentuale di sconto come risposta
                response.getWriter().write(String.valueOf(percentuale));
                
            } catch (SQLException e) {
                e.printStackTrace();
                // Gestisci l'eccezione come necessario
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }else if(action!= null && action.equalsIgnoreCase("salvaSconto")) {
        	String percStr = request.getParameter("discountPercentage");
        	String nomeSconto = request.getParameter("discountName");
        	int perc = Integer.parseInt(percStr);
        	
        	try {
				modelSconto.insertSconto(nomeSconto, perc);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }else if(action != null && action.equalsIgnoreCase("showSconto")) {
            try {
                Collection<ScontoBean> sconti = modelSconto.retrieveAll();
                request.setAttribute("sconti", sconti);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/fragments/discountList.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else if(action != null && action.equalsIgnoreCase("deleteSconto")) {
        	String nomeSconto = request.getParameter("nomeSconto");
            try {
                modelSconto.deleteSconto(nomeSconto);
                // Puoi aggiungere una risposta JSON se necessario
            } catch (SQLException e) {
                e.printStackTrace();
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
