<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Vector rows = (Vector) request.getAttribute("columns");
Vector columns = (Vector) request.getAttribute("rows");
int columnCount	=	columns.size();
%>
<html>
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
		<!-- 	<th>EDIT</th>
		 -->	<%
				for (int i = 0; i < columnCount; i++) {
			%>
			<th><%=columns.get(i)%></th>
			<%
				}
			%>
		</tr>
		<%
			int count = 0;
			for (int i = 0; i < rows.size() / columnCount; i++) {
		%>
		<tr>

			<%
				for (int j = 0; j < columnCount; j++) {
			%>
			<td><%=rows.get(count)%></td>
			<%
				count = count + 1;
						}
			%>

		</tr>
		<%
			}
		%>
	</table>
</body>
</html>