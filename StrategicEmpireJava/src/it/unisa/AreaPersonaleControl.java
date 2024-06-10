package it.unisa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AreaPersonaleControl
 */
@WebServlet("/AreaPersonaleControl")
public class AreaPersonaleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static GiocoModel modelGioco;
	static AccessorioModel modelAcc;
	static EspansioneModel modelEsp;
	static AreaPersonaleModel modelAp;
	
	static {
			modelGioco = new GiocoModelDM();
			modelAcc = new AccessorioModelDM();
			modelEsp = new EspansioneModelDM();
			modelAp = new AreaPersonaleModelDM();
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AreaPersonaleControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sort = request.getParameter("sort");
        String action = request.getParameter("action");
        String insType = request.getParameter("type");
        		

        if (action != null && action.equalsIgnoreCase("ShowGioco")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            try {
                Collection<GiocoBean> giochi = modelGioco.doRetrieveAll(sort);
                System.out.println("giochi esptratti: " +giochi.size());
                request.setAttribute("prodottiAP", giochi);

                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<div class=\"row\" id=\"allGames\" style=\"margin-left: 3%; margin-right:3%;margin-top:2%;\">");

                    if (giochi != null && !giochi.isEmpty()) {
                        for (GiocoBean bean : giochi) {
                            out.println("<div class=\"col-sm-3 mb-3\" style=\"width: 25%;\">");
                            out.println("<div class=\"card\">");
                            out.println("<div class=\"card-body\">");
                            out.println("<img src=\"" + bean.getImmagineCop() + "\" class=\"card-img-top\">");
                            out.println("<h5 class=\"card-title\">" + bean.getNomegioco() + "</h5>");
                            out.println("<p class=\"card-text\">Prezzo: " + bean.getPrezzo() + "</p>");
                            out.println("<button class=\"edit-Game-button\" data-game-id=\"" + bean.getCod_Gioco() + "\">Modifica</button>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                        }
                    } 
                    out.println("</div>");
                } else {
                    request.removeAttribute("prodottiAP");
                    request.setAttribute("prodottiAP", giochi);
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
                request.setAttribute("prodottiAP", accessori);

                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<div class=\"row\" id=\"allGames\" style=\"margin-left: 3%; margin-right:3%;margin-top:2%;\">");

                    if (accessori != null && !accessori.isEmpty()) {
                        for (AccessorioBean bean : accessori) {
                            out.println("<div class=\"col-sm-3 mb-3\" style=\"width: 25%;\">");
                            out.println("<div class=\"card\">");
                            out.println("<div class=\"card-body\">");
                            out.println("<img src=\"" + bean.getImmagineCop() + "\" class=\"card-img-top\">");
                            out.println("<h5 class=\"card-title\">" + bean.getNomeaccessorio() + "</h5>");
                            out.println("<p class=\"card-text\">Prezzo: " + bean.getPrezzo() + "</p>");
                            out.println("<button class=\"edit-Acc-button\" data-acc-id=\"" + bean.getCod_Accessorio() + "\">Modifica</button>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                        }
                    } 
                    out.println("</div>");
                } else {
                    request.removeAttribute("prodottiAP");
                    request.setAttribute("prodottiAP", accessori);
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
                 request.setAttribute("prodottiAP", espansioni);

                 if (isAjaxRequest) {
                     response.setContentType("text/html");
                     PrintWriter out = response.getWriter();
                     out.println("<div class=\"row\" id=\"allGames\" style=\"margin-left: 3%; margin-right:3%;margin-top:2%;\">");

                     if (espansioni != null && !espansioni.isEmpty()) {
                         for (espansioneBean bean : espansioni) {
                             out.println("<div class=\"col-sm-3 mb-3\" style=\"width: 25%;\">");
                             out.println("<div class=\"card\">");
                             out.println("<div class=\"card-body\">");
                             out.println("<img src=\"" + bean.getImmagineCop() + "\" class=\"card-img-top\">");
                             out.println("<h5 class=\"card-title\">" + bean.getNomeespansione() + "</h5>");
                             out.println("<p class=\"card-text\">Prezzo: " + bean.getPrezzo() + "</p>");
                             out.println("<button class=\"edit-Esp-button\" data-esp-id=\"" + bean.getCod_espansione() + "\">Modifica</button>");
                             out.println("</div>");
                             out.println("</div>");
                             out.println("</div>");
                         }
                     } 
                     out.println("</div>");
                 } else {
                     request.removeAttribute("prodottiAP");
                     request.setAttribute("prodottiAP", espansioni);
                     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
                     dispatcher.forward(request, response);
                 }
             } catch (SQLException e) {
                 System.out.println("Error:" + e.getMessage());
             }
             }
        
        if(action!=null && action.equalsIgnoreCase("showInsForm")) {
    	    String insForm = "<form id='insertForm' action='insertProduct' method='POST'>" +
    	                        "<input type='text' name='codice' value='' placeholder='codice'><br>" +
    	                        "<input type='text' name='nome' value='' placeholder='nome'><br>" +
    	                        "<input type='number' step='0.01' name='prezzo' value='' placeholder='prezzo'><br>";

        	if(insType!=null && insType.equalsIgnoreCase("gioco")){
        		    	insForm = insForm + "<input type='text' name='edizione' value='' placeholder='edizione'><br>" +
        		    	"<input type='hidden' name='prodType' value='gioco'><br>"+
                        "<input type='text' name='tipologia' value='' placeholder='tipologia'><br>" +
                        "<input type='number' name='min_gio' value='' placeholder='min-giocatori'><br>" +
                        "<input type='number' name='max_gio' value='' placeholder='max-giocatori'><br>";
        	}
        	
        	if(insType!=null && insType.equalsIgnoreCase("accessorio")){
        		insForm = insForm + "<input type='text' name='tipologia' value='' placeholder='tipologia'><br>"+
        				"<input type='hidden' name='prodType' value='accessorio'><br>";
        	}
        	
        	if(insType!=null && insType.equalsIgnoreCase("espansione")){
        		insForm = insForm + "<input type='text' name='codGioco' value='' placeholder='cod_gioco'><br>"+
        				"<input type='hidden' name='prodType' value='espansione'><br>";
        	}
        	insForm += "<textarea rows='7' cols='100' name='descrizione' placeholder='descrizione'></textarea><br>" +
            "<input type='button' onclick='submitInsForm()' value='Invia'>" +
            "</form>";
        	response.setContentType("text/html");
    	    response.getWriter().write(insForm);
        }
        
        
        
        
        if (action != null && action.equalsIgnoreCase("GameModifyForm")) {
            	    String gameId = request.getParameter("gameId");
            	    try {
						GiocoBean bean = modelGioco.doRetrieveByKey(gameId);
            	    // Creare il form di modifica per il gioco specifico
            	    String modifyForm = "<form id='ModifyGameForm' action='updateGame' method='POST'>" +
            	                        "<input type='hidden' name='gameId' value='" + gameId + "'><br>" +
            	                        "<input type='text' name='codice' value='"+bean.getCod_Gioco()+"'><br>" +
            	                        "<input type='text' name='nome' value='"+bean.getNomegioco()+"'><br>" +
            	                        "<input type='number' step='0.01' name='prezzo' value='"+bean.getPrezzo()+"'><br>" +
            	                        "<input type='text' name='edizione' value='"+bean.getEdizione()+"'><br>" +
            	                        "<input type='text' name='tipologia' value='"+bean.getTipologia()+"'><br>" +
            	                        "<input type='number' name='min_gio' value='"+bean.getN_giocatori_min()+"'><br>" +
            	                        "<input type='number' name='max_gio' value='"+bean.getN_giocatori_max()+"'><br>" +
            	                        "<textarea rows='7' cols='100' name='descrizione'>"+bean.getDescrizione()+"</textarea><br>" +
            	                        "<input type='button' onclick='submitGameForm()' value='Invia'>" +
            	                        "</form>";
            	    response.setContentType("text/html");
            	    response.getWriter().write(modifyForm);
            	}
         catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
      }
        
        if (action != null && action.equalsIgnoreCase("AccModifyForm")) {
    	    String accId = request.getParameter("accId");
    	    try {
				AccessorioBean bean = modelAcc.doRetrieveByKey(accId);
    	    // Creare il form di modifica per il gioco specifico
    	    String modifyForm = "<form id='ModifyAccForm' action='updateAccessorio' method='POST'>" +
    	                        "<input type='hidden' name='accId' value='" + accId + "'><br>" +
    	                        "<input type='text' name='codice' value='"+bean.getCod_Accessorio()+"'><br>" +
    	                        "<input type='text' name='nome' value='"+bean.getNomeaccessorio()+"'><br>" +
    	                        "<input type='number' step='0.01' name='prezzo' value='"+bean.getPrezzo()+"'><br>" +
    	                        "<input type='text' name='tipologia' value='"+bean.getTipologia()+"'><br>" +
    	                        "<textarea rows='7' cols='100' name='descrizione'>"+bean.getDescrizione()+"</textarea><br>" +
    	                        "<input type='button' onclick='submitAccForm()' value='Invia'>" +
    	                        "</form>";
    	    response.setContentType("text/html");
    	    response.getWriter().write(modifyForm);
    	}
 catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
}
        
        if (action != null && action.equalsIgnoreCase("EspModifyForm")) {
    	    String espId = request.getParameter("espId");
    	    try {
				espansioneBean bean = modelEsp.doRetrieveByKey(espId);
    	    // Creare il form di modifica per il gioco specifico
    	    String modifyForm = "<form id='ModifyEspForm' action='updateEspansione' method='POST'>" +
    	                        "<input type='hidden' name='espId' value='" + espId + "'><br>" +
    	                        "<input type='text' name='codice' value='"+bean.getCod_espansione()+"'><br>" +
    	                        "<input type='text' name='nome' value='"+bean.getNomeespansione()+"'><br>" +
    	                        "<input type='number' step='0.01' name='prezzo' value='"+bean.getPrezzo()+"'><br>" +
    	                        "<textarea rows='7' cols='100' name='descrizione'>"+bean.getDescrizione()+"</textarea><br>" +
    	                        "<input type='button' onclick='submitEspForm()' value='Invia'>" +
    	                        "</form>";
    	    response.setContentType("text/html");
    	    response.getWriter().write(modifyForm);
    	}
 catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
 }}

        if (action != null && action.equalsIgnoreCase("updateGame")) {
    	    String gameId = request.getParameter("gameId");
            String nome = request.getParameter("nome");
            double prezzo = Double.parseDouble(request.getParameter("prezzo"));
            String edizione = request.getParameter("edizione");
            String tipologia = request.getParameter("tipologia");
            int min_gio = Integer.parseInt(request.getParameter("min_gio"));
            int max_gio = Integer.parseInt(request.getParameter("max_gio"));
            String descrizione = request.getParameter("descrizione");

            GiocoBean bean = new GiocoBean();
            bean.setCod_gioco(gameId);;
            bean.setNomegioco(nome);
            bean.setPrezzo(prezzo);
            bean.setEdizione(edizione);
            bean.setTipologia(tipologia);
            bean.setN_giocatori_min(min_gio);
            bean.setN_giocatori_max(max_gio);
            bean.setDescrizione(descrizione);

            try {
                modelAp.updateGame(bean);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (SQLException e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
		}
    
    
    if (action != null && action.equalsIgnoreCase("updateAccessorio")) {
	    String accId = request.getParameter("accId");
        String nome = request.getParameter("nome");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        String tipologia = request.getParameter("tipologia");
        String descrizione = request.getParameter("descrizione");

        AccessorioBean bean = new AccessorioBean();
        bean.setCod_accessorio(accId);;
        bean.setNomeaccessorio(nome);
        bean.setPrezzo(prezzo);
        bean.setTipologia(tipologia);
        bean.setDescrizione(descrizione);

        try {
            modelAp.updateAccessorio(bean);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
	}
    
    if (action != null && action.equalsIgnoreCase("updateEspansione")) {
	    String espId = request.getParameter("espId");
        String nome = request.getParameter("nome");
        double prezzo = Double.parseDouble(request.getParameter("prezzo"));
        String descrizione = request.getParameter("descrizione");

        System.out.println(espId);
        espansioneBean bean = new espansioneBean();
        bean.setCod_espansione(espId);;
        bean.setNomeespansione(nome);
        bean.setPrezzo(prezzo);
        bean.setDescrizione(descrizione);

        try {
            modelAp.updateEspansione(bean);
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        	}
    	}
    
    	if(action!=null && action.equalsIgnoreCase("insertDB")) {
    		String prodType = request.getParameter("prodType");
    		String nome = request.getParameter("nome");
            double prezzo = Double.parseDouble(request.getParameter("prezzo"));
            String descrizione = request.getParameter("descrizione");
            String codice = request.getParameter("codice");
            if(prodType.equals("gioco")) {
            	String edizione = request.getParameter("edizione");
                String tipologia = request.getParameter("tipologia");
                int min_gio = Integer.parseInt(request.getParameter("min_gio"));
                int max_gio = Integer.parseInt(request.getParameter("max_gio"));
            	
    			GiocoBean bean = new GiocoBean();
    			bean.setCod_gioco(codice);;
                bean.setNomegioco(nome);
                bean.setPrezzo(prezzo);
                bean.setEdizione(edizione);
                bean.setTipologia(tipologia);
                bean.setN_giocatori_min(min_gio);
                bean.setN_giocatori_max(max_gio);
                bean.setDescrizione(descrizione);
                
                try {
                    modelAp.insertProd(bean);
                    response.setStatus(HttpServletResponse.SC_OK);
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                	}
    		}else if(prodType.equals("accessorio")) {
    			System.out.println("fff");
                String tipologia = request.getParameter("tipologia");
    			
    			AccessorioBean bean = new AccessorioBean();
    			bean.setCod_accessorio(codice);;
    	        bean.setNomeaccessorio(nome);
    	        bean.setPrezzo(prezzo);
    	        bean.setTipologia(tipologia);
    	        bean.setDescrizione(descrizione);
    	        try {
    	            modelAp.insertProd(bean);
    	            response.setStatus(HttpServletResponse.SC_OK);
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    	        	}
    		}else if(prodType.equals("espansione")) {
    			espansioneBean bean= new espansioneBean();
    			String idGame = request.getParameter("codGioco");
    			
    			bean.setCod_espansione(codice);;
    	        bean.setNomeespansione(nome);
    	        bean.setPrezzo(prezzo);
    	        bean.setDescrizione(descrizione);
    	        bean.setCod_gioco(idGame);
    	        
    	        try {
    	            modelAp.insertProd(bean);
    	            response.setStatus(HttpServletResponse.SC_OK);
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
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
