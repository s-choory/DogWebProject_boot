package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("Posts")
public class PostsDTO {

	private int PostID;
	private String AuthorID; // 작성자
	private String Title; // 제목
	private String Tag; // 태그
	private String Content; // 내용
	private String CreationTime; // 작성일
	private String UpdateTime; // 수정날짜
	
	//private Date CreationTime; // 작성일
	//private Date UpdateTime; // 수정날짜
	//private LocalDateTime creationtime;
	//private LocalDateTime updatetime;
	private int Likes; // 좋아요
	private String Category; // 카테고리
	private String Image; // 이미지
	private int Hit;   //조회수
	private String PostType;	//삭제 유무    // 컬럼 타입 undeleted,deleted
	
	public PostsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostsDTO(int postID, String authorID, String title, String tag, String content, String creationTime,
			String updateTime, int likes, String category, String image, int hit, String postType) {
		super();
		PostID = postID;
		AuthorID = authorID;
		Title = title;
		Tag = tag;
		Content = content;
		CreationTime = creationTime;
		UpdateTime = updateTime;
		Likes = likes;
		Category = category;
		Image = image;
		Hit = hit;
		PostType = postType;
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

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getTag() {
		return Tag;
	}

	public void setTag(String tag) {
		Tag = tag;
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

	public String getUpdateTime() {
		return UpdateTime;
	}

	public void setUpdateTime(String updateTime) {
		UpdateTime = updateTime;
	}

	public int getLikes() {
		return Likes;
	}

	public void setLikes(int likes) {
		Likes = likes;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getImage() {
		return Image;
	}

	public void setImage(String image) {
		Image = image;
	}

	public int getHit() {
		return Hit;
	}

	public void setHit(int hit) {
		Hit = hit;
	}

	public String getPostType() {
		return PostType;
	}

	public void setPostType(String postType) {
		PostType = postType;
	}

	@Override
	public String toString() {
		return "PostsDTO [PostID=" + PostID + ", AuthorID=" + AuthorID + ", Title=" + Title + ", Tag=" + Tag
				+ ", Content=" + Content + ", CreationTime=" + CreationTime + ", UpdateTime=" + UpdateTime + ", Likes="
				+ Likes + ", Category=" + Category + ", Image=" + Image + ", Hit=" + Hit + ", PostType=" + PostType
				+ "]";
	}
	
	
}// end class