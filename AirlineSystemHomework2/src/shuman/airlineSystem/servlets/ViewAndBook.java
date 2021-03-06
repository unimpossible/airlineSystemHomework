package shuman.airlineSystem.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.owasp.esapi.ESAPI;
import org.owasp.esapi.errors.IntrusionException;
import org.owasp.esapi.errors.ValidationException;

import shuman.airlineSystem.classes.Flight;
import shuman.airlineSystem.classes.User;
import shuman.airlineSystem.classes.UserSystem;

/**
 * Servlet implementation class ViewAndBook
 */
public class ViewAndBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAndBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// NOTE: code generated by ASIDE
		int flightNum, requestedSeats, availSeats;
		UserSystem users = new UserSystem();
		String errorMessage="";
		RequestDispatcher dispatch=null;
		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			@SuppressWarnings("unchecked")
			ArrayList<Flight> flightCart = (ArrayList<Flight>)session.getAttribute("FlightCart");
			if(flightCart == null)
			{
				flightCart = new ArrayList<Flight>();
			}
			
			if(user == null)
			{
				response.sendRedirect("Login");
			}
			// NOTE: code generated by ASIDE         
			 String flightNumS = ESAPI.validator().getValidInput("replace ME with validation context",
				request.getParameter("fNumber"), "HTTPParameterValue", 50, false);
			 String seatsS = ESAPI.validator().getValidInput("replace ME with validation context",
						request.getParameter("seats"), "HTTPParameterValue", 50, false);
			 flightNum = Integer.valueOf(flightNumS);
			 requestedSeats = Integer.valueOf(seatsS);
			 /**
			  * Query database for corresponding flight number
			  */
			 Flight flight = users.getFlight(flightNum);
			 
			 if(flight != null)
			 {
				 availSeats = flight.getSeatsAvail();
				 /**
				  * Check if number of seats requested is available. Returns back to view and book if not number of seats.
				  */
				 if(requestedSeats <= availSeats)
				 {
					 /*
					  * Set total cost and add flight to flight shopping cart
					  */
					 flight.setTotalCost(flight.getSeatCost() * requestedSeats);
					 flight.setNumberOfSeats(requestedSeats);
					 flightCart.add(flight);
					 session.setAttribute("FlightCart", flightCart);
					 
					 dispatch = request.getRequestDispatcher("confirmBooking.jsp");
					 
				 }
				 else
					 /*
					  * Number of requested seats is not available.
					  * Return back to view and book with an error code.
					  */
				 {
					 session.setAttribute("Flight", flight);
					 session.setAttribute("isAvailable", false);
					 errorMessage = "Enough Seats are not available";
					 request.setAttribute("errorMessage", errorMessage);
					 
				 }
				 
			 }
			 else
			 {
				 System.err.print("getFlight returned null!");
			 }
			 
			 
			 
		} catch (ValidationException e) {
			errorMessage = "Input not valid";
			request.setAttribute("errorMessage", errorMessage);
			
		} catch (IntrusionException e) {
			errorMessage = "Input not valid";
			request.setAttribute("errorMessage", errorMessage);
			
		} catch (NumberFormatException e) //in case you didn't enter a number in the view and book jsp page
		{
			errorMessage = "Input not accepted.";
			request.setAttribute("errorMessage", errorMessage);
		}
		
		if(dispatch==null)//Never assigned to go to transaction page, must have been an error
			dispatch = request.getRequestDispatcher("viewBook.jsp");
		dispatch.forward(request, response); //Finally, forward
		
	}

}
