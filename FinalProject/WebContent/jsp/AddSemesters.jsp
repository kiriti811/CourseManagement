<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String	message	=	"Semester Added Successfully";
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<title>Admin Login</title>
</head>
<script type="text/javascript">
function Reset() {
	window.open("/FinalProject/jsp/AddSemesters.jsp","_self");
}
function test() {
	if (document.getElementById("semesters").value == "") {
		alert("Please Enter the Semester");
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
<form name="myform" action="/FinalProject/insertSemesters" method="POST">
<table style="width: 100%;height: 90%"><tr>
<td width="30%">
<div><jsp:include page='left.jsp'></jsp:include><html></div>
</td>
<td valign="top">
<h1>Add Semesters</h1>
<table>
	<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>

<tr><td>Semesters:</td><td><input type="text" name="semesters" id="semesters"></td></tr>
</textarea></td></tr>
<tr><td><input class="button"  type=button value=submit onclick="test()"></td>
<td><input class="button"  type=button value=Reset onclick="Reset()"></td></tr>
</table>
<iframe src="/FinalProject/list?method=intake"></iframe>
</td></tr></table>
</form>

</body></center>
</html>