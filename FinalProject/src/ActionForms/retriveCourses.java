package ActionForms;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DbConnectors.DbMethods;

/**
 * Servlet implementation class retriveCourses
 */
@WebServlet("/retriveCourses")
public class retriveCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retriveCourses() {
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
		String	intake		=	request.getParameter("intake");
		Vector	courseName	=	new	Vector();
		Vector	professor	=	new	Vector();
		Vector	timing		=	new	Vector();
		Vector	day			=	new	Vector();
		Vector	seatsAvailable	=	new	Vector();
		Vector	result		=	DbMethods.retriveCourses(intake);
		for(int i=0;i<result.size();i++){
			courseName.add(result.get(i));
			seatsAvailable.add(result.get(i+4));
			i=i+4;
		}
		Vector newCourseName	=	removeDuplicate.removeDuplicates(courseName);
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		for(int i=0;i<newCourseName.size();i++)
		{
			int count	=	0;
			List<String> list = new ArrayList<String>();
			while(count < result.size()){
				if(result.get(count).equals(newCourseName.get(i))){
					list.add((String) result.get(count+1));
					list.add((String) result.get(count+2));
					list.add((String) result.get(count+3));
					list.add((String) result.get(count+4));
					map.put((String) newCourseName.get(i),list);
				}
				count	=	count	+	1;	
			}
		}
		request.setAttribute("Data",map);
		HttpSession	session	=	request.getSession();
		DbMethods.getCoursesEnrolled((String)session.getAttribute("userName"));
		if(DbMethods.getCoursesEnrolled((String)session.getAttribute("userName"))>0)
		{
			request.setAttribute("message","You have already enrolled in classes drop them beore you make a new enrollment");
			request.getRequestDispatcher("retrieveStudentCourses").forward(request, response);
		}
		else{
			request.getRequestDispatcher("/jsp/SelectClasses.jsp").forward(request, response);
		}
	}

}
