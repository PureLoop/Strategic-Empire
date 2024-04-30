package it.unisa;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class GiocoControl
 */
public class GiocoControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static GiocoModel model;
	
	static {
			model = new GiocoModelDM();
	}
	
	public GiocoControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Cart cart = (Cart)request.getSession().getAttribute("cart");
		if(cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		String action = request.getParameter("action");
		int i = 0;
		try {
			if (action != null) {
				if (action.equalsIgnoreCase("addC")) {
					String id = request.getParameter("cod_gioco");
					cart.addGioco(model.doRetrieveByKey(id));
			}else if(action.equalsIgnoreCase("read")) {
					 i = 2;
					String id = request.getParameter("cod_gioco");
					request.removeAttribute("gioco");
					request.setAttribute("gioco", model.doRetrieveByKey(id));
				} else if (action.equalsIgnoreCase("delete")) {
					String id = request.getParameter("cod_gioco");
					System.out.println("Deleting game with code: " + id);
					model.doDelete(id);
				} else if (action.equalsIgnoreCase("insert")) {
					String cod = request.getParameter("Codice");
					String nome = request.getParameter("Nome");
					String edizione = request.getParameter("Edizione");
					String tipologia = request.getParameter("Tipologia");
					String descrizione = request.getParameter("Descrizione");
					Double prezzo = Double.parseDouble(request.getParameter("Prezzo"));
					int n_giocatori_min = Integer.parseInt(request.getParameter("N_giocatori_min"));
					int n_giocatori_max = Integer.parseInt(request.getParameter("N_giocatori_max"));

					GiocoBean bean = new GiocoBean();
					bean.setCod_gioco(cod);
					bean.setNomegioco(nome);
					bean.setEdizione(edizione);
					bean.setTipologia(tipologia);
					bean.setPrezzo(prezzo);
					bean.setDescrizione(descrizione);
					bean.setN_giocatori_min(n_giocatori_min);
					bean.setN_giocatori_max(n_giocatori_max);
					model.doSave(bean);
				}else if(action.equalsIgnoreCase("filter")) {
					String tipologia = request.getParameter("tipologia");
					double prezzo;
					int nGiocatori;
					boolean check_prezzo = false;
					boolean check_giocatori = false;
					if(request.getParameter("prezzo") == "") {
						 prezzo = 0;
					}
					else {
						prezzo = Double.parseDouble(request.getParameter("prezzo"));
						check_prezzo = true;
					}
					if(request.getParameter("N_giocatori") == "") {
						nGiocatori = 0;
					}
					else {
						nGiocatori = Integer.parseInt(request.getParameter("N_giocatori"));
						check_giocatori = true;
					}
					
				    try {
				        Collection<GiocoBean> giochiFiltrati = model.doRetrieveByFilter(tipologia, prezzo, nGiocatori,check_prezzo,check_giocatori);
				        request.setAttribute("giochiFiltrati", giochiFiltrati); 
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
			request.removeAttribute("giochi");
			request.setAttribute("giochi", model.doRetrieveAll(sort));
		} catch (SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		
		RequestDispatcher dispatcher;
		if(i!= 2) {
		 dispatcher = getServletContext().getRequestDispatcher("/GiocoView.jsp");
		}else {
		 dispatcher = getServletContext().getRequestDispatcher("/Dettagli.jsp");	
		}
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
