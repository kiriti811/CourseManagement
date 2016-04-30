<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String	message	=	"user updated Successfully";
%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<title>User</title>
</head>
<body>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<table style="width: 100%;height: 90%"><tr>
<td valign="top" width="30%">
<div><jsp:include page='left.jsp'></jsp:include>
</div>
</td>

<td>
<form name="myform" action="/FinalProject/editUsers" method="POST">
<h1>New Users</h1>
<table><%Vector vec= (Vector)request.getAttribute("list"); 
%>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
	<tr><td>Loginid:</td><td><input type="text" name="loginid" id="loginid" readonly="readonly" value="<%=session.getAttribute("userName")%>"></td></tr>
<tr><td>User Name:</td><td><input type="text" name="name" id="name" value="<%=vec.get(1) %>"></td></tr>
<tr><td>Phone Number:</td><td><input type="text" name="phoneNumber" id="phoneNumber" value="<%=vec.get(3) %>"></td></tr>
<tr><td>Password:</td><td><input type="password" name="password" readonly="readonly" id="password" value="<%=vec.get(0) %>"></td></tr>
<tr><td>Address:</td><td><textarea cols=20 rows=5 name="address" id="address" value="<%=vec.get(2) %>"><%=vec.get(2) %>
</textarea></td></tr>
<tr><td><input class="button"  type=submit value=submit></td>
<td></td>
</tr>
</table>
</td>
<td style="vertical-align: top"> 
</div></td>
</tr></table>

</form>

</body>
</html>