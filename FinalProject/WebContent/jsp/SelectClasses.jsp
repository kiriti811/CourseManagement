<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link REL="StyleSheet" TYPE="text/css"
	HREF="/FinalProject/css/styles.css">
<title>UCM</title>
</head>
<%
	Map Data = (Map) request.getAttribute("Data");
	String userName = (String) session.getAttribute("userName");
%>

	
<center>
	<body>
		<div><jsp:include page='header.jsp'></jsp:include>
		</div>
		<div>
			<form name=myform action="addCourses" method="post">
			<input type=hidden name=userName id=userName value="<%=userName%>">
				<table style="width: 100%; height: 90%">
					<tr>
						<td width="30%" >
							<div><jsp:include page='left.jsp'></jsp:include></div>
						</td>
						<td>

							<table>
								
								<%
									Map<Integer, List> map = Data;
									Iterator<Map.Entry<Integer, List>> entries = map.entrySet()
											.iterator();
									while (entries.hasNext()) {
										Map.Entry<Integer, List> entry = entries.next();
								%>
								<tr>
									<td><b><input type="hidden" readonly="readonly"
											id="<%=entry.getKey()%>" value="<%=entry.getKey()%>"><%=entry.getKey()%></td>
									<td>
									<td><b><select name="<%=entry.getKey()%>"
											id="selectedClasses">
												<%
													String str = "";
														String str1 = "";
														List list = entry.getValue();

														for (int i = 0; i < list.size(); i++)

														{
															str = list.get(i) + "$$$" + list.get(i + 1) + "$$$"
																	+ list.get(i + 2)+"$$$" + list.get(i + 3) ;
															str1 = list.get(i) + " " + list.get(i + 1) + " "
																	+ list.get(i + 2)+ " " + list.get(i + 3);
															if(Integer.parseInt((String)list.get(i + 3))<=0){
															}else{
												%>
												<option value="<%=str%>"><%=str1%></option>
												
												<%}
													i = i + 3;
														}
												%>
										</select></td>
								</tr>
							

								<% 
	}
	%>
								<tr>
									<td><input class="button" type=submit value="save"></td>
								</tr>
							</table>
						</td>

					</tr>
				</table>
			</form></div>
	</body>
</center>
</html>