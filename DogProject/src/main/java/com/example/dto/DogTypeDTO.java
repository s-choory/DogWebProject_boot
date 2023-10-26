package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("DogType")
public class DogTypeDTO {
	private String DogName;
	private String Picture;
	private String Personality;
	private String Characteristic;
	private String Introduction;
	private String dogSize;
	private int Popularity;
	
	public DogTypeDTO() {
		super();
	}
	public DogTypeDTO(String dogName, String picture, String personality, String characteristic, String introduction,
			String dogsize, int popularity) {
		super();
		DogName = dogName;
		Picture = picture;
		Personality = personality;
		Characteristic = characteristic;
		Introduction = introduction;
		dogSize = dogsize;
		Popularity = popularity;
	}
	public String getDogName() {
		return DogName;
	}
	public String getPicture() {
		return Picture;
	}
	public String getPersonality() {
		return Personality;
	}
	public String getCharacteristic() {
		return Characteristic;
	}
	public String getIntroduction() {
		return Introduction;
	}
	public String getdogSize() {
		return dogSize;
	}
	public int getPopularity() {
		return Popularity;
	}
	@Override
	public String toString() {
		return "DogTypeDTO [DogName=" + DogName + ", Picture=" + Picture + ", Personality=" + Personality
				+ ", Characteristic=" + Characteristic + ", Introduction=" + Introduction + ", dogSize=" + dogSize
				+ ", Popularity=" + Popularity + "]";
	}
	

}
