package com.example.dto;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Alias("Users")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class UsersDTO {
	
	private int Post; 
	private String DetailAddress; 
	private String UserID;	//사용자 아이디
	private String UserName;	//사용자 이름
	private String UserAlias;
	private String Email1;
	private String Email2;
	private String Password;	//사용자 패스워드
	private String RodeAddress;
	private String HouseAddress;
	private String PhoneNumber;
	private String DogName;
	private String DogType;
	private String UserType;	//사용자 타입
	private byte[] USERIMG;
	
    @Builder
	public UsersDTO(String UserID, String Password, String UserName, String UserType) {
        this.UserID = UserID;
        this.Password = Password;
        this.UserName = UserName;
        this.UserType = UserType;
    }
	
	public UsersDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UsersDTO(int post, String detailAddress, String userID, String userName, String userAlias, String email1,
			String email2, String password, String rodeAddress, String houseAddress, String phoneNumber, String dogName,
			String dogType, String userType, byte[] uSERIMG) {
		super();
		Post = post;
		DetailAddress = detailAddress;
		UserID = userID;
		UserName = userName;
		UserAlias = userAlias;
		Email1 = email1;
		Email2 = email2;
		Password = password;
		RodeAddress = rodeAddress;
		HouseAddress = houseAddress;
		PhoneNumber = phoneNumber;
		DogName = dogName;
		DogType = dogType;
		UserType = userType;
		USERIMG = uSERIMG;
	}

	public int getPost() {
		return Post;
	}

	public void setPost(int post) {
		Post = post;
	}

	public String getDetailAddress() {
		return DetailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}

	public String getUserID() {
		return UserID;
	}

	public void setUserID(String userID) {
		UserID = userID;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getUserAlias() {
		return UserAlias;
	}

	public void setUserAlias(String userAlias) {
		UserAlias = userAlias;
	}

	public String getEmail1() {
		return Email1;
	}

	public void setEmail1(String email1) {
		Email1 = email1;
	}

	public String getEmail2() {
		return Email2;
	}

	public void setEmail2(String email2) {
		Email2 = email2;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
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

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public String getDogName() {
		return DogName;
	}

	public void setDogName(String dogName) {
		DogName = dogName;
	}

	public String getDogType() {
		return DogType;
	}

	public void setDogType(String dogType) {
		DogType = dogType;
	}

	public String getUserType() {
		return UserType;
	}

	public void setUserType(String userType) {
		UserType = userType;
	}

	public byte[] getUSERIMG() {
		return USERIMG;
	}

	public void setUSERIMG(byte[] uSERIMG) {
		USERIMG = uSERIMG;
	}

	@Override
	public String toString() {
		return "UsersDTO [Post=" + Post + ", DetailAddress=" + DetailAddress + ", UserID=" + UserID + ", UserName="
				+ UserName + ", UserAlias=" + UserAlias + ", Email1=" + Email1 + ", Email2=" + Email2 + ", Password="
				+ Password + ", RodeAddress=" + RodeAddress + ", HouseAddress=" + HouseAddress + ", PhoneNumber="
				+ PhoneNumber + ", DogName=" + DogName + ", DogType=" + DogType + ", UserType=" + UserType
				+ ", USERIMG=" + Arrays.toString(USERIMG) + "]";
	}
	
	public UsersDTO(String userID, byte[] uSERIMG) {
		super();
		UserID = userID;
		USERIMG = uSERIMG;
	}


	
}
