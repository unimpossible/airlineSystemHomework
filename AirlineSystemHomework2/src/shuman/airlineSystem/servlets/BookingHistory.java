package shuman.airlineSystem.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import shuman.airlineSystem.classes.Booking;
import shuman.airlineSystem.classes.User;
import shuman.airlineSystem.classes.UserSystem;

/**
 * Servlet implementation class BookingHistory
 */
public class BookingHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserSystem users = new UserSystem();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		ArrayList<Booking> bookingHistory = users.getBooking(user);
		
		/*
		 * Forward booking history information to the booking history jsp page
		 */
		request.setAttribute("bookingHistory", bookingHistory);
		RequestDispatcher dispatch = request.getRequestDispatcher("bookingHistory.jsp");
		dispatch.forward(request, response);
	}

}
