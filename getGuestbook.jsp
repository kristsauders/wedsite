<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% 
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/guestbook";
Connection con = DriverManager.getConnection(url,"krists", "Seattle2010");
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stmt.executeQuery("SELECT * " + "from guestbook ORDER BY id");

System.out.println("Display all results:");
while(rs.next()){
int theInt= rs.getInt("id");
String name = rs.getString("name");
String comment = rs.getString("comment");
String date = rs.getString("date");
}
%>