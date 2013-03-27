package shuman.airlineSystem.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shuman.airlineSystem.classes.Account;
import shuman.airlineSystem.classes.Flight;
import shuman.airlineSystem.classes.User;
import shuman.airlineSystem.classes.UserSystem;

/**
 * Servlet implementation class Bank
 */
public class BookingUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// NOTE: code generated by ASIDE
			UserSystem users = new UserSystem();
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			ArrayList<Flight> flightCart = (ArrayList<Flight>)session.getAttribute("FlightCart");
			Account account = (Account)session.getAttribute("account");

			
			/*
			 * Double Check that we were approved. We should be, since this servlet was only called if approved
			 */
			if(account != null){ //Account could only be null if servlet is improperly called. 				
				if(account.getApproved()){ //This information is coming from session data saved previously.
					User user = (User)session.getAttribute("user");
					users.addBooking(user.getUser(), flightCart, account);
					System.out.println("Booking History Updated");
				}
				
				session.removeAttribute("account"); //Reset account attribute so we can use a new account next time.
			}
		
	}

}
