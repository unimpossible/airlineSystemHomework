package shuman.airlineSystem.classes;

import java.sql.Timestamp;

public class Flight {

	private int flightId;
	
	private int numberOfSeats;
	private double totalCost, seatCost;
	private Timestamp departure;
	private Timestamp arrival;
	private String source, destination;
	private int seatsAvail;
	private String operator; 
	
	

	public int getFlightId() {
		return flightId;
	}

	public void setFlightId(int flightNum) {
		this.flightId = flightNum;
	}

	public int getNumberOfSeats() {
		return numberOfSeats;
	}

	public void setNumberOfSeats(int numberOfSeats) {
		this.numberOfSeats = numberOfSeats;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	public Timestamp getDeparture() {
		return departure;
	}

	public void setDeparture(Timestamp departure) {
		this.departure = departure;
	}

	public Timestamp getArrival() {
		return arrival;
	}

	public void setArrival(Timestamp timestamp) {
		this.arrival = timestamp;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getSeatsAvail() {
		return seatsAvail;
	}

	public void setSeatsAvail(int seatsAvail) {
		this.seatsAvail = seatsAvail;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public double getSeatCost() {
		return seatCost;
	}

	public void setSeatCost(double seatCost) {
		this.seatCost = seatCost;
	}

}
