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

<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>


<script>
//Hide the input form on startup! IT will wait until successful transaction.
$(document).ready(function() {
	$('#inputForm').hide();
});
</script>


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
<form id="accountForm" action="/" >

	Name: <input type=text name=name><br>
	Address: <input type=text name=address><br>
	City: <input type=text name=city><br>
	State: <input type=text name=state><br>
	Zip Code: <input type=text name=zip><br>
	<br>
	Routing Number: <input type=text name=rt><br>
	Account Number: <input type=text name=act><br>
	
	<input type="submit" value="Confirm Transaction"> 
	<input type="button" value="Add Flights" onclick="location.href('flightSearch.jsp')">
</form>
<center><div id="response" style="font-weight:bold" ></div></center>

<div id="inputForm" >
<form onsubmit="window.print()" >
<h3>Passenger Information: </h3>
	Name: <input type=text name=name><br>
	Age: <input type=text name=age><br>
	Sex: <input type=text name=sex><br>
	<br>
	<input type="submit" value="Print Ticket">
</form>
</div>

<form>
<input type="button" value="Logout" onclick="location.href('login.jsp')">	
</form>

<script>
/*
 * Confirm_Function 
 * JQuery attaches this to form submit.
 */
 $("#accountForm").submit(function(event) {
	 
	  /* stop form from submitting normally */
	  event.preventDefault();
	 
	  /* get some values from elements on the page: */
	  var $form = $( this ),
	      route = $form.find( 'input[name="rt"]' ).val(),
	      acct = $form.find( 'input[name="act"]' ).val(),
	      url = $form.attr( 'action' );
	 
	  /* Send the data using post */
	  var posting = $.post( "Bank", { routing: route, account: acct } );

	  /* Put the results in a div */
	  posting.done(function( data ) {
		  if(data.success == 'yes'){
				$('#response').html(data.message);
				update_history();
				$('#inputForm').show();
			}
			else
				$('#response').html(data.message);
	  });
	  
	  posting.always(function(){
		  $('#accountForm').hide(); //Hide the account form regardless of the response!
	  });
	  
	});

</script>
<script>
/*
 * Function updates the booking history with AJAX Call
 */
function update_history()
{
	var request = $.ajax({
		  type: "GET",
		  url: "BookingUpdate"
		});
		}
</script>
</body>
</html>