<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css"
	HREF="/FinalProject/css/styles.css">
<title>Admin Login</title>
</head>
<script type="text/javascript">
	function Search() {
			document.myform.submit();
	}
</script>
<center>
	<body>
		<div><jsp:include page='header.jsp'></jsp:include><html>
		</div>
		<div>

			<html>
<form action="/FinalProject/searchStudent" name="myform" method="POST">
	<table style="width: 100%; height: 90%">
		<tr>
			<td width="30%">
				<div><jsp:include page='left.jsp'></jsp:include>
				</div>
			</td><td>
<%
Vector vec	=	null;
if(vec!=request.getAttribute("studentsInfo"))
{
Vector studentInfo = (Vector) request.getAttribute("studentsInfo");
%>
	<table border=1>
		<tr>
		<th>Login Id</th>
		<th>Name</th>
		<th>Address</th>
		<th>Phone Number</th>
		</tr>
<%for(int i=0; i<studentInfo.size();i++){ %>
		<tr>
		<td><a href="/FinalProject/jsp/changeUserPassword.jsp?loginid=<%=studentInfo.get(i) %>"><%=studentInfo.get(i) %></a></td>
		<td><%=studentInfo.get(i+1) %></td>
		<td><%=studentInfo.get(i+2) %></td>
		<td><%=studentInfo.get(i+3) %></td>
		
		</tr>
		<%
		i	=	i	+3;		
} 
}%>
	</table>
		</td>
		</tr>
	</table>
</form>
	</body>
</center>
</html>