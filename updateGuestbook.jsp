<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
String name = request.getParameter("name");
String comment = request.getParameter("comment");
String date = new java.util.Date().toString();

if(name.equalsIgnoreCase("aspevisulse")){
} else {
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/guestbook";
Connection con = DriverManager.getConnection(url,"krists", "Seattle2010");
String sql = 
	  "INSERT INTO guestbook (name,comment,date) values (?,?,?)";
	  PreparedStatement pst = 
	  con.prepareStatement(sql);
	  pst.setString(1, name);
	  pst.setString(2, comment);
	  pst.setString(3, date);
	  int numRowsChanged = pst.executeUpdate();
	  pst.close();
}
%>
