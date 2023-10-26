package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Request")
public class RequestDTO {
	
	private String userid; //사용자
	private int requestid; //문의 번호
	private String category; //문의 종류
	private String tag; //문의 말머리
	private String content; //문의 내용 (답변대기, 답변완료, 재문의)
	private int count;
	private String recontent; //문의 답변
	private String requeststate; //문의 상태
	private String createtime; //생성시간
	public RequestDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RequestDTO(String userid, int requestid, String category, String tag, String content, int count,
			String recontent, String requeststate, String createtime) {
		super();
		this.userid = userid;
		this.requestid = requestid;
		this.category = category;
		this.tag = tag;
		this.content = content;
		this.count = count;
		this.recontent = recontent;
		this.requeststate = requeststate;
		this.createtime = createtime;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRequestid() {
		return requestid;
	}
	public void setRequestid(int requestid) {
		this.requestid = requestid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getRequeststate() {
		return requeststate;
	}
	public void setRequeststate(String requeststate) {
		this.requeststate = requeststate;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "RequestDTO [userid=" + userid + ", requestid=" + requestid + ", category=" + category + ", tag=" + tag
				+ ", content=" + content + ", count=" + count + ", recontent=" + recontent + ", requeststate="
				+ requeststate + ", createtime=" + createtime + "]";
	}
	
}
