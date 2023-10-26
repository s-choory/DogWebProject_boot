package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Like")
public class LikeDTO {

	private String userID; //회원아이디
	private int categoryID;  //카테고리 아이디   //게시글/댓글/리뷰의 고유한 번호
	private String categories;  //카테고리   //게시글/댓글/리뷰를 나눠주는 문자
	
	public LikeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public LikeDTO(String userID, int categoryID, String categories) {
		super();
		this.userID = userID;
		this.categoryID = categoryID;
		this.categories = categories;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}



	public int getCategoryID() {
		return categoryID;
	}



	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}



	public String getCategories() {
		return categories;
	}



	public void setCategories(String categories) {
		this.categories = categories;
	}



	@Override
	public String toString() {
		return "LikeDTO [userID=" + userID + ", categoryID=" + categoryID + ", categories=" + categories + "]";
	}

	
	
}		
