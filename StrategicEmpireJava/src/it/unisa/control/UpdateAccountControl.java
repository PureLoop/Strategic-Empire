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


        String username = request.getParameter("Username");
        String email = request.getParameter("email");
        String indirizzo = request.getParameter("Indirizzo");

        boolean updateSuccess = false;

        if (username != null && email != null && indirizzo != null) {

            UserDAO userDAO = new UserDAO();
            try {
                userDAO.UpdateUser(username, email, indirizzo, name);
                updateSuccess = true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("Errore: Uno o pi� parametri sono nulli.");
        }

        // Imposta il risultato dell'operazione come attributo della richiesta
        request.setAttribute("updateSuccess", updateSuccess);

        // Reindirizza alla pagina JSP del risultato
        request.getRequestDispatcher("/updateAccount.jsp").forward(request, response);
    }
}

