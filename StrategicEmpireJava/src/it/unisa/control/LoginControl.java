package it.unisa.control;

import it.unisa.model.LoginModel;
import it.unisa.model.LoginModelDM;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import it.unisa.bean.User;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
    private LoginModel loginModel;

    @Override
    public void init() throws ServletException {
        // Inizializza il modello di login
        loginModel = new LoginModelDM();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        String errorMessage = null;

        System.out.println("Email: " + email);
        System.out.println("Password: " + password);

        try {
            if (loginModel.isEmailRegistered(email)) {
                if (loginModel.isPasswordValid(email, password)) {
                    User user = loginModel.getUserByEmail(email);
                    session.setAttribute("user", user);
                    response.sendRedirect("HomePage.jsp");
                } else {
                    errorMessage = "Password errata.";
                    request.setAttribute("errorMessage", errorMessage);
                    request.getRequestDispatcher("/Login.jsp").forward(request, response);
                }
            } else {
                errorMessage = "Utente non registrato.";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("/Login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            errorMessage = "Errore durante l'accesso.";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/Login.jsp").forward(request, response);
        }
    }

}
