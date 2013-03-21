package shuman.airlineSystem.classes;

public class Booking extends Flight{
private int accountID;
private int bookingID;

public int getAccountID() {
	return accountID;
}
public void setAccountID(int accountID) {
	this.accountID = accountID;
}
public int getBookingID() {
	return bookingID;
}
public void setBookingID(int bookingID) {
	this.bookingID = bookingID;
}

}
