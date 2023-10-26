package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("FAQ")
public class FAQDTO {
	private int FaqID;
	private String Title;
	private String Content;
	public FAQDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQDTO(int faqID, String title, String content) {
		super();
		FaqID = faqID;
		Title = title;
		Content = content;
	}
	public int getFaqID() {
		return FaqID;
	}
	public void setFaqID(int faqID) {
		FaqID = faqID;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	@Override
	public String toString() {
		return "FAQDTO [FaqID=" + FaqID + ", Title=" + Title + ", Content=" + Content + "]";
	}
	

	
}
