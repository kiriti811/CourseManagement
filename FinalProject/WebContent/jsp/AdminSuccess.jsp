<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*" %>
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
<table  style="width: 100%;height: 90%"><tr>
<td width="30%">
<div><jsp:include page='left.jsp'></jsp:include><html></div>
</td>
<td valign="top">
<div><p style="color: red; font-size: 20px;">Welcome to the Application</p></div>
</td>
</tr></table>

</form></div>
</body>
<script type="text/javascript">
function retrive(){
	if(document.getElementById("intake").value=="Summer"){
		document.myform.submit();
	}
	else{
		alert("Sorry Summer is the only intake where you can opt for");
	}
}
</script>
</html>