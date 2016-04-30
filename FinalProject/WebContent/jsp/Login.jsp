<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<title>Login</title>
<script>
function Reset(){
	window.open("/FinalProject/jsp/Login.jsp","_self");
}
</script>
</head>

 <%
String	message	=	"Please Provide The Correct UserName And Password";
 %>
<body>
<div style="text-align: center;" >
<jsp:include page='header1.jsp'></jsp:include>
</div>
<center><div>
	<form action="/FinalProject/loginForm" method="post">
		<h1>Student Course Registration System</h1>
		<h2>Login Page</h2>
		
		<table>
		
		<tr><%if(message.equals((String)request.getAttribute("message")))
			{
			%>
			
			<p style="color: red">Please input the right username and password</p>
			
			<%
			} %>
 		</tr>
			<tr>
				<td><b>User Name</td>
				<td><input type=username  name=username id=username></td>
			</tr>
			<tr>
				<td><b>Password</td>
				<td><input type=password  name=password id=password></td>
			</tr>
			<tr>
				<td><input type=submit class="button"  value=submit></td>
				<td style="text-align: center;	"><input type=Reset class="button"  value=Reset onclick="Reset()"></td>
			</tr>
		</table>
</form>
</div></center>
</body>
</html>