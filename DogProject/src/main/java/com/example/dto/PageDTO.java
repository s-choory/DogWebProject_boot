package com.example.dto;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.Alias;

import com.example.dao.PageDAO;
import com.example.dao.PostsDAO;

@Alias("Page")
public class PageDTO {

	private List<PostsDTO> list;
	
	private int curPage=1;	// 현재 페이지
	private int perPage=5; //페이지당 10개씩
	private int totalCount; // 총 레코드 개수
	
	private int perBlock=5; // 블럭당 보여줄 페이지 개수
	private RowBounds row;	//
	

	
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	public List<PostsDTO> getList() {
		return list;
	}
	public void setList(List<PostsDTO> list) {
		this.list = list;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
//	public int getOffset() {
//		return offset;
//	}
//	public void setOffset(int offset) {
//		this.offset = offset;
//	}
	public RowBounds getRow() {
		return row;
	}
	public void setRow(RowBounds row) {
		this.row = row;
	}
	
	@Override
	public String toString() {
		return "PageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", perBlock=" + perBlock + ", row=" + row + "]";
	}
	
	public int getTotalCount(String userID) {
		PageDAO dao = new PageDAO();
		return totalCount = dao.selecTotalCount2(userID);
	}
	public List<PostsDTO> getList(String userID) {
		PostsDAO dao = new PostsDAO();
		return list = dao.selectgetList(userID);
	}
	
}// end DTO
