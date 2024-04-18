package it.unisa;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		String action = request.getParameter("action");

		try {
			if (action != null) {
				if (action.equalsIgnoreCase("read")) {
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
					int n_giocatori = Integer.parseInt(request.getParameter("N_giocatori"));

					GiocoBean bean = new GiocoBean();
					bean.setCod_gioco(cod);
					bean.setNomegioco(nome);
					bean.setEdizione(edizione);
					bean.setTipologia(tipologia);
					bean.setPrezzo(prezzo);
					bean.setDescrizione(descrizione);
					bean.setN_giocatori(n_giocatori);
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

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/GiocoView.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}