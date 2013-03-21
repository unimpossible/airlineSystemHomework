package shuman.airlineSystem.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shuman.airlineSystem.classes.Flight;
import shuman.airlineSystem.classes.UserSystem;

/**
 * Servlet implementation class FlightSearchResults
 */
public class FlightSearchResults extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightSearchResults() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("isAvailable", true); //reset this flag for the view and book servlet
		Flight flight = new Flight();
		UserSystem users = new UserSystem();
		flight = users.getFlight(1); //TODO update this with the actual one we're searching for
		if(flight == null) //Flight was not found even though it was there earlier
		{
			System.out.println("Flight returned null.");
			RequestDispatcher dispatch = request.getRequestDispatcher("flightSearch.jsp");
			dispatch.forward(request, response);
		}
		else { //flight returned fine.
			request.setAttribute("flightInfo", flight);
			System.out.println("FlightSearchResults Servlet redirect to viewBook"); //TODO remove this shit
			RequestDispatcher dispatch = request.getRequestDispatcher("viewBook.jsp");
			dispatch.forward(request, response);
		}
	}

}
