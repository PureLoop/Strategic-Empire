package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

<<<<<<< HEAD
import it.unisa.RecensioneModel;
import it.unisa.bean.RecensioneBean;
import it.unisa.model.RecensioneModelDM;
=======
import it.unisa.RecensioneModelDM;
import it.unisa.bean.RecensioneBean;
import it.unisa.model.RecensioneModel;
>>>>>>> 6bd804a1c16ee5f29e50bc3eb0adf86f6e04983b

@WebServlet("/RecensioneControl")
public class RecensioneControl extends HttpServlet {
	static RecensioneModel model;
	
	
	static {
		model = new RecensioneModelDM();
	}
	
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.removeAttribute("recensioni");
    	try {
			request.setAttribute("recensioni", model.doRetrieveAll());
		} catch (SQLException e) {
			e.printStackTrace();
		}
        request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
