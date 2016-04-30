package ActionForms;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DbConnectors.DbMethods;

/**
 * Servlet implementation class addCourses
 */
@WebServlet("/addCourses")
public class addCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addCourses() {
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
		ArrayList	paramNames	=	new	ArrayList();
		Enumeration enumeration = request.getParameterNames();
		int count	=	0;
		while (enumeration.hasMoreElements()) 
		{
					paramNames.add((String)enumeration.nextElement());
		}
		ArrayList	paramValues	=	new	ArrayList();
		for(int i=0;	i	<	paramNames.size();i++){
				paramValues.add(request.getParameter((String) paramNames.get(i)));
		}
		String	userName	=	request.getParameter("userName");
		DbMethods.addCourses(userName, paramValues, paramNames);
		DbMethods.updateCourseCount(userName, paramValues, paramNames);
		Vector	studentCourses	=	DbMethods.retriveEnrolledCourses(userName);
		request.setAttribute("studentCourses", studentCourses);
		request.getRequestDispatcher("/jsp/DropClasses.jsp").forward(request, response);
	}

}
