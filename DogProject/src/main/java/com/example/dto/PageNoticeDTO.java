package com.example.dto;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.type.Alias;

@Alias("PageNotice")
public class PageNoticeDTO {

	private List<NoticeDTO> nlist;
	
	private int curPage=1;	// 현재 페이지
	private int perPage=10; //페이지당 10개씩
	private int totalCount; // 총 레코드 개수
	
	private int perBlock=5; // 블럭당 보여줄 페이지 개수
	private RowBounds row;	//
	

	
	public int getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(int perBlock) {
		this.perBlock = perBlock;
	}
	
	public List<NoticeDTO> getNlist() {
		return nlist;
	}
	public void setNlist(List<NoticeDTO> nlist) {
		this.nlist = nlist;
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
		return "PageNoticeDTO [nlist=" + nlist + ", curPage=" + curPage + ", perPage=" + perPage + ", totalCount="
				+ totalCount + ", perBlock=" + perBlock + ", row=" + row + "]";
	}
	
	
	
}// end DTO
