<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
    <%@page import="DbConnectors.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<title>UCM</title>
</head>
<body>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>
<form action=/FinalProject/retriveCourses name=myform method=post>
<table style="width: 100%;height: 90%"><tr>
<td width="30%">
<div><jsp:include page='left.jsp'></jsp:include><html></div>
</td>
<td valign="top">
<h1>For Selection Of Courses select the Semester</h1>
Semester:
<select name=intake id=intake>
<%Vector intakes=(Vector)DbMethods.getIntake();
for(int i=0;i<intakes.size();i++){
%>
<option value="<%=intakes.get(i) %>"><%=intakes.get(i) %></option>
<%} %>
</select>

<input type=button class=button onclick="retrive()" value=Retrieve > 

</td>
<td ></td>
</tr></table>

</form></div>
</body>
<script type="text/javascript">
function retrive(){
		document.myform.submit();

}
</script>
</html>