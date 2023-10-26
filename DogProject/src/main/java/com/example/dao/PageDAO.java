package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.PageDTO;
import com.example.dto.PostsDTO;

@Repository
public class PageDAO {
	
	@Autowired
	SqlSessionTemplate session;
	
	// 카테고리 total값 계산
	public int totalCount(HashMap<String, String> map) {
		return session.selectOne("PostsMapper.totalCount", map);
	}
	
	// 카테고리 페이징 계산
	public PageDTO selectOrder(HashMap<String, String> map, int curPage, PageDTO pDTO) {
		int perPage = pDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		List<PostsDTO> list =  session.selectList("PostsMapper.selectOrder" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		pDTO.setCurPage(curPage);//현재 페이지번호
		pDTO.setList(list);//페이지 에 해당 데이터
		pDTO.setTotalCount(totalCount(map));//전체 레코드 갯수 저장
		return pDTO;
	}
	
	// 검색조건 total값 계산
	public int selectTotalCount(HashMap<String, String> map) {
		return session.selectOne("PostsMapper.selectTotalCount", map);
	}
	
	// 검색조건 페이징 계산
	public PageDTO selectSearch(HashMap<String, String> map, int curPage, PageDTO pDTO) {
		int perPage = pDTO.getPerPage();   //한페이지 2개씩 
		int offset = (curPage - 1) * perPage;
		List<PostsDTO> list =  session.selectList("PostsMapper.selectSearch" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		
		pDTO.setCurPage(curPage);//현재 페이지번호
		pDTO.setList(list);//페이지 에 해당 데이터
		pDTO.setTotalCount(selectTotalCount(map));//전체 레코드 갯수 저장
		return pDTO;
	}
	
	// 특정 페이징 계산
		public PageDTO selectSearch2(HashMap<String, String> map, int curPage, PageDTO pDTO) {
			int perPage = pDTO.getPerPage();   //한페이지 2개씩 
			int offset = (curPage - 1) * perPage;
			List<PostsDTO> list =  session.selectList("PostsMapper.selectSearch" , map , new RowBounds(offset, perPage));
			//레코드 시작 번호, 읽어올 갯수 
			
			pDTO.setCurPage(curPage);//현재 페이지번호
			pDTO.setList(list);//페이지 에 해당 데이터
			pDTO.setTotalCount(selectTotalCount(map));//전체 레코드 갯수 저장
			return pDTO;
		}

		public int selecTotalCount2(String UserID) {
			return session.selectOne("PostsMapper.getTotalCount", UserID);
		}

		public PageDTO selectOrder2(HashMap<String, String> map, int curPage, PageDTO pDTO) {
			int perPage = pDTO.getPerPage();   //한페이지 2개씩 
			int offset = (curPage - 1) * perPage;
			List<PostsDTO> list =  session.selectList("PostsMapper.selectOrder2" , map , new RowBounds(offset, perPage));
			//레코드 시작 번호, 읽어올 갯수 
		
			
			pDTO.setCurPage(curPage);//현재 페이지번호
			pDTO.setList(list);//페이지 에 해당 데이터
			//pDTO.setTotalCount(totalCount(map));//전체 레코드 갯수 저장
			return pDTO;
		}

	
}// end class
