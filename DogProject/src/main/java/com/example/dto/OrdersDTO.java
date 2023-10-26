package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Orders")
public class OrdersDTO {
	private int OrderID;
	private String UserID;
	private String OrderName;
	private String UserName;
	private String Email;
	private int PostNumber;	
	private String RodeAddress;
	private String HouseAddress;
	private String DetailAddress;
	private String PhoneNumber;
	private String PayMethod;
	private String OrderTime;
	private int TotalPrice;
	private String Requested;
	private String OrderState;
	private String paymethodcard;
	private String paymethodnumber;
	public OrdersDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersDTO(int orderID, String userID, String orderName, String userName, String email, int postNumber,
			String rodeAddress, String houseAddress, String detailAddress, String phoneNumber, String payMethod,
			String orderTime, int totalPrice, String requested, String orderState, String paymethodcard,
			String paymethodnumber) {
		super();
		OrderID = orderID;
		UserID = userID;
		OrderName = orderName;
		UserName = userName;
		Email = email;
		PostNumber = postNumber;
		RodeAddress = rodeAddress;
		HouseAddress = houseAddress;
		DetailAddress = detailAddress;
		PhoneNumber = phoneNumber;
		PayMethod = payMethod;
		OrderTime = orderTime;
		TotalPrice = totalPrice;
		Requested = requested;
		OrderState = orderState;
		this.paymethodcard = paymethodcard;
		this.paymethodnumber = paymethodnumber;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getOrderName() {
		return OrderName;
	}
	public void setOrderName(String orderName) {
		OrderName = orderName;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public int getPostNumber() {
		return PostNumber;
	}
	public void setPostNumber(int postNumber) {
		PostNumber = postNumber;
	}
	public String getRodeAddress() {
		return RodeAddress;
	}
	public void setRodeAddress(String rodeAddress) {
		RodeAddress = rodeAddress;
	}
	public String getHouseAddress() {
		return HouseAddress;
	}
	public void setHouseAddress(String houseAddress) {
		HouseAddress = houseAddress;
	}
	public String getDetailAddress() {
		return DetailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getPayMethod() {
		return PayMethod;
	}
	public void setPayMethod(String payMethod) {
		PayMethod = payMethod;
	}
	public String getOrderTime() {
		return OrderTime;
	}
	public void setOrderTime(String orderTime) {
		OrderTime = orderTime;
	}
	public int getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getRequested() {
		return Requested;
	}
	public void setRequested(String requested) {
		Requested = requested;
	}
	public String getOrderState() {
		return OrderState;
	}
	public void setOrderState(String orderState) {
		OrderState = orderState;
	}
	public String getPaymethodcard() {
		return paymethodcard;
	}
	public void setPaymethodcard(String paymethodcard) {
		this.paymethodcard = paymethodcard;
	}
	public String getPaymethodnumber() {
		return paymethodnumber;
	}
	public void setPaymethodnumber(String paymethodnumber) {
		this.paymethodnumber = paymethodnumber;
	}
	@Override
	public String toString() {
		return "OrdersDTO [OrderID=" + OrderID + ", UserID=" + UserID + ", OrderName=" + OrderName + ", UserName="
				+ UserName + ", Email=" + Email + ", PostNumber=" + PostNumber + ", RodeAddress=" + RodeAddress
				+ ", HouseAddress=" + HouseAddress + ", DetailAddress=" + DetailAddress + ", PhoneNumber=" + PhoneNumber
				+ ", PayMethod=" + PayMethod + ", OrderTime=" + OrderTime + ", TotalPrice=" + TotalPrice
				+ ", Requested=" + Requested + ", OrderState=" + OrderState + ", paymethodcard=" + paymethodcard
				+ ", paymethodnumber=" + paymethodnumber + "]";
	}
	
	
}