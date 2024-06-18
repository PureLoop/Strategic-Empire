package it.unisa;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;
import java.io.File;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AreaPersonaleControl
 */
@WebServlet("/AreaPersonaleControl")
@MultipartConfig()
public class AreaPersonaleControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static CartaModel modelCarta;
	static GiocoModel modelGioco;
	static AccessorioModel modelAcc;
	static EspansioneModel modelEsp;
	static AreaPersonaleModel modelAp;
	
	static {
			modelGioco = new GiocoModelDM();
			modelAcc = new AccessorioModelDM();
			modelEsp = new EspansioneModelDM();
			modelAp = new AreaPersonaleModelDM();
			modelCarta = new CartaModelDM();
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
                            out.println("<button class=\"del-Gioco-button\" data-game-id=\"" + bean.getCod_Gioco() + "\">Elimina</button>");
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
                            out.println("<button class=\"del-Acc-button\" data-acc-id=\"" + bean.getCod_Accessorio() + "\">Elimina</button>");
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
        }else if (action != null && action.equalsIgnoreCase("ShowCards")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
            String username = request.getParameter("username"); // Ottieni il nome utente dal parametro della richiesta


            try {
                Collection<CartaBean> carte = modelCarta.doRetrieveByFilter(username);
                request.setAttribute("prodottiAP", carte);

                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<div class=\"row\" id=\"allCard\" style=\"margin-left: 30%; margin-right:30%;margin-top:2%;\">");
                    if (carte != null && !carte.isEmpty()) {
                        for (CartaBean bean : carte) {
                       	 out.println("<div class=\"col-sm-3 mb-3\" style=\"width: 25%; flex: 1 0 auto;\">");
                            out.println("<div class=\"card\" style=\"border: 1px solid #ccc; border-radius: 5px; box-shadow: 0 2px 50px rgba(0, 0, 0, 0.1); transition: box-shadow 0.3s ease;\">");
                            out.println("<div class=\"card-body\">");
                            out.println("<h5 class=\"card-title\">" + bean.getNome() + "</h5>");
                            out.println("<p class=\"card-text\">Numero: " + bean.getNumero() + "</p>");
                            out.println("<p class=\"card-text\">Scadenza: " + bean.getScadenza() + "</p>");
                            // Aggiungi il pulsante Modifica se necessario
                            // out.println("<button class=\"edit-Card-button\" data-card-id=\"" + bean.getCvv() + "\">Modifica</button>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</div>");
                        }
                    }
                    out.println("</div>");
                } else {
                    request.removeAttribute("prodottiAP");
                    request.setAttribute("prodottiAP", carte);
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
                             out.println("<button class=\"del-Esp-button\" data-esp-id=\"" + bean.getCod_espansione() + "\">Elimina</button>");
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
        if(action!=null && action.equalsIgnoreCase("delAcc")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        	String accId = request.getParameter("accId");
        	try {
        		modelAp.deleteAcc(accId);
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
        
        if(action!=null && action.equalsIgnoreCase("delGioco")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        	String giocoId = request.getParameter("giocoId");
        	try {
        		modelAp.deleteGioco(giocoId);
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
        
        if(action!=null && action.equalsIgnoreCase("delEsp")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        	String espId = request.getParameter("espId");
        	try {
        		modelAp.deleteEsp(espId);
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
        
        if(action!=null && action.equalsIgnoreCase("showInsForm")) {
    	    String insForm = "<form id='insertForm' action='insertProduct' method='POST' enctype='multipart/form-data'>" +
    	                        "<input type='text' name='codice' value='' placeholder='codice'><br>" +
    	                        "<input type='text' name='nome' value='' placeholder='nome'><br>" +
    	                        "<input type='number' step='0.01' name='prezzo' value='' placeholder='prezzo'><br>"+
    	                        "<input type='file' id='imgCopertina' name='imgCopertina' accept='.jpeg, .jpg, .png'><label for='imgCopertina'>COPERTINA</label><br>"+
    	                        "<input type='file' id='img2' name='img2' accept='.jpeg, .jpg, .png'><label for='img2'>SECONDA IMG</label><br>";

        	if(insType!=null && insType.equalsIgnoreCase("gioco")){
        		    	insForm = insForm + "<input type='text' name='edizione' value='' placeholder='edizione'><br>" +
        		    	"<select id='tipologia' name='tipologia'><br>" + 
        				"        <option value='tavolo'>TAVOLO</option><br>" + 
        				"        <option value='carte'>CARTE</option><br>" + 
        				"    	 </select><br>"+
                        "<input type='number' name='min_gio' value='' placeholder='min-giocatori'><br>" +
                        "<input type='number' name='max_gio' value='' placeholder='max-giocatori'><br>"+
                        "<input type='hidden' name='prodType' value='giochi'><br>";
        	}
        	
        	if(insType!=null && insType.equalsIgnoreCase("accessorio")){
        		insForm = insForm + 
        				"<select id='tipologia' name='tipologia'><br>" + 
        				"        <option value='altri brand'>ALTRI BRAND</option><br>" + 
        				"        <option value='esclusivi'>ESCLUSIVI</option><br>" + 
        				"    	 </select><br>"+
        				"<input type='hidden' name='prodType' value='accessori'><br>";
        	}
        	
        	if(insType!=null && insType.equalsIgnoreCase("espansione")){
        		insForm = insForm + "<input type='text' name='codGioco' value='' placeholder='cod_gioco'><br>"+
        				"<input type='hidden' name='prodType' value='espansioni'><br>";
        	}
        	insForm += "<textarea rows='7' cols='100' name='descrizione' placeholder='descrizione'></textarea><br>" +
            "<input type='button' onclick='submitInsForm()' value='Invia'>" +
            "</form>";
        	response.setContentType("text/html");
    	    response.getWriter().write(insForm);
        }
    
        if (action != null && action.equalsIgnoreCase("InsertCards")) {
        	System.out.println("aa");
        	String fullName = request.getParameter("fullName");
	        String cardNumber = request.getParameter("cardNumber");
	        int expiryDate = Integer.parseInt(request.getParameter("expiryDate"));
	        int cvv = Integer.parseInt(request.getParameter("cvv"));
	        String username = request.getParameter("username");
	        
	        // Crea un nuovo bean per la carta con i dati ricevuti
	        CartaBean carta = new CartaBean();
	        carta.setNome(fullName);
	        carta.setNumero(cardNumber);
	        carta.setScadenza(expiryDate);
	        carta.setCvv(cvv);
	        carta.setUsername(username);
	        
	        try {
	            // Chiama il metodo doSave del modello per salvare la carta nel database
	            modelCarta.doSave(carta);
	            // Invia una risposta di success
	            response.setStatus(HttpServletResponse.SC_OK);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            // Invia una risposta di errore
	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        }
        }
        
        if (action != null && action.equalsIgnoreCase("GameModifyForm")) {
            	    String gameId = request.getParameter("gameId");
            	    try {
						GiocoBean bean = modelGioco.doRetrieveByKey(gameId);
            	    // Creare il form di modifica per il gioco specifico
            	    String modifyForm = "<form id='ModifyGameForm' action='updateGame' method='POST' enctype=\"multipart/form-data\">" +
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
    	    String modifyForm = "<form id='ModifyAccForm' action='updateAccessorio' method='POST' enctype=\"multipart/form-data\">" +
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
    	    String modifyForm = "<form id='ModifyEspForm' action='updateEspansione' method='POST' enctype=\"multipart/form-data\">" +
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
            if(prodType.equals("giochi")) {
            	String edizione = request.getParameter("edizione");
                String tipologia = request.getParameter("tipologia");
                int min_gio = Integer.parseInt(request.getParameter("min_gio"));
                int max_gio = Integer.parseInt(request.getParameter("max_gio"));
            	
    			GiocoBean bean = new GiocoBean();
    			bean.setImmagineCop(saveImmagine(request,response,prodType,1));
    			bean.setImmagine2(saveImmagine(request,response,prodType,2));
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
                    modelAp.insertImgGioco(bean);
                    response.setStatus(HttpServletResponse.SC_OK);
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                	}
    		}else if(prodType.equals("accessori")) {
                String tipologia = request.getParameter("tipologia");
    			
    			AccessorioBean bean = new AccessorioBean();
    			bean.setImmagineCop(saveImmagine(request,response,prodType,1));
    			bean.setImmagine2(saveImmagine(request,response,prodType,2));
    			bean.setCod_accessorio(codice);;
    	        bean.setNomeaccessorio(nome);
    	        bean.setPrezzo(prezzo);
    	        bean.setTipologia(tipologia);
    	        bean.setDescrizione(descrizione);
    	        try {
    	            modelAp.insertProd(bean);
    	            modelAp.insertImgAcc(bean);
    	            response.setStatus(HttpServletResponse.SC_OK);
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    	        	}
    		}else if(prodType.equals("espansioni")) {
    			espansioneBean bean= new espansioneBean();
    			bean.setImmagineCop(saveImmagine(request,response,prodType,1));
    			bean.setImmagine2(saveImmagine(request,response,prodType,2));
    			String idGame = request.getParameter("codGioco");
    			
    			bean.setCod_espansione(codice);;
    	        bean.setNomeespansione(nome);
    	        bean.setPrezzo(prezzo);
    	        bean.setDescrizione(descrizione);
    	        bean.setCod_gioco(idGame);
    	        
    	        try {
    	            modelAp.insertProd(bean);
    	            modelAp.insertImgEsp(bean);
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
	
	protected String saveImmagine(HttpServletRequest request, HttpServletResponse response, String type, int ch) throws ServletException, IOException {
	    // Ottieni il percorso reale dell'applicazione web
	    String applicationPath = request.getServletContext().getRealPath("");
	    
	    String imgSaveDb = "IMMAGINI" + File.separator + "IMMAGINI_" +type.toUpperCase();
	    
	    // Definisci il percorso dove desideri salvare le immagini
	    String savePath = applicationPath + File.separator + "IMMAGINI" + File.separator + "IMMAGINI_"+type.toUpperCase();
	    
	    // Ottieni la parte dell'immagine della copertina
	    Part imgCopertinaPart = request.getPart("imgCopertina");
	    Part img2 = request.getPart("img2");
	    if (imgCopertinaPart != null && ch == 1) {
	        String fileNameCop = imgCopertinaPart.getSubmittedFileName();
	        if (fileNameCop != null && !fileNameCop.isEmpty()) {
	            // Costruisci il percorso completo per salvare l'immagine
	            String imageSavePath = savePath + File.separator + fileNameCop;
	            
	            System.out.println("Percorso dell'immagine da salvare: " + imageSavePath);

	            // Salva l'immagine nel file system
	            saveImageToFileSystem(imgCopertinaPart, imageSavePath);
	            
	            // Ritorna il percorso dove hai salvato l'immagine
	            return imgSaveDb + File.separator + fileNameCop;
	        } else {
	            System.out.println("Il nome del file della copertina è vuoto o nullo.");
	        }
	    } else {
	        System.out.println("La parte dell'immagine della copertina è nulla.");
	    }
	    
	    if (img2 != null && ch == 2) {
	    	System.out.println("cd");
	        String fileNameCop = img2.getSubmittedFileName();
	        if (fileNameCop != null && !fileNameCop.isEmpty()) {
	            // Costruisci il percorso completo per salvare l'immagine
	            String imageSavePath = savePath + File.separator + fileNameCop;
	            
	            System.out.println("Percorso dell'immagine da salvare: " + imageSavePath);

	            // Salva l'immagine nel file system
	            saveImageToFileSystem(img2, imageSavePath);
	            
	            // Ritorna il percorso dove hai salvato l'immagine
	            return imgSaveDb + File.separator + fileNameCop;
	        } else {
	            System.out.println("Il nome del file della copertina è vuoto o nullo.");
	        }
	    } else {
	        System.out.println("La parte dell'immagine della copertina è nulla.");
	    }
	    
	    return null; // Se non è stata salvata nessuna immagine
	}

	private void saveImageToFileSystem(Part part, String imageSavePath) throws IOException {
	    File file = new File(imageSavePath);
	    if (!file.getParentFile().exists()) {
	        if (!file.getParentFile().mkdirs()) {
	            throw new IOException("Impossibile creare la directory: " + file.getParentFile());
	        }
	    }
	    part.write(imageSavePath);
	    System.out.println("File salvato: " + imageSavePath);
	}


}
