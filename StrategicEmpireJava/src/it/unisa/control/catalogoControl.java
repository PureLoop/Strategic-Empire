package it.unisa.control;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
		String username = request.getParameter("username");

		
		request.setAttribute("pageType", "catalogo");
		if (action != null && action.equalsIgnoreCase("ShowGioco")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            try {
                Collection<GiocoBean> giochi = modelGioco.doRetrieveAll(sort);
             	System.out.println("2"+giochi.isEmpty());

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
        else if (action != null && action.equalsIgnoreCase("ShowPreferiti")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            try {
                Collection<GiocoBean> giochi = modelGioco.doRetrieveAll(action);
                Collection<GiocoBean> giochi2 = new ArrayList<>(); // Inizializzazione corretta
                Collection<AccessorioBean>accessori = modelAcc.doRetrieveAll(action);
                Collection<AccessorioBean> accessori2 = new ArrayList<>(); // Inizializzazione corretta
                Collection<espansioneBean>espansioni = modelEsp.doRetrieveAll(action);
                Collection<espansioneBean> espansioni2 = new ArrayList<>(); // Inizializzazione corretta




                for (GiocoBean gioco : giochi) {
                    if (modelGioco.ControllaPreferito(gioco.getCod_Gioco(), username)) {
                        giochi2.add(gioco);
                    }
                }
                for (AccessorioBean accessorio : accessori) {
                    if (modelAcc.ControllaPreferito(accessorio.getCod_Accessorio(), username)) {
                        accessori2.add(accessorio);
                    }
                }
                for (espansioneBean espansione : espansioni) {
                    if (modelEsp.ControllaPreferito(espansione.getCod_espansione(), username)) {
                        espansioni2.add(espansione);
                    }
                }
                
                request.setAttribute("giochiPreferiti", giochi2);
                request.setAttribute("accessoriPreferiti", accessori2);
                request.setAttribute("espansioneiPreferiti", espansioni2);


                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showPreferiti.jsp");
                    dispatcher.include(request, response);
                } else {
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/catalogo.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
		if (action != null && action.equalsIgnoreCase("search")) {
			String searchQuery = "%" + request.getParameter("searchParam") + "%";
			String searchType = request.getParameter("searchType");
;			if(searchType != null && searchType.equalsIgnoreCase("gioco")) {
	        Collection<GiocoBean> searchResults = null;

	        try {
	            // Call your search method passing the searchQuery
	            searchResults = modelGioco.searchGioco(searchQuery);
	            
	            // Prepare HTML response for AJAX
	            response.setContentType("text/html");
	            request.setAttribute("prodotti", searchResults);
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showGioco.jsp");
	            dispatcher.include(request, response);
	        } catch (SQLException e) {
	            System.out.println("Error:" + e.getMessage());
	            // Handle error response if necessary
	        }
	    }else if(searchType != null && searchType.equalsIgnoreCase("accessorio")) {
	    	Collection<AccessorioBean> searchResults = null;

	        try {
	            // Call your search method passing the searchQuery
	            searchResults = modelAcc.searchAccessorio(searchQuery);
	            // Prepare HTML response for AJAX
	            response.setContentType("text/html");
	            request.setAttribute("prodotti", searchResults);
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showAccessorio.jsp");
	            dispatcher.include(request, response);
	        } catch (SQLException e) {
	            System.out.println("Error:" + e.getMessage());
	            // Handle error response if necessary
	        }
	    }else if(searchType != null && searchType.equalsIgnoreCase("espansione")) {
	    	Collection<espansioneBean> searchResults = null;

	        try {
	            // Call your search method passing the searchQuery
	            searchResults = modelEsp.searchEspansione(searchQuery);
	            // Prepare HTML response for AJAX
	            response.setContentType("text/html");
	            request.setAttribute("prodotti", searchResults);
	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showEspansione.jsp");
	            dispatcher.include(request, response);
	        } catch (SQLException e) {
	            System.out.println("Error:" + e.getMessage());
	            // Handle error response if necessary
	        }
	    }
	}
		
		if (action != null && action.equalsIgnoreCase("filter")) {
			String tipologia = request.getParameter("tipologia");
		    double prezzo;
		    int N_giocatori_min;
		    

		    // Controllo se i parametri prezzo e N_giocatori sono vuoti
		    if (request.getParameter("prezzo") == null || request.getParameter("prezzo").isEmpty()) {

		        prezzo = 0;
		    } else {
		        prezzo = Double.parseDouble(request.getParameter("prezzo"));
		    }
		    
		    if (request.getParameter("N_giocatori") == null || request.getParameter("N_giocatori").isEmpty()) {
		        N_giocatori_min = 0;
		    } else {
		        N_giocatori_min = Integer.parseInt(request.getParameter("N_giocatori"));
		    }
		    
		    System.out.println(request.getParameter("searchType"));
		
		    if(request.getParameter("searchType").equalsIgnoreCase("gioco")) {
		    	try { 
			        Collection<GiocoBean> giochiFiltrati = modelGioco.doRetrieveByFilter(tipologia, prezzo, N_giocatori_min);
			        request.setAttribute("prodotti", giochiFiltrati); 
			        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showGioco.jsp");
		            dispatcher.include(request, response);
			    } catch (SQLException e) {
			    	e.printStackTrace();
			    }
		    }else if(request.getParameter("searchType").equalsIgnoreCase("accessorio")) {
		    	try { 
			        Collection<AccessorioBean> accessoriFiltrati = modelAcc.doRetrieveByFilter(tipologia.toLowerCase(), prezzo);
			        request.setAttribute("prodotti", accessoriFiltrati); 
			        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showAccessorio.jsp");
		            dispatcher.include(request, response);
			    } catch (SQLException e) {
			    	e.printStackTrace();
			    }
		    }else if(request.getParameter("searchType").equalsIgnoreCase("espansione")) {
		    	try { 
			        Collection<espansioneBean> espansioniFiltrate = modelEsp.doRetrieveByFilter(prezzo);
			        request.setAttribute("prodotti", espansioniFiltrate); 
			        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showEspansione.jsp");
		            dispatcher.include(request, response);
			    } catch (SQLException e) {
			    	e.printStackTrace();
			    }
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
