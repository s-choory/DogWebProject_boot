package com.example.dto;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

@Alias("Reviews")
public class ReviewsDTO {
	private int ReviewID;
	private int OrderID;
	private int ProductID;
	private String UserAlias;
	private String CreationTime;
	private double Rating;
	private String ReviewContent;
	
	private String rImg;
	private String rThumbImg;
	
	private String ReviewType;
	private byte[] USERIMG;
	private String rComment;
	
	
	public String getrComment() {
		return rComment;
	}
	public void setrComment(String rComment) {
		this.rComment = rComment;
	}
	@Override
	public String toString() {
		return "ReviewsDTO [ReviewID=" + ReviewID + ", OrderID=" + OrderID + ", ProductID=" + ProductID + ", UserAlias="
				+ UserAlias + ", CreationTime=" + CreationTime + ", Rating=" + Rating + ", ReviewContent="
				+ ReviewContent + ", rImg=" + rImg + ", rThumbImg=" + rThumbImg + ", ReviewType=" + ReviewType
				+ ", USERIMG=" + Arrays.toString(USERIMG) + ", rComment=" + rComment + "]";
	}
	public ReviewsDTO(int reviewID, int orderID, int productID, String userAlias, String creationTime, double rating,
			String reviewContent, String rImg, String rThumbImg, String reviewType, byte[] uSERIMG, String rComment) {
		super();
		ReviewID = reviewID;
		OrderID = orderID;
		ProductID = productID;
		UserAlias = userAlias;
		CreationTime = creationTime;
		Rating = rating;
		ReviewContent = reviewContent;
		this.rImg = rImg;
		this.rThumbImg = rThumbImg;
		ReviewType = reviewType;
		USERIMG = uSERIMG;
		this.rComment = rComment;
	}
	public byte[] getUSERIMG() {
		return USERIMG;
	}
	public void setUSERIMG(byte[] uSERIMG) {
		USERIMG = uSERIMG;
	}
	public String getrThumbImg() {
		return rThumbImg;
	}
	public void setrThumbImg(String rThumbImg) {
		this.rThumbImg = rThumbImg;
	}
	
	public String getReviewType() {
		return ReviewType;
	}
	public void setReviewType(String reviewType) {
		ReviewType = reviewType;
	}
	public ReviewsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUserAlias() {
		return UserAlias;
	}
	public void setUserAlias(String userAlias) {
		UserAlias = userAlias;
	}
	public String getrImg() {
		return rImg;
	}
	public void setrImg(String rImg) {
		this.rImg = rImg;
	}
	public int getReviewID() {
		return ReviewID;
	}
	public void setReviewID(int reviewID) {
		ReviewID = reviewID;
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getCreationTime() {
		return CreationTime;
	}
	public void setCreationTime(String creationTime) {
		CreationTime = creationTime;
	}
	public double getRating() {
		return Rating;
	}
	public void setRating(double rating) {
		Rating = rating;
	}
	public String getReviewContent() {
		return ReviewContent;
	}
	public void setReviewContent(String reviewContent) {
		ReviewContent = reviewContent;
	}

}
