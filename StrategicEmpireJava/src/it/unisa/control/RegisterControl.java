package it.unisa.control;

import it.unisa.model.RegisterModelDM;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/RegisterControl")
public class RegisterControl extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private RegisterModelDM registerModel = new RegisterModelDM();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect POST requests to GET method for consistency
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("checkEmail".equals(action)) {
            handleEmailCheck(request, response);
        } else if ("checkUsername".equals(action)) {
            handleUsernameCheck(request, response);
        } else {
            handleRegistration(request, response);
        }
    }
    private void handleUsernameCheck(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            boolean usernameExists = registerModel.isUsernameRegistered(username);
            response.getWriter().write("{\"usernameExists\": " + usernameExists + "}");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\": \"Errore di accesso al database.\"}");
        }
    }
    private void handleEmailCheck(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String email = request.getParameter("email");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            boolean emailExists = registerModel.isEmailRegistered(email);
            response.getWriter().write("{\"emailExists\": " + emailExists + "}");
        } catch (SQLException e) {
            e.printStackTrace(); // Consider using a logging framework
            response.getWriter().write("{\"error\": \"Errore di accesso al database.\"}");
        }
    }

    private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String username = request.getParameter("username");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String email = request.getParameter("email");
        String indirizzo = request.getParameter("indirizzo");
        Integer ncivico = parseIntWithDefault(request.getParameter("ncivico"), 0);

        // Validate and process registration
        try {
            if (!registerModel.isPasswordValid(password)) {
                forwardWithError(request, response, "Errore nel campo password!");
                return;
            }

            if (!password.equals(cpassword)) {
                forwardWithError(request, response, "Errore nel campo conferma password");
                return;
            }

            if (registerModel.isEmailRegistered(email)) {
                forwardWithError(request, response, "Email già registrata.");
                return;
            }

            if (registerModel.isUsernameRegistered(username)) {
                forwardWithError(request, response, "Username già registrato.");
                return;
            }

            registerModel.insertUtente(username, nome, cognome, password, email, indirizzo, ncivico);
            forwardWithSuccess(request, response, "Registrazione completata con successo.");
        } catch (SQLException e) {
            e.printStackTrace();
            forwardWithError(request, response, "Errore durante la registrazione.");
        }
    }

    private int parseIntWithDefault(String value, int defaultValue) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    private void forwardWithError(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("/Register.jsp").forward(request, response);
    }

    private void forwardWithSuccess(HttpServletRequest request, HttpServletResponse response, String successMessage)
            throws ServletException, IOException {
        request.setAttribute("successMessage", successMessage);
        request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }
}
