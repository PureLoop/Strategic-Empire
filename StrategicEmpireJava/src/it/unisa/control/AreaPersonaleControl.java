package it.unisa.control;

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
import it.unisa.bean.AccessorioBean;
import it.unisa.bean.CartaBean;
import it.unisa.bean.GiocoBean;
import it.unisa.bean.User;
import it.unisa.bean.espansioneBean;
import it.unisa.model.AccessorioModelDM;
import it.unisa.model.AreaPersonaleModelDM;
import it.unisa.model.CartaModelDM;
import it.unisa.model.EspansioneModel;
import it.unisa.model.EspansioneModelDM;
import it.unisa.model.GiocoModelDM;
import it.unisa.model.UserDAO;
import it.unisa.model.AccessorioModel;
import it.unisa.model.AreaPersonaleModel;
import it.unisa.model.CartaModel;
import it.unisa.model.EspansioneModel;
import it.unisa.model.GiocoModel;
import it.unisa.model.UserModel;

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
	static UserModel modelUser;
	static {
			modelGioco = new GiocoModelDM();
			modelAcc = new AccessorioModelDM();
			modelEsp = new EspansioneModelDM();
			modelAp = new AreaPersonaleModelDM();
			modelCarta = new CartaModelDM();
			modelUser = new UserDAO();
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
        request.setAttribute("pageType", "AreaPersonale");
        		

        if (action != null && action.equalsIgnoreCase("ShowGioco")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

            try {
                Collection<GiocoBean> giochi = modelGioco.doRetrieveAll(sort);
                request.setAttribute("prodottiAP", giochi);

                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showGioco.jsp");
                    dispatcher.include(request, response);
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
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showAccessorio.jsp");
                    dispatcher.include(request, response);
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
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showCards.jsp");

                    dispatcher.include(request, response);
                } else {
                    request.removeAttribute("prodottiAP");
                    request.setAttribute("prodottiAP", carte);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
        else if (action != null && action.equalsIgnoreCase("ShowCards2")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
            String username = request.getParameter("username"); // Ottieni il nome utente dal parametro della richiesta

            try {
                Collection<CartaBean> carte = modelCarta.doRetrieveByFilter(username);
                request.setAttribute("prodottiAP", carte);

                if (isAjaxRequest) {
                    response.setContentType("text/html");
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showCards2.jsp");
                    dispatcher.include(request, response);
                } else {
                    request.removeAttribute("prodottiAP");
                    request.setAttribute("prodottiAP", carte);
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (SQLException e) {
                System.out.println("Error:" + e.getMessage());
            }
        }
        else if (action != null && action.equalsIgnoreCase("viewCard")) {
            String numero = request.getParameter("numero"); // Ottieni il numero della carta dalla richiesta

            try {
                CartaBean carta = modelCarta.doRetrieveByKey(numero); // Recupera la carta dal modello
                request.setAttribute("c", carta);

                // Ottieni un dispatcher per il JSP dei dettagli della carta (o crea HTML direttamente)
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showCardDetails.jsp");
                dispatcher.include(request, response);
            } catch (SQLException e) {
                // Gestisci l'errore SQL
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
        else if (action != null && action.equalsIgnoreCase("deleteCard")) {

            String numero = request.getParameter("numero"); // Ottieni il numero della carta dalla richiesta

            try {
                 modelCarta.doDelete(numero); // Recupera la carta dal modell
                // Ottieni un dispatcher per il JSP dei dettagli della carta (o crea HTML direttamente)
                 

                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showCardDetails.jsp");
                dispatcher.include(request, response);
            } catch (SQLException e) {
                // Gestisci l'errore SQL
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        }
        else if (action != null && action.equalsIgnoreCase("editCard")) {
            try {

                String fullName = request.getParameter("fullName");
                String cardNumber = request.getParameter("cardNumber");
                int expiryDate = Integer.parseInt(request.getParameter("expiryDate"));
                int cvv = Integer.parseInt(request.getParameter("newcvv"));
                String username = request.getParameter("username");
                // Chiamata al metodo doUpdate nel modello della carta
                modelCarta.doUpdate(fullName, cardNumber, expiryDate, cvv, username);

                // Dispatcher per il JSP dei dettagli della carta
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showCardDetails.jsp");
                dispatcher.include(request, response);
            } catch (SQLException e) {
                // Gestione dell'errore SQL
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            } catch (NumberFormatException e) {
                // Gestione dell'errore di conversione numerica (per cvv e expiryDate)
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Codice di stato HTTP 400
            }
        }



else if (action != null && action.equalsIgnoreCase("ShowEspansione")) {
        	 boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

             try {
                 Collection<espansioneBean> espansioni = modelEsp.doRetrieveAll(sort);
                 request.setAttribute("prodottiAP", espansioni);

                 if (isAjaxRequest) {
                     response.setContentType("text/html");
                     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/showEspansione.jsp");
                     dispatcher.include(request, response);
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
        		modelAcc.deleteAcc(accId);
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
        
        if(action!=null && action.equalsIgnoreCase("delGioco")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        	String giocoId = request.getParameter("giocoId");
        	try {
        		modelGioco.deleteGioco(giocoId);
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
        
        if(action!=null && action.equalsIgnoreCase("delEsp")) {
            boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
        	String espId = request.getParameter("espId");
        	try {
        		modelEsp.deleteEsp(espId);
        	}catch(SQLException e) {
        		e.printStackTrace();
        	}
        }
        
        if (action != null && action.equalsIgnoreCase("showInsForm")) {
            request.setAttribute("insType", insType);

            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/formInsertProd.jsp");
            dispatcher.forward(request, response);
        }

    
        if (action != null && action.equalsIgnoreCase("InsertCards")) {
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
                request.setAttribute("bean", bean);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/formModGioco.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                // Gestisci l'errore come necessario
            }
        }

        if (action != null && action.equalsIgnoreCase("AccModifyForm")) {
            String accId = request.getParameter("accId");
            try {
                AccessorioBean bean = modelAcc.doRetrieveByKey(accId);
                request.setAttribute("bean", bean);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/formModAcc.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                // Gestisci l'errore come necessario
            }
        }

        if (action != null && action.equalsIgnoreCase("EspModifyForm")) {
        	System.out.println("ciao");
            String espId = request.getParameter("espId");
            try {
                espansioneBean bean = modelEsp.doRetrieveByKey(espId);
                request.setAttribute("bean", bean);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/formModEsp.jsp");
                dispatcher.forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                // Gestisci l'errore come necessario
            }
        }

        
        boolean img1Status = false;
        boolean img2Status = false;
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
            	Part imgCopertina = request.getPart("imgCopertina");
                if (imgCopertina != null && imgCopertina.getSize() > 0) {
                	bean.setImmagineCop(saveImmagine(request,response,"accessori",1));
                	img1Status  = true;
                }

                Part img2 = request.getPart("img2");
                if (img2 != null && img2.getSize() > 0) {
                	bean.setImmagine2(saveImmagine(request,response,"accessori",2));
                	img2Status  = true;
                }
            	
                modelGioco.updateGame(bean,img1Status,img2Status);
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
        	Part imgCopertina = request.getPart("imgCopertina");
            if (imgCopertina != null && imgCopertina.getSize() > 0) {
            	bean.setImmagineCop(saveImmagine(request,response,"accessori",1));
            	img1Status  = true;
            }

            Part img2 = request.getPart("img2");
            if (img2 != null && img2.getSize() > 0) {
            	bean.setImmagine2(saveImmagine(request,response,"accessori",2));
            	img2Status  = true;
            }
            modelAcc.updateAccessorio(bean,img1Status,img2Status);
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
        	Part imgCopertina = request.getPart("imgCopertina");
            if (imgCopertina != null && imgCopertina.getSize() > 0) {
            	bean.setImmagineCop(saveImmagine(request,response,"espansioni",1));
            	img1Status  = true;
            }

            Part img2 = request.getPart("img2");
            if (img2 != null && img2.getSize() > 0) {
            	bean.setImmagine2(saveImmagine(request,response,"espansioni",2));
            	img2Status  = true;
            }
        	       	
            modelEsp.updateEspansione(bean,img1Status,img2Status);
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
                    modelGioco.insertProd(bean);
                    modelGioco.insertImgGioco(bean);
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
    	            modelAcc.insertProd(bean);
    	            modelAcc.insertImgAcc(bean);
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
    	            modelEsp.insertProd(bean);
    	            modelEsp.insertImgEsp(bean);
    	            response.setStatus(HttpServletResponse.SC_OK);
    	        } catch (SQLException e) {
    	            e.printStackTrace();
    	            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    	        	}
    		}
    	}
    	
    	if (action != null && action.equals("showUsers")) {
    	    boolean isAjaxRequest = "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));

    	    try {
    	        Collection<User> users = modelUser.doRetrieveAll();
    	        request.setAttribute("userList", users);

    	        if (isAjaxRequest) {
    	            // Restituisci solo il frammento HTML della tabella
    	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/fragments/userTable.jsp");
    	            dispatcher.include(request, response);
    	        } else {
    	            // Reindirizza all'intera pagina JSP
    	            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AreaPersonale.jsp");
    	            dispatcher.forward(request, response);
    	        }
    	    } catch (SQLException e) {
    	        System.out.println("Error: " + e.getMessage());
    	    }
    	}
    	
    	if (action != null && action.equals("updateRole")) {
            String username = request.getParameter("username");
            String role = request.getParameter("role");
            try {
                // Supponiamo che modelUser abbia un metodo per aggiornare il ruolo
                modelUser.updateUserRole(username, role);
                response.setStatus(HttpServletResponse.SC_OK);
            } catch (SQLException e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
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
	        String fileNameCop = img2.getSubmittedFileName();
	        if (fileNameCop != null && !fileNameCop.isEmpty()) {
	            // Costruisci il percorso completo per salvare l'immagine
	            String imageSavePath = savePath + File.separator + fileNameCop;

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
	}


}
