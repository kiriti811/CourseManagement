<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.*" %>
     <%@page import="DbConnectors.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String	message	=	"Schedule Added Successfully";
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<title>Admin Login</title>
</head>
<script type="text/javascript">
function Reset() {
	window.open("/FinalProject/jsp/AddSchedule.jsp","_self");
}
function test() {

	if (document.getElementById("day").value == "") {
		alert("Please Select the day and all other details and submit");
		return false;
	} else {
		document.myform.submit();
	}
}
</script>
<center>
<body>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>

<html>
<form name="myform" action="/FinalProject/addSchedule" method="POST">
<table style="width: 100%;height: 90%"><tr>
<td width="30%">
<div><jsp:include page='left.jsp'></jsp:include><html></div>
</td>
<td valign="top">
<h1>Add Schedule</h1>
<table>
		<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
<tr><td>Semester:</td><td>
<select name=intakes id=intakes>
<%Vector intakes=(Vector)DbMethods.getIntake();
for(int i=0;i<intakes.size();i++){
%>
<option value="<%=intakes.get(i) %>"><%=intakes.get(i) %></option>
<%} %>
</select></td>
</tr>
<tr><td>Professor:</td>
<td>
<select name=professors id=professors>
<%Vector professors=(Vector)DbMethods.getProfessor();
for(int i=0;i<professors.size();i++){
%>
<option value="<%=professors.get(i) %>"><%=professors.get(i) %></option>
<%} %>
</select>
</td></tr>
<tr><td>Course:</td>
<td>
<select name=courses id=courses>
<%Vector courses=(Vector)DbMethods.getCourses();
for(int i=0;i<courses.size();i++){
%>
<option value="<%=courses.get(i) %>"><%=courses.get(i) %></option>
<%} %>
</select></td>

</tr>
<tr>
<td>Timing:</td>
<td>
<select name=timings id=timings>
<%Vector timings=(Vector)DbMethods.getTiming();
for(int i=0;i<timings.size();i++){
%>
<option value="<%=timings.get(i) %>"><%=timings.get(i) %></option>
<%} %>
</select></td>

</tr>
<tr><td>Seats Available:</td><td><input type="text" name="seatsAvailable"  id="seatsAvailable" maxlength="2"></td></tr>
<tr><td>Monday:<input type="checkbox" name="day" value="Monday" id="day"></td><td>Tuesday:<input type="checkbox" name="day" value="Tuesday" id="day"></td></tr>
<tr><td>Wednesday:<input type="checkbox" name="day" value="Wednesday" id="day"></td><td>Thursday:<input type="checkbox" name="day" value="Thursday" id="day"></td></tr>
<tr><td>Friday:<input type="checkbox" name="day" value="Friday" id="day"></td><td>Saturday:<input type="checkbox" name="day" value="Saturday" id="day"></td></tr>
<tr><td><input class="button"  type=button onclick="test()" value=submit></td>
<td><input class="button"  type=button value=Reset onclick="Reset()"></td></tr>
</table>
<iframe src="/FinalProject/list?method=coursesavailable" width="75%" height="50%"></iframe>
</td></tr></table>
</form>

</body></center>
</html>