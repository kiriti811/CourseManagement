package ActionForms;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbConnectors.DbMethods;

/**
 * Servlet implementation class retrieveStudentCourses
 */
@WebServlet("/retrieveStudentCourses")
public class retrieveStudentCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrieveStudentCourses() {
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
		
		HttpSession	session	=	request.getSession();
		String	userName	=	(String)session.getAttribute("userName");
		Vector	studentCourses	=	DbMethods.retriveEnrolledCourses(userName);
		request.setAttribute("studentCourses", studentCourses);
		request.getRequestDispatcher("/jsp/DropClasses.jsp").forward(request, response);
		// TODO Auto-generated method stub
	}

}
