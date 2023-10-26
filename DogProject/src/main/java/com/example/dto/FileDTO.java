package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("file")
public class FileDTO {

	private int fileid;
	private String realname;
	private String extension;
	private String filename;
	private String uploadpath;
	private String fileurl;
	private int postid;
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getExtension() {
		return extension;
	}
	public void setExtension(String extension) {
		this.extension = extension;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	@Override
	public String toString() {
		return "FileDTO [fileid=" + fileid + ", realname=" + realname + ", extension=" + extension + ", filename="
				+ filename + ", uploadpath=" + uploadpath + ", fileurl=" + fileurl + ", postid=" + postid + "]";
	}
	public FileDTO(int fileid, String realname, String extension, String filename, String uploadpath, String fileurl,
			int postid) {
		super();
		this.fileid = fileid;
		this.realname = realname;
		this.extension = extension;
		this.filename = filename;
		this.uploadpath = uploadpath;
		this.fileurl = fileurl;
		this.postid = postid;
	}
	public FileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
