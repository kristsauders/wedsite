<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/RSVP";
Connection con = DriverManager.getConnection(url,"krists", "Seattle2010");
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stmt.executeQuery("SELECT * " + "from rsvp ORDER BY id");
String auth = (String) session.getAttribute("rsvpAdminAuth");
if((auth==null) || (!auth.equalsIgnoreCase("true"))){
	response.sendRedirect("rsvp.jsp");
}
%>
<table border="1">
	<tr><td><b>Name</b></td><td><b>Guests</b></td><td><b>Attending</b></td><td><b>Comments</b></td><td><b>Date</b></td><tr>
	<%
while(rs.next()){
int theInt= rs.getInt("id");
String name = rs.getString("name");
String guests = rs.getString("guests");
String attending = rs.getString("attending");
String comments = rs.getString("comments");
String date = rs.getString("date");
%>
		<tr><td align="center"><%=name%></td><td align="center"><%=guests%></td><td><%=attending%></td><td><%=comments%></td><td><%=date%></td><tr>
	<%
}
%>
	</table>