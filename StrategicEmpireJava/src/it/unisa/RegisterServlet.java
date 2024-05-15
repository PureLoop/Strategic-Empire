package it.unisa;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String pw = request.getParameter("password");
        String email = request.getParameter("email");
        String ruolo = request.getParameter("ruolo");

        // JDBC connection
        String url = "jdbc:mysql://localhost:3306/progettoTSWAggiornato?serverTimezone=UTC";
        String user = "root";
        String dbPassword = "1212";
       
        try (Connection conn = DriverManager.getConnection(url, user, dbPassword)) {
            String sql = "INSERT INTO utente (username, pw,saltPW, email, ruolo) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            String encPass = null;
            String salt = BCrypt.gensalt();
            String hashedPW = BCrypt.hashpw(pw, salt);
            statement.setString(2, hashedPW);
            statement.setString(3, salt);
            statement.setString(4, email);
            statement.setString(5, ruolo);
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("GiocoView.jsp");
            } else {
                response.sendRedirect("registration_error.html");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database access error", e);
        }
    }
}
