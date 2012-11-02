<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>

<%
String password = request.getParameter("password");

if(password!=null) {
	if(password.equalsIgnoreCase("bigday12")) {
		session.setAttribute("rsvpAuth","true");
		response.sendRedirect("updateRsvp.jsp");
	} else if(password.equalsIgnoreCase("negative1Year")) {
		session.setAttribute("rsvpAdminAuth","true");
		response.sendRedirect("getRsvp.jsp");
	} else {
	response.sendRedirect("rsvp.jsp");
	}
}
   %>