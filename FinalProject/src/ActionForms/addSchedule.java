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
@WebServlet("/addSchedule")
public class addSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSchedule() {
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
	String courses = request.getParameter("courses");
	String professors = request.getParameter("professors");
	String timings = request.getParameter("timings");
	String intakes = request.getParameter("intakes");
	String seatsAvailable = request.getParameter("seatsAvailable");
	String[] q1 = request.getParameterValues("day");
	for(int i = 0; i < q1.length;	i++)
	{
		DbMethods.addCoursesAvailable(courses,professors,timings,intakes,q1[i],seatsAvailable);
	}
	request.setAttribute("message","Schedule Added Successfully");
	request.getRequestDispatcher("/jsp/AddSchedule.jsp").forward(request, response);
	}

}
