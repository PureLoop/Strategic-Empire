package it.unisa;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Username = request.getParameter("username");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");
        String email = request.getParameter("email");
        String indirizzo = request.getParameter("Indirizzo");
        Integer ncivico = Integer.parseInt(request.getParameter("ncivico"));

        String url = "jdbc:mysql://localhost:3306/progettoTSWAggiornato?serverTimezone=UTC";
        String user = "root";
        String dbPassword = "1212";

        if (!isPasswordValid(password)) {
            request.setAttribute("errorMessage", "Errore nel campo password!");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(cpassword)) {
            request.setAttribute("errorMessage", "Errore nel campo conferma password");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        if (isEmailRegistered(email)) {
            request.setAttribute("errorMessage", "Email gi� registrata.");
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
            String sql = "INSERT INTO utente (Username, nome, cognome, pw, saltPW, email, ruolo, indirizzo, ncivico) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            String salt = BCrypt.gensalt();
            String hashedPW = BCrypt.hashpw(password, salt);
            statement.setString(1, Username);
            statement.setString(2, nome);
            statement.setString(3, cognome);
            statement.setString(4, hashedPW); // Utilizza la password cifrata
            statement.setString(5, salt);
            statement.setString(6, email);
            statement.setString(7, "cliente"); // Imposta il ruolo a cliente di default
            statement.setString(8, indirizzo);
            statement.setInt(9, ncivico);
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("GiocoView.jsp");
            } else {
                request.setAttribute("errorMessage", "Errore nella registrazione. Riprova.");
                request.getRequestDispatcher("/Login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Stampa la traccia dell'errore per identificarne la causa
            request.setAttribute("errorMessage", "Errore di accesso al database: " + e.getMessage());
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("checkEmail".equals(action)) {
            String email = request.getParameter("email");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            try {
                if (isEmailRegistered(email)) {
                    response.getWriter().write("{\"emailExists\": true}");
                } else {
                    response.getWriter().write("{\"emailExists\": false}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("{\"error\": \"Errore di accesso al database.\"}");
            }
        }
    }

    private boolean isEmailRegistered(String email) {
        boolean isRegistered = false;
        String url = "jdbc:mysql://localhost:3306/progettoTSWAggiornato?serverTimezone=UTC";
        String user = "root";
        String dbPassword = "1212";

        try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
            String sql = "SELECT * FROM utente WHERE email = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                isRegistered = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isRegistered;
    }

    private boolean isPasswordValid(String password) {
        if (password == null) {
            return false;
        }
        boolean hasUpperCase = password.chars().anyMatch(Character::isUpperCase);
        boolean hasNumber = password.chars().anyMatch(Character::isDigit);
        boolean hasSpecialChar = password.chars().anyMatch(ch -> "!@#$%^&*(),.?\":{}|<>".indexOf(ch) >= 0);
        boolean isLengthValid = password.length() >= 8 && password.length() <= 16;
        return isLengthValid && hasUpperCase && hasNumber && hasSpecialChar;
    }
}
