<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import ="java.util.*" %>
   <%@ page import = "java.lang.*" %>
   <%@ page import = "shuman.airlineSystem.classes.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Reservation Flight Transaction Confirmation</title>
</head>
<body>
<jsp:useBean id="user" class="shuman.airlineSystem.classes.User" scope="session"/>
<jsp:useBean id="account" class="shuman.airlineSystem.classes.Account" scope="request"/>

<%
/*
* If username is not set, we want to go back to login page, not allow flight search to be displayed.
*/
if(user.getUser() == null)
{
	response.sendRedirect("login.jsp");
}
ArrayList<Flight> flightCart = (ArrayList<Flight>)session.getAttribute("FlightCart");
%>
<center>
<h1>Airline Reservation System</h1>
<p align="right">User: <jsp:getProperty name="user" property="user"/> </p>
<div style = "color:red">${errorMessage}</div> <%-- This code will print an error string, if present. --%>
</center>

<%double totalCost = 0; %>
<h3>Flight Information</h3>
<table border = 1>
<tr>
<td>Flight Number </td>
<td> Departure Time </td>
<td>Arrival Time </td>
<td>Start City </td>
<td>Destination City </td>
<td>Seat Cost</td>
<td>Flight Cost</td>
</tr>
<% for(Flight flight : flightCart){ %>
<%--Displays current flight information --%>
<tr>
<%totalCost +=flight.getTotalCost(); %>
<td><%=flight.getFlightId() %> </td>
<td><%= flight.getDeparture().toLocaleString() %> </td>
<td><%= flight.getArrival().toLocaleString() %> </td>
<td><%= flight.getSource() %> </td>
<td><%= flight.getDestination() %></td>
<td>$<%= flight.getSeatCost() %> </td>
<td>$<%= flight.getTotalCost() %></td>
</tr>
<%} %>
</table>
<b>Total Cost (all flights): </b> $ <%=totalCost %>
<h3>Transaction Information:</h3>
Account ID: ${account.accountId }<br>
Account username: ${account.holderName }<br>
<div style = "color:red">${errorMessage}</div> <%-- This code will print an error string, if present. --%>

<%-- Accepts input information for passenger information only if account was approved. --%>
<%if(account.getApproved()){ %>
<form onsubmit="window.print()" >
<h3>Passenger Information: </h3>
	Name: <input type=text name=name><br>
	Age: <input type=text name=age><br>
	Sex: <input type=text name=sex><br>
	<br>
	<input type="submit" value="Print Ticket">
</form>
	<%} %>

<form> 
	<input type="button" value="Home" onclick="location.href('flightSearch.jsp')">
	<input type="button" value="Logout" onclick="location.href('Logout')">	
</form>

		




</body>
</html>