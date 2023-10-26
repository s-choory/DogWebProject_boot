package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Comments")
public class CommentsDTO {

	private int CommentID;  //댓글 고유번호
	private int PostID;  //게시글 번호 (Posts PostID 참조)
	private String AuthorID; //댓글 작성자 번호
	private String Content;  //댓글 내용
	private String CreationTime; //댓글 작성시간
	private int ParentCommentID; //부모댓글(댓글 고유번호)(대댓글 작성 시 기준필요)
	private int repIndent; //댓글 들여쓰기(쓸 때마다 하나씩 띄어쓰기)
	private String CommentType; // 컬럼 타입 undeleted,deleted
	
	public CommentsDTO() {}

	public CommentsDTO(int commentID, int postID, String authorID, String content, String creationTime,
			int parentCommentID, int repIndent, String commentType) {
		super();
		CommentID = commentID;
		PostID = postID;
		AuthorID = authorID;
		Content = content;
		CreationTime = creationTime;
		ParentCommentID = parentCommentID;
		this.repIndent = repIndent;
		CommentType = commentType;
	}

	public int getCommentID() {
		return CommentID;
	}

	public void setCommentID(int commentID) {
		CommentID = commentID;
	}

	public int getPostID() {
		return PostID;
	}

	public void setPostID(int postID) {
		PostID = postID;
	}

	public String getAuthorID() {
		return AuthorID;
	}

	public void setAuthorID(String authorID) {
		AuthorID = authorID;
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

	public int getParentCommentID() {
		return ParentCommentID;
	}

	public void setParentCommentID(int parentCommentID) {
		ParentCommentID = parentCommentID;
	}

	public int getRepIndent() {
		return repIndent;
	}

	public void setRepIndent(int repIndent) {
		this.repIndent = repIndent;
	}

	public String getCommentType() {
		return CommentType;
	}

	public void setCommentType(String commentType) {
		CommentType = commentType;
	}

	@Override
	public String toString() {
		return "CommentsDTO [CommentID=" + CommentID + ", PostID=" + PostID + ", AuthorID=" + AuthorID + ", Content="
				+ Content + ", CreationTime=" + CreationTime + ", ParentCommentID=" + ParentCommentID + ", repIndent="
				+ repIndent + ", CommentType=" + CommentType + "]";
	}


	
}
