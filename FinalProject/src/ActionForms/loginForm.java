package ActionForms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbConnectors.*;

/**
 * Servlet implementation class loginForm
 */
@WebServlet("/loginForm")
public class loginForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userName		=	request.getParameter("username");
		String password		=	request.getParameter("password");
		String authStatus	=	DbMethods.authenticate(userName, password);
		if(authStatus.equals("Success")){
			HttpSession	session	=	request.getSession();
			session.setAttribute("userName", userName);
			if(!userName.equals("superuser")){
				request.setAttribute("intake", DbMethods.getIntake());
				request.getRequestDispatcher("/jsp/Success.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/jsp/AdminSuccess.jsp").forward(request, response);
			}
		}
		else{
			request.setAttribute("message", "Please Provide The Correct UserName And Password");
			request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);
		}
	}

}
