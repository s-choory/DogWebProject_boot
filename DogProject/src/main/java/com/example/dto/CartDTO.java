package com.example.dto;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

@Alias("Cart")
public class CartDTO implements Serializable{

	private int CartNum;
	private String UserID;
	private int ProductID;
	private String ProductName;
	private int Price;
	private String Psize;
	private int Amount;
	private String Color;
	private String Image;
	private int OrderNumber;
	private String OrderState;
	private String ReviewFlag;
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getCartNum() {
		return CartNum;
	}
	public void setCartNum(int cartNum) {
		CartNum = cartNum;
	}
	public int getOrderNumber() {
		return OrderNumber;
	}
	public void setOrderNumber(int orderNumber) {
		OrderNumber = orderNumber;
	}
	public String getOrderState() {
		return OrderState;
	}
	public void setOrderState(String orderState) {
		OrderState = orderState;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getPsize() {
		return Psize;
	}
	public void setPsize(String psize) {
		Psize = psize;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public String getColor() {
		return Color;
	}
	public void setColor(String color) {
		Color = color;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public CartDTO(int cartNum, String userID, int productID, String productName, int price, String psize, int amount,
			String color, String image, int orderNumber, String orderState, String reviewFlag) {
		super();
		CartNum = cartNum;
		UserID = userID;
		ProductID = productID;
		ProductName = productName;
		Price = price;
		Psize = psize;
		Amount = amount;
		Color = color;
		Image = image;
		OrderNumber = orderNumber;
		OrderState = orderState;
		ReviewFlag = reviewFlag;
	}
	@Override
	public String toString() {
		return "CartDTO [CartNum=" + CartNum + ", UserID=" + UserID + ", ProductID=" + ProductID + ", ProductName="
				+ ProductName + ", Price=" + Price + ", Psize=" + Psize + ", Amount=" + Amount + ", Color=" + Color
				+ ", Image=" + Image + ", OrderNumber=" + OrderNumber + ", OrderState=" + OrderState + ", ReviewFlag="
				+ ReviewFlag + "]";
	}
	public String getReviewFlag() {
		return ReviewFlag;
	}
	public void setReviewFlag(String reviewFlag) {
		ReviewFlag = reviewFlag;
	}
	
}
