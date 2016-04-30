package ActionForms;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbConnectors.DbMethods;

/**
 * Servlet implementation class userList
 */
@WebServlet("/userList")
public class userList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession	session	=	request.getSession();
		String	userName	=	(String) session.getAttribute("userName");	
		if(!userName.equals("superuser")){
		
			request.setAttribute("list",DbMethods.selectUser(userName));
			request.getRequestDispatcher("/jsp/UserEdit.jsp").forward(request, response);
		}else{
			request.setAttribute("list",DbMethods.selectUser(userName));
			request.getRequestDispatcher("/jsp/UserList.jsp").forward(request, response);
		}
	}

}
