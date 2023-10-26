package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("AccompanyingFacilities")
public class AccompanyingFacilitiesDTO {
	private int FacilitiesID;
	private String FacilitiesName;
	private String Category1;
	private String Category2;
	private String Address1;
	private String Address2;
	private double Latitude;
	private double Longitude;
	private	int PostNumber;
	private String RodeAddress;
	private String HouseAddress;
	private String PhoneNumber;
	private String DayOff;
	private String OperationHours;
	private String Parking;
	private String Restrictions;
	public AccompanyingFacilitiesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFacilitiesID() {
		return FacilitiesID;
	}
	public void setFacilitiesID(int facilitiesID) {
		FacilitiesID = facilitiesID;
	}
	public AccompanyingFacilitiesDTO(String facilitiesName, double latitude, double longitude) {
		super();
		FacilitiesName = facilitiesName;
		Latitude = latitude;
		Longitude = longitude;
	}
	public String getFacilitiesName() {
		return FacilitiesName;
	}
	public void setFacilitiesName(String facilitiesName) {
		FacilitiesName = facilitiesName;
	}
	public String getCategory1() {
		return Category1;
	}
	public void setCategory1(String category1) {
		Category1 = category1;
	}
	public String getCategory2() {
		return Category2;
	}
	public void setCategory2(String category2) {
		Category2 = category2;
	}
	public String getAddress1() {
		return Address1;
	}
	public void setAddress1(String address1) {
		Address1 = address1;
	}
	public String getAddress2() {
		return Address2;
	}
	public void setAddress2(String address2) {
		Address2 = address2;
	}
	public double getLatitude() {
		return Latitude;
	}
	public void setLatitude(double latitude) {
		Latitude = latitude;
	}
	public double getLongitude() {
		return Longitude;
	}
	public void setLongitude(double longitude) {
		Longitude = longitude;
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
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getDayOff() {
		return DayOff;
	}
	public void setDayOff(String dayOff) {
		DayOff = dayOff;
	}
	public String getOperationHours() {
		return OperationHours;
	}
	public void setOperationHours(String operationHours) {
		OperationHours = operationHours;
	}
	public String getParking() {
		return Parking;
	}
	public void setParking(String parking) {
		Parking = parking;
	}
	public String getRestrictions() {
		return Restrictions;
	}
	public void setRestrictions(String restrictions) {
		Restrictions = restrictions;
	}
	@Override
	public String toString() {
		return "AccompanyingFacilitiesDTO [FacilitiesID=" + FacilitiesID + ", FacilitiesName=" + FacilitiesName
				+ ", Category1=" + Category1 + ", Category2=" + Category2 + ", Address1=" + Address1 + ", Address2="
				+ Address2 + ", Latitude=" + Latitude + ", Longitude=" + Longitude + ", PostNumber=" + PostNumber
				+ ", RodeAddress=" + RodeAddress + ", HouseAddress=" + HouseAddress + ", PhoneNumber=" + PhoneNumber
				+ ", DayOff=" + DayOff + ", OperationHours=" + OperationHours + ", Parking=" + Parking
				+ ", Restrictions=" + Restrictions + "]";
	}
	public AccompanyingFacilitiesDTO(int facilitiesID, String facilitiesName, String category1, String category2,
			String address1, String address2, double latitude, double longitude, int postNumber, String rodeAddress,
			String houseAddress, String phoneNumber, String dayOff, String operationHours, String parking,
			String restrictions) {
		super();
		FacilitiesID = facilitiesID;
		FacilitiesName = facilitiesName;
		Category1 = category1;
		Category2 = category2;
		Address1 = address1;
		Address2 = address2;
		Latitude = latitude;
		Longitude = longitude;
		PostNumber = postNumber;
		RodeAddress = rodeAddress;
		HouseAddress = houseAddress;
		PhoneNumber = phoneNumber;
		DayOff = dayOff;
		OperationHours = operationHours;
		Parking = parking;
		Restrictions = restrictions;
	}
	
	
	
}
