<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css" HREF="/FinalProject/css/styles.css">
<title>Admin Login</title>
</head>
<script type="text/javascript">
function Reset() {
	window.open("/FinalProject/jsp/SuperUserLogin.jsp","_self");
}
function test() {
	if (document.getElementById("loginid").value == "") {
		alert("Please Enter the LoginID ");
		return false;
	} else if (document.getElementById("name").value == "") {
		alert("Please Enter the Name ");
		return false;
	}
	 else if (document.getElementById("phoneNumber").value == "") {
			alert("Please Enter the phoneNumber ");
			return false;
		}
	 else if (document.getElementById("address").value == "") {
			alert("Please Enter the address ");
			return false;
		}
	 else{
		 document.myform.submit();
	 }
}
</script>
<%
String	message	=	"User Registered Successfully";
%>
<center>
<body>
<div><jsp:include page='header.jsp'></jsp:include><html></div>
<div>

<html>
<form name="myform" action="/FinalProject/insertUsers" name="myform" method="POST">
<table style="width: 100%;height: 90%"><tr>
<td width="30%">
<div><jsp:include page='left.jsp'></jsp:include><html></div>
</td>
<td valign="top">
<h1>New Users</h1>
<table>
<tr><p style="color: red"><%if(message.equals((String)request.getAttribute("message")))
{
	out.println(request.getAttribute("message"));
 }
%></p></tr>
<tr><td>Loginid:</td><td><input type="text" name="loginid" id="loginid"></td></tr>
<tr><td>User Name:</td><td><input type="text" name="name" id="name"></td></tr>
<tr><td>Phone Number:</td><td><input type="text" name="phoneNumber" id="phoneNumber"></td></tr>
<tr><td>Address:</td><td><textarea cols=25 rows=10 name="address" id="address">
</textarea></td></tr>
<tr><td><input class="button"  type=button onclick="test()" value=submit></td>
<td><input class="button"  type=button value=Reset onclick="Reset()"></td></tr>
</table>
</td></tr></table>
</form>

</body></center>
</html>