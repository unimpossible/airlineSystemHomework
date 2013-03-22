<%@page import="shuman.airlineSystem.classes.Flight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Reservation Flight View and Book</title>
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
Flight flightInfo = (Flight) request.getAttribute("flightInfo");
%>
<center>
<h1>Airline Reservation System</h1>
<div> ${errorMessage }</div>
</center>
<p align="right">User: <jsp:getProperty name="user" property="user"/> </p>



<%-- getParameters simulate retrieving data from the POST method --%>
<% int fNumber = flightInfo.getFlightId(); %>
<% String operator = flightInfo.getOperator(); %>
<% String dTime = flightInfo.getDeparture().toLocaleString(); %> 
<% String aTime = flightInfo.getArrival().toLocaleString(); %>
<% String cost = String.valueOf(flightInfo.getSeatCost()); %>


<% long dur = (flightInfo.getArrival().getTime() - flightInfo.getDeparture().getTime()) / (3600000); //Compute Duration! TODO  %>
<% String duration = String.valueOf(dur);  %>


<%--Display information of the flight selected --%>
<form action="ViewAndBook" method="post">

Flight Number: <%=fNumber %> <br>
Operator: <%=operator %> <br>
Departure Time: <%= dTime %> <br>
Arrival Time: <%= aTime %> <br>
Cost: $<%= cost %> <br>
Duration: <%= duration %> hours <br>
<%-- If this page is returning, we will return with a flag stating that the  --%>
<% if((Boolean)session.getAttribute("isAvailable") == false){ %>
<%		System.out.print("Requested number of seats was not available. There are " + flightInfo.getSeatsAvail() + " seats available."); %>
<% } %>
Number of Seats: <input type=text name=seats value="1"><br>
Type of Jet: Boeing 596 <br>
<br>

			<%-- Select button posts data hidden in input fields to Transaction.jsp --%>
			<input type="hidden" name="fNumber" value=<%=fNumber %>>
			
			<input type="submit" value="Select"> 
			<input type="button" value="Home" onclick="location.href('flightSearch.jsp')">
			<input type="button" value="Back" onclick="location.href('flightResults.jsp')">
			<input type="button" value="Logout" onclick="location.href('Logout')">	
			
</form>

		




</body>
</html>