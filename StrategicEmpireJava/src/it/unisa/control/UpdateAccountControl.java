package it.unisa.control;

import it.unisa.bean.User;
import it.unisa.model.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/UpdateAccountControl")
public class UpdateAccountControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");
        String name = null;
        
        if (u != null) {
            name = u.getUsername();
        }
        
        
        String nome = request.getParameter("Nome");
        System.out.println(nome);
        String cognome = request.getParameter("Cognome");
        System.out.println(cognome);
        String email = request.getParameter("email");
        System.out.println(email);
        String indirizzo = request.getParameter("Indirizzo");
        System.out.println(indirizzo);
        String ncivicoStr = request.getParameter("ncivico");
        System.out.println(ncivicoStr);
        String Username = request.getParameter("Username");
        System.out.println(Username);
        int ncivico = 0; // Valore di default in caso di errore

        try {
            ncivico = Integer.parseInt(ncivicoStr);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        boolean updateSuccess = false;

        if (nome != null && cognome!=null && email != null && indirizzo != null && Username !=null) {
        
            UserDAO userDAO = new UserDAO();
            try {
                userDAO.UpdateUser(nome,cognome, email, indirizzo, ncivico,Username);
                updateSuccess = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Errore: Uno o piï¿½ parametri sono nulli.");
        }

        // Imposta il risultato dell'operazione come attributo della richiesta
        request.setAttribute("updateSuccess", updateSuccess);

        // Reindirizza alla pagina JSP del risultato
        request.getRequestDispatcher("/updateAccount.jsp").forward(request, response);
    }
}