<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Airline Reservation Flight Search</title>
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
%>
<center>
<h1>Airline Reservation System</h1>
<div>${errorMessage } </div>
</center>
<p align="right">User: <jsp:getProperty name="user" property="user"/> </p>
<%--Form created to accept input data for flight query; submit action directs to flightResults.jsp  --%>
<form action="flightQuery" method="post">

Source: <input type="text" name="source"> <br>
Destination: <input type="text" name="destination"> <br>
Date of Travel: <input type="text" name="depart"> to <input type="text" name="return"> <br>
Number of Seats: <input type="text" name="seats"> <br>
Class: <select name="flightClass">

<option value="">Please select an option</option>
<option value="economy">Economy</option>
<option value="business">Business</option>
<option value="firstclass">First Class</option>

</select>

<br>

<input type="submit" value="Search">
<input type="button" value="Booking History" onclick="location.href('BookingHistory')">
<input type="button" value="Logout" onclick="location.href('Logout')">	
</form>

</body>
</html>