<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css"
	HREF="/FinalProject/css/styles.css">
</head>
<body>
	<%
		String str = null;
		if (session.getAttribute("userName")==str) {
			request.getRequestDispatcher("/jsp/Login.jsp").forward(request, response);	
		} else {
			if (session.getAttribute("userName").equals("superuser")) {
	%>
	<div class=nav1>
		<ul>
			<li><a href="/FinalProject/jsp/SuperUserLogin.jsp"
				style="text-decoration: none">Register Users</a></li>
			<li><a href="/FinalProject/jsp/AddProfessors.jsp"
				style="text-decoration: none">Add Professors</a></li>
			<li><a href="/FinalProject/jsp/AddSemesters.jsp"
				style="text-decoration: none">Add Semesters</a></li>
			<li><a href="/FinalProject/jsp/AddCourses.jsp"
				style="text-decoration: none">Add Course Names</a></li>
			<li><a href="/FinalProject/jsp/AddTimings.jsp"
				style="text-decoration: none">Add Timings</a></li>
			<li><a href="/FinalProject/jsp/AddSchedule.jsp"
				style="text-decoration: none">Add Schedule</a></li>
			<li><a href="/FinalProject/jsp/SearchStudentInfo.jsp"
			style="text-decoration: none">Student Search</a></li>
		</ul>
	</div>
	<%
		} else {
	%>
	<div class=nav1>
		<ul>
			<li><a href="/FinalProject/jsp/Success.jsp"
				style="text-decoration: none">Select Courses</a></li>
			<li><a href="/FinalProject/retrieveStudentCourses"
				style="text-decoration: none">Courses Selected</a></li>
			<li><a href="/FinalProject/jsp/ChangePassword.jsp"
				style="text-decoration: none">Change Password</a></li>
			<li><a href="/FinalProject/userList"
				style="text-decoration: none">Edit User</a></li>
		</ul>
	</div>
	<%}
}%>
</body>
</html>