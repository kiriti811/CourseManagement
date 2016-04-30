<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String	message	=	"You have already enrolled in classes drop them beore you make a new enrollment";
%>

<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<% 
Vector	vec	=	(Vector)request.getAttribute("studentCourses");	 
%>
<title>UCM</title>
</head>
<body>
<div><jsp:include page='header.jsp'></jsp:include></div>
<div>
<form	action	=	"dropCourses"	method=post>

<table style="width: 100%;height: 90%"><tr>
<td  width="30%">
<div><jsp:include page='left.jsp'></jsp:include></div>
</td>
<td valign="top">

<table>
<tr>
<p>User:	<font style="color: Brown;font-size: 20px"><%=session.getAttribute("userName")%></font></p>
</tr>
<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
<%for(int i	=	0;	i	<	vec.size(); i++){

	%>
<TR>
<td><%=vec.get(i+1) %></td>
<td><%=vec.get(i+2) %></td>
<td><%=vec.get(i+3) %></td>
<td><%=vec.get(i+4) %></td>
<input type="hidden" name="userName" value="<%=vec.get(i)%>">
<input type="hidden" name="courseName" value="<%=vec.get(i+4)%>">
<input type="hidden" name="id" value="<%=vec.get(i+5)%>">
<td><a href="/FinalProject/dropCourses?id=<%=vec.get(i+5)%>">DROP</a></td>
</TR>
<%
i	=	i	+	5;
} %>
</table>

</td>

</tr></table>
</form>
</div>
</body>
<script>
function home(){
	window.open("/FinalProject/jsp/Success.jsp","_parent");
}
</script>
</html>