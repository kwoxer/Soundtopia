package music.controller.handler;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import music.manager.UserManagerLocal;

@WebServlet("/RegisterHandler")
public class RegisterHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private UserManagerLocal userManager;

	public RegisterHandler() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	public String processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		boolean registered = false;
		HttpSession session = request.getSession();

		String email = request.getParameter("emailRegister");
		String password = request.getParameter("passwordRegister");

		registered = userManager.createUser(email, password);

		if (registered) {
			session.setAttribute("email", email);
			session.setAttribute("loggedIn", new Boolean(registered));
			view = "../views/registerdone.jsp";
		} else
			view = "../error/registerErr.jsp";

		return view;
	}

}
