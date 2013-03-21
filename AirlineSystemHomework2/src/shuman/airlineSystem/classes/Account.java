package shuman.airlineSystem.classes;

public class Account {
	private int accountId, routingNumber;
	private double balance;
	private String holderName;
	private Boolean approved;
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getRoutingNumber() {
		return routingNumber;
	}
	public void setRoutingNumber(int routingNumber) {
		this.routingNumber = routingNumber;
	}
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public Boolean getApproved() {
		return approved;
	}
	public void setApproved(Boolean approved) {
		this.approved = approved;
	}
}
