<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import ="java.util.*" %>
   <%@ page import = "java.lang.*" %>
   <%@ page import = "shuman.airlineSystem.classes.*" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Reservation Booking History</title>
</head>
<body>
<jsp:useBean id="user" class="shuman.airlineSystem.classes.User" scope="session"/>
<%
/*
* If username is not set, we want to go back to login page, not allow flight search to be displayed.
*/
if(user.getUser() == null)
{
	response.sendRedirect("login.jsp");
}
ArrayList<Booking> bookingHistory = (ArrayList<Booking>)session.getAttribute("BookingHistory");
%>
<center>
<h1>Airline Reservation System</h1>
</center>
<p align="right">User: <jsp:getProperty name="user" property="user"/> </p>
<center>
<%-- Static information placed to simulate booking history --%>
<table border = 1>
<tr>
<td>Booking Number</td>
<td>Flight Number </td>
<td>Departure Time </td>
<td>Flight Cost</td>
</tr>
<% for(Booking flight : bookingHistory){ %>
<%--Displays current flight information --%>
<tr>
<td><%=flight.getBookingID() %> </td>
<td><%=flight.getFlightId() %> </td>
<td><%= flight.getDeparture().toLocaleString() %> </td>


<td>$<%= flight.getTotalCost() %></td>
</tr>
<%} %>
</table>

<form>	
	<input type="button" value="Home" onclick="location.href('flightSearch.jsp')">	
	<input type="button" value="Logout" onclick="location.href('login.jsp')">	
</form>
</center>
</body>
</html>