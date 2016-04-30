package DbConnectors;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;

import org.apache.jasper.util.UniqueAttributesImpl;

public class DbMethods {
	static DbConnection db = new DbConnection();
	static Statement st = null;
	static ResultSet res = null;

	
	public static void insertUsers(String loginId, String name,
			String address, String phoneNumber, String password) {
		// TODO Auto-generated method stub
		try {
			st = DbConnection.getConnection().createStatement();
			res = st.executeQuery("insert into profile values('"+loginId+"','"+password+"','"+name+"','"+address+"','"+phoneNumber+"')");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static String authenticate(String userName, String password) {
		String authStatus = "Fail";
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select password from profile where loginid='"
					+ userName + "'");
			while (res.next()) {
				if (password.equals(res.getString(1))) {
					authStatus = "Success";
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return authStatus;
	}

	public static Vector retriveCourses(String intake) {
		Vector vec = new Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select coursename,professor,timing,day,seatsavailable from coursesavailable where semister='"
					+ intake + "'");
			while (res.next()) {
				vec.add(res.getString(1));
				vec.add(res.getString(2));
				vec.add(res.getString(3));
				vec.add(res.getString(4));
				vec.add(res.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}

	public static void addCourses(String userName, ArrayList paramValues,
			ArrayList paramNames) {
		String	str	=	"";
		Vector vec = new Vector();
		try {
			st = db.getConnection().createStatement();
			for (int i = 1; i < paramValues.size(); i++) {
				String query1 = "";
				query1	=	"update coursesavailable set seatsavailable=";	
				String query = "";
				query = "insert into studentcourses values('" + userName + "','";
				StringTokenizer st1 = new StringTokenizer((String) paramValues.get(i), "$$$");
				int	count	=	0;
				int temp	=	0;
				while (st1.hasMoreTokens()) {
					String str1	=	st1.nextToken();
					if(count!=3)
					{
						query = query + str1+ "','";
					}
					count	=	count	+	1;
				}
				query = query + (String)paramNames.get(i) + "',Studentcourses_seq.nextval)";
				str	=	query;
				st.executeQuery(str);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void updateCourseCount(String userName, ArrayList paramValues,
			ArrayList paramNames) {
		String	str	=	"";
		Vector vec = new Vector();
		try {
			st = db.getConnection().createStatement();
			for (int i = 1; i < paramValues.size(); i++) {
				String query1 = "";
				query1	=	"update coursesavailable set seatsavailable=";	
				StringTokenizer st1 = new StringTokenizer((String) paramValues.get(i), "$$$");
				int	count	=	0;
				int temp	=	0;
				int columnCount=	query1.length();
				while (st1.hasMoreTokens()) {
					String str1	=	st1.nextToken();
					if(count==0)
					{
						query1	=	query1	+	temp +" where professor='"+str1+"'" ;
					}
					else if (count==1) {
						query1	=	query1	+"and timing='"+str1+"'" ;
					}
					else if (count==3) {
						temp	=	Integer.parseInt(str1)-1;
						query1	=	query1.substring(0,columnCount)	+	temp	+ query1.substring(columnCount+1,query1.length());
						query1	=	query1	 ;
					}
					count	=	count	+	1;
				}
				st.executeQuery(query1);
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	public static Vector retriveEnrolledCourses(String userName) {
		Vector vec = new Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from studentCourses where userName='"+ userName + "'");
			while (res.next()) {
				vec.add(res.getString(1));
				vec.add(res.getString(2));
				vec.add(res.getString(3));
				vec.add(res.getString(4));
				vec.add(res.getString(5));
				vec.add(res.getString(6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vec;
	}
	public static void dropCourses(String id) {
		try {
				st = db.getConnection().createStatement();
				String query = "DELETE FROM studentCourses WHERE id = "+id;
				st.executeQuery(query);
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Vector getIntake() {
		Vector intake	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from intake");
			while (res.next()) {
				intake.add(res.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return intake;
	}
	public static Vector getProfessor() {
		Vector intake	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from addprofessors");
			while (res.next()) {
				intake.add(res.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return intake;
	}
	public static Vector getTiming() {
		Vector intake	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from addTiming");
			while (res.next()) {
				intake.add(res.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return intake;
	}
	public static Vector getCourses() {
		Vector intake	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from addCourses");
			while (res.next()) {
				intake.add(res.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return intake;
	}
	public static void updateUser(String userName,String name,String address,String phoneNumber,String password) {
		Vector intake	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("update profile set name='"+name+"',address='"+address+"',phonenumber='"+phoneNumber+"',password='"+password+"' where loginid='"+userName+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public static Vector selectUser(String userName) {
		Vector details	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			if(userName.equals("superuser")){
			res = st.executeQuery("select password,name,address,phonenumber from profile");
			}
			else{
				res = st.executeQuery("select password,name,address,phonenumber from profile where loginid='"+userName+"'");
			}
			while(res.next()){
				details.add(res.getString(1));
				details.add(res.getString(2));
				details.add(res.getString(3));
				details.add(res.getString(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return details;
	}
	public static void editUser(String loginId, String name,String password, String phoneNumber, String address) {
		// TODO Auto-generated method stub
		try {

		st = db.getConnection().createStatement();
		
		st.executeQuery("update profile set password='"+password+"',name='"+name+"',address='"+address+"',phonenumber='"+phoneNumber+"'  where loginid='"+loginId+"'");
		}
	 catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}
	public static void changePassword(String userName, String password) {
		// TODO Auto-generated method stub
		try {

		st = db.getConnection().createStatement();
		st.executeQuery("update profile set password='"+password+"' where loginid='"+userName+"'");
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static int getCoursesEnrolled(String loginId) {
		int courses	=	0;
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select count(*) from studentcourses where username='"+loginId+"'");
			while (res.next()) {
				courses	=	res.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return courses;
	}
	public static void insertSemester(String semester) {
		// TODO Auto-generated method stub
		try {
			st = DbConnection.getConnection().createStatement();
			res = st.executeQuery("insert into intake values('"+semester+"')");
		} catch	 (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void insertCourses(String courseName) {
		// TODO Auto-generated method stub
		try {
			st = DbConnection.getConnection().createStatement();
			res = st.executeQuery("insert into addCourses values('"+courseName+"')");
		} catch	 (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void insertProfessors(String professor) {
		// TODO Auto-generated method stub
		try {
			st = DbConnection.getConnection().createStatement();
			res = st.executeQuery("insert into addProfessors values('"+professor+"')");
		} catch	 (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void addTiming(String timing) {
		// TODO Auto-generated method stub
		try {
			st = DbConnection.getConnection().createStatement();
			res = st.executeQuery("insert into addTiming values('"+timing+"')");
		} catch	 (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void addCoursesAvailable(String courses, String professors,
			String timings,String intakes, String day,String seatsAvailable) {
		try {
			st = DbConnection.getConnection().createStatement();
			res = st.executeQuery("insert into coursesavailable values('"+courses+"','"+professors+"','"+timings+"','"+intakes+"','"+day+"','"+seatsAvailable+"')");
		} catch	 (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Vector getList(String table) {
		Vector rows		=	new	Vector();
		Vector columns	=	new	Vector();
		Vector input	=	new	Vector();
		try {
			st	=	db.getConnection().createStatement();
				res	=	st.executeQuery("select column_name from dba_tab_columns where table_name = '"+table.toUpperCase()+"'");
			while(res.next()){
				columns.add(res.getString(1));
				}
			
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from "+table);
			while (res.next()) {
				for(int i=0;i<columns.size();i++){
				rows.add(res.getString(i+1));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		input.add(rows);
		input.add(columns);
		return input;
	}
	public static Vector searchStudent(String loginid) {
		Vector studentInfo	=	new	Vector();
		try {
			st = db.getConnection().createStatement();
			res = st.executeQuery("select * from profile WHERE loginid like '"+loginid+"%'");
			
			while (res.next()) {
				studentInfo.add(res.getString(1));
				studentInfo.add(res.getString(3));
				studentInfo.add(res.getString(4));
				studentInfo.add(res.getString(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return studentInfo;
	}
	
	
	
	
}
