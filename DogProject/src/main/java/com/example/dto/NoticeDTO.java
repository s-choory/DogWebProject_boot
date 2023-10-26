package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Notice")
public class NoticeDTO {
	private int NoticeID;
	private String Title;
	private String Content;
	private String CreationTime;
	private int Hit;
	
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int noticeID, String title, String content, String creationTime, int hit) {
		super();
		NoticeID = noticeID;
		Title = title;
		Content = content;
		CreationTime = creationTime;
		Hit = hit;
	}

	public int getNoticeID() {
		return NoticeID;
	}

	public void setNoticeID(int noticeID) {
		NoticeID = noticeID;
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

	public String getCreationTime() {
		return CreationTime;
	}

	public void setCreationTime(String creationTime) {
		CreationTime = creationTime;
	}

	public int getHit() {
		return Hit;
	}

	public void setHit(int hit) {
		Hit = hit;
	}

	@Override
	public String toString() {
		return "NoticeDTO [NoticeID=" + NoticeID + ", Title=" + Title + ", Content=" + Content + ", CreationTime="
				+ CreationTime + ", Hit=" + Hit + "]";
	}

	
	
}
