<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Reservation Flight Results</title>
</head>
<body>
<%@ page import="java.util.ArrayList" %>
<%@ page import="shuman.airlineSystem.classes.Flight" %>

<jsp:useBean id="flight" class="shuman.airlineSystem.classes.Flight" scope="session"/>
<%-- <jsp:useBean id="searchList" type="ArrayList<Flight>" scope="session"/>--%>
<% ArrayList<Flight> searchList = (ArrayList<Flight>)session.getAttribute("searchList"); %>
<jsp:useBean id="user" class="shuman.airlineSystem.classes.User" scope="session"/>
<%
/*
* If username is not set, we want to go back to login page, not allow flight search to be displayed.
*/
if(user.getUser() == null)
{
	response.sendRedirect("login.jsp");
}
%>
<center>
<h1>Airline Reservation System</h1>
<p align="right">User: <jsp:getProperty name="user" property="user"/> </p>
<%-- Table for flight search results --%>
<table border=1>

<tr>
	<td>Flight Number</td>
	<td>Operator</td>
	<td>Departure Time</td>
	<td>Arrival Time</td>
	<td>Seats Available</td>
	<td>Cost</td>
	<td>Action</td>
</tr>


<%for (int x = 0; x < searchList.size(); x++){
	Flight fs = new Flight();
	fs = (Flight) searchList.get(x);
		
%>

	<tr>
	
		<td><%= fs.getFlightId() %></td>
		<td><%= fs.getOperator() %></td>
		<td><%= fs.getDeparture() %></td>
		<td><%= fs.getArrival() %></td>
		<td><%= fs.getSeatsAvail() %></td>
		<td><%= fs.getSeatCost() %></td>
		<td>
			<form action="FlightSearchResults" method="post">
				<input type="hidden" name="flightId" value=<%= fs.getFlightId() %>>
				<input type="submit" value="View and Book">
			</form>
		</td>
	
	</tr>	
		
		
<% } %>	


</table>
<%-- Form buttons to return to the flight search page or logout --%>
<form>	
	<input type="button" value="Home" onclick="location.href('flightSearch.jsp')">	
	<input type="button" value="Logout" onclick="location.href('Logout')">	
</form>
</center>
</body>
</html>