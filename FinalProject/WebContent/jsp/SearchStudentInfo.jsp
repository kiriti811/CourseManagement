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
			</td>
			<td valign="top">
				<h1>Add Courses</h1>
				<table>
					<tr>
						<td>Login Id:</td>
						<td><input type="text" name="loginid" id="loginid" 	></td>
					</tr>
<tr><td><input type="button" class="button" onclick="Search()" value="Search"></td></tr>					
				</table> 
				</td>
		</tr>
	</table>
</form>
	</body>
</center>
</html>