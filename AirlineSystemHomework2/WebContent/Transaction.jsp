<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <%@ page import ="java.util.*" %>
   <%@ page import = "java.lang.*" %>
   <%@page import="shuman.airlineSystem.classes.Flight"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Reservation Flight Transaction</title>
</head>

<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>

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
ArrayList<Flight> flightCart = (ArrayList<Flight>)session.getAttribute("FlightCart");
%>
<center>
<h1>Airline Reservation System</h1>
<div class="error">${errorMessage }</div>
</center>
<p align="right">User: <jsp:getProperty name="user" property="user"/> </p>


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
<%double totalCost = 0; %>
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
<%-- Accepts input information for billing and passes variables to transactionConfirmation.jsp --%>
<form id="accountForm" action="TransactionConfirmation" method="post">

	Name: <input type=text name=name><br>
	Address: <input type=text name=address><br>
	City: <input type=text name=city><br>
	State: <input type=text name=state><br>
	Zip Code: <input type=text name=zip><br>
	<br>
	Routing Number: <input type=text name=routing><br>
	Account Number: <input type=text name=account><br>


	<input id="submitBtn" type="submit" value="Confirm Transaction"> 
	<input type="button" value="Add Flights" onclick="location.href('flightSearch.jsp')">
	<input type="button" value="Logout" onclick="location.href('login.jsp')">	
	
			
</form>

		




</body>
</html>