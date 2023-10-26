package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.NoticeDTO;
import com.example.dto.PageNoticeDTO;

@Repository
public class PageNoticeDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 카테고리 total값 계산
	public int totalCount(HashMap<String, String> map) {
		System.out.println("NoticeDAO totalCount>>>>>>"+ map.toString());	
		return session.selectOne("NoticeMapper.totalCount", map);
	}
	
	// 카테고리 페이징 계산
	public PageNoticeDTO selectOrder(HashMap<String, String> map, int curPage, PageNoticeDTO pnDTO) {
		int perPage = pnDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		List<NoticeDTO> nlist =  session.selectList("NoticeMapper.selectOrder" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		pnDTO.setCurPage(curPage);//현재 페이지번호
		pnDTO.setNlist(nlist);//페이지 에 해당 데이터
		pnDTO.setTotalCount(totalCount(map));//전체 레코드 갯수 저장
		System.out.println("pagedao에서 넘어옴+++"+pnDTO);
		return pnDTO;
	}
	
	// 검색조건 total값 계산
	public int selectTotalCount(HashMap<String, String> map) {
		System.out.println("NoticeDAO selecttotalCount>>>>>>"+ map.toString());	
		return session.selectOne("NoticeMapper.selectTotalCount", map);
	}
	
	// 검색조건 페이징 계산
	public PageNoticeDTO selectSearch(HashMap<String, String> map, int curPage, PageNoticeDTO pnDTO) {
		int perPage = pnDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		List<NoticeDTO> nlist =  session.selectList("NoticeMapper.selectSearch" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		pnDTO.setCurPage(curPage);//현재 페이지번호
		pnDTO.setNlist(nlist);//페이지 에 해당 데이터
		pnDTO.setTotalCount(selectTotalCount(map));//전체 레코드 갯수 저장
		System.out.println("selectSearch에서 넘어옴"+pnDTO);
		return pnDTO;
	}
	
	

	
}// end class
