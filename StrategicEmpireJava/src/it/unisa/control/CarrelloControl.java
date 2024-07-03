package it.unisa.control;

import java.io.IOException;
import java.util.Collection;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import it.unisa.bean.AccessorioBean;
import it.unisa.bean.GiocoBean;
import it.unisa.bean.OggettiCarrelloBean;
import it.unisa.bean.espansioneBean;
import it.unisa.model.AccessorioModelDM;
import it.unisa.model.EspansioneModel;
import it.unisa.model.EspansioneModelDM;
import it.unisa.model.GiocoModelDM;
import it.unisa.model.AccessorioModel;
import it.unisa.model.EspansioneModel;
import it.unisa.model.GiocoModel;

@WebServlet("/CarrelloControl")
public class CarrelloControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static GiocoModel model;
    static EspansioneModel model2;
    static AccessorioModel model3;

    static {
        model = new GiocoModelDM();
        model2 = new EspansioneModelDM();
        model3 = new AccessorioModelDM();
    }

    public CarrelloControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codiceArt = request.getParameter("cod_articolo");
        String codiceEspansione = request.getParameter("cod_espansione");
        String codiceAccessorio = request.getParameter("cod_accessorio");
        String username = request.getParameter("username");
        String action = request.getParameter("action");

        HttpSession session = request.getSession();

        List<OggettiCarrelloBean> oggettiCarrello = (List<OggettiCarrelloBean>) session.getAttribute("oggettiCarrello");
        
        
        if (oggettiCarrello == null) {
            oggettiCarrello = new ArrayList<>();
        }

        try {
            if ("delete".equals(action)) {
                Iterator<OggettiCarrelloBean> iterator = oggettiCarrello.iterator();
                while (iterator.hasNext()) {
                    OggettiCarrelloBean oggetto = iterator.next();
                    if (oggetto.getCod_articolo().equals(codiceArt)) {
                        // Rimuovi l'elemento dal database
                        if (codiceArt.startsWith("g")) {
                            model.deleteAcq_Gioco(codiceArt);
                        } else if (codiceArt.startsWith("a")) {
                            model3.deleteAcq_Accessorio(codiceArt);
                        } else if (codiceArt.startsWith("e")) {
                            model2.deleteAcq_Espansione(codiceArt);
                        }
                        // Rimuovi l'elemento dal carrello
                        iterator.remove();
                        break; // Esci dal ciclo dopo aver trovato e rimosso l'elemento
                    }
                }
                session.setAttribute("oggettiCarrello", oggettiCarrello);
                response.sendRedirect(request.getContextPath() + "/Carrello.jsp");
                return;
            }else if ("TakeDB".equals(action)) {
                oggettiCarrello.clear();
                System.out.println(username);

                // Recupera giochi, accessori ed espansioni dal database
                Collection<GiocoBean> giochi = model.doRetrieveAllDBACQ(username);
                Collection<AccessorioBean> accessori = model3.doRetrieveAllDBACQ(username);
                Collection<espansioneBean> espansioni = model2.doRetrieveAllDBACQ(username);

                System.out.println("Giochi: " + giochi.size());
                System.out.println("Accessori: " + accessori.size());
                System.out.println("Espansioni: " + espansioni.size());

                // Aggiungi i giochi al carrello
                for (GiocoBean gioco : giochi) {
                    OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                    oggettoCarrello.setCod_articolo(gioco.getCod_Gioco());
                    oggettoCarrello.setImmagineCopertina(gioco.getImmagineCop());
                    oggettoCarrello.setNome_articolo(gioco.getNomegioco());
                    oggettoCarrello.setPrezzo(gioco.getPrezzo());
                    oggettoCarrello.setQuantita(1); // Imposta la quantità a 1 per ogni gioco
                    
                    // Aggiungi l'oggetto al carrello
                    oggettiCarrello.add(oggettoCarrello);
                }

                // Aggiungi gli accessori al carrello
                for (AccessorioBean accessorio : accessori) {
                    OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                    oggettoCarrello.setCod_articolo(accessorio.getCod_Accessorio());
                    oggettoCarrello.setImmagineCopertina(accessorio.getImmagineCop());
                    oggettoCarrello.setNome_articolo(accessorio.getNomeaccessorio());
                    oggettoCarrello.setPrezzo(accessorio.getPrezzo());
                    oggettoCarrello.setQuantita(1); // Imposta la quantità a 1 per ogni accessorio
                    
                    // Aggiungi l'oggetto al carrello
                    oggettiCarrello.add(oggettoCarrello);
                }

                // Aggiungi le espansioni al carrello
                for (espansioneBean espansione : espansioni) {
                    OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                    oggettoCarrello.setCod_articolo(espansione.getCod_espansione());
                    oggettoCarrello.setImmagineCopertina(espansione.getImmagineCop());
                    oggettoCarrello.setNome_articolo(espansione.getNomeespansione());
                    oggettoCarrello.setPrezzo(espansione.getPrezzo());
                    oggettoCarrello.setQuantita(1); // Imposta la quantità a 1 per ogni espansione
                    
                    // Aggiungi l'oggetto al carrello
                    oggettiCarrello.add(oggettoCarrello);
                }

                // Aggiorna la sessione con il nuovo carrello
                session.setAttribute("oggettiCarrello", oggettiCarrello);
                response.sendRedirect(request.getContextPath() + "/catalogo.jsp");
                return;
            }
 else if ("addCarrello".equals(action)) {
                if (codiceArt.startsWith("g")) {
                    // Aggiungi Gioco
                    GiocoBean gioco = model.doRetrieveByKey(codiceArt);
                    boolean trovato = false;
                    for (OggettiCarrelloBean oggetto : oggettiCarrello) {
                        if (oggetto.getCod_articolo().equals(codiceArt)) {
                            int quant = oggetto.getQuantita();
                            oggetto.setQuantita(quant + 1);
                            trovato = true;
                            if (username != null) {
                                model.addGiocoToCart(gioco, username, quant + 1, true);
                            }
                            break;
                        }
                    }
                    if (!trovato) {
                        if (username != null) {
                            model.addGiocoToCart(gioco, username, 1, false);
                        }
                        OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                        oggettoCarrello.setCod_articolo(gioco.getCod_Gioco());
                        oggettoCarrello.setImmagineCopertina(gioco.getImmagineCop());
                        oggettoCarrello.setNome_articolo(gioco.getNomegioco());
                        oggettoCarrello.setPrezzo(gioco.getPrezzo());
                        oggettoCarrello.setQuantita(1);
                        oggettiCarrello.add(oggettoCarrello);
                    }
                } else if (codiceArt.startsWith("a")) {
                    // Aggiungi Accessorio
                    AccessorioBean accessorio = model3.doRetrieveByKey(codiceArt);
                    boolean trovato = false;
                    for (OggettiCarrelloBean oggetto : oggettiCarrello) {
                        if (oggetto.getCod_articolo().equals(codiceArt)) {
                            int quant = oggetto.getQuantita();
                            oggetto.setQuantita(quant + 1);
                            trovato = true;
                            if (username != null) {
                                model3.addAccessorioToCart(accessorio, username, quant + 1, true);
                            }
                            break;
                        }
                    }
                    if (!trovato) {
                        if (username != null) {
                            model3.addAccessorioToCart(accessorio, username, 1, false);
                        }
                        OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                        oggettoCarrello.setCod_articolo(accessorio.getCod_Accessorio());
                        oggettoCarrello.setImmagineCopertina(accessorio.getImmagineCop());
                        oggettoCarrello.setNome_articolo(accessorio.getNomeaccessorio());
                        oggettoCarrello.setPrezzo(accessorio.getPrezzo());
                        oggettoCarrello.setQuantita(1);
                        oggettiCarrello.add(oggettoCarrello);
                    }
                } else if (codiceArt.startsWith("e")) {
                    // Aggiungi Espansione
                    espansioneBean espansione = model2.doRetrieveByKey(codiceArt);
                    boolean trovato = false;
                    for (OggettiCarrelloBean oggetto : oggettiCarrello) {
                        if (oggetto.getCod_articolo().equals(codiceArt)) {
                            int quant = oggetto.getQuantita();
                            oggetto.setQuantita(quant + 1);
                            trovato = true;
                            if (username != null) {
                                model2.addEspansioneToCart(espansione, username, quant + 1, true);
                            }
                            break;
                        }
                    }
                    if (!trovato) {
                        if (username != null) {
                            model2.addEspansioneToCart(espansione, username, 1, false);
                            
                        }
                        OggettiCarrelloBean oggettoCarrello = new OggettiCarrelloBean();
                        oggettoCarrello.setCod_articolo(espansione.getCod_espansione());
                        oggettoCarrello.setImmagineCopertina(espansione.getImmagineCop());
                        oggettoCarrello.setNome_articolo(espansione.getNomeespansione());
                        oggettoCarrello.setPrezzo(espansione.getPrezzo());
                        oggettoCarrello.setQuantita(1);
                        oggettiCarrello.add(oggettoCarrello);
                    }
                }
            }
 else if ("decreaseQuantity".equals(action)) {
                String codiceArticolo = request.getParameter("cod_articolo");
                for (Iterator<OggettiCarrelloBean> iterator = oggettiCarrello.iterator(); iterator.hasNext();) {
                    OggettiCarrelloBean oggetto = iterator.next();
                    if (oggetto.getCod_articolo().equals(codiceArticolo)) {
                        int quant = oggetto.getQuantita();
                        if (quant > 1) {
                            oggetto.setQuantita(quant - 1);
                        } else if (quant == 1) {
                            iterator.remove(); // Rimuovi l'oggetto dal carrello
                        }
                        break;
                    }
                }
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"success\": true}");
            session.setAttribute("oggettiCarrello", oggettiCarrello);
        } catch (SQLException e) {
            System.out.println("Error:" + e.getMessage());
        }

        if ("delete".equals(action)) {
            response.sendRedirect(request.getContextPath() + "/Carrello.jsp");
            return;
        } else {
            response.sendRedirect(request.getContextPath() + "/catalogo.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
