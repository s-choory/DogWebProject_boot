package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		int perPage = pDTO.getPerPage();   //한페이지 5개씩 
		int offset = (curPage - 1) * perPage;
		List<PostsDTO> list =  session.selectList("PostsMapper.selectSearch" , map , new RowBounds(offset, perPage));
		//레코드 시작 번호, 읽어올 갯수 
		System.out.println("list이다~==========="+list);
		System.out.println("list이다~==========="+list.size());
		
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

		public int selecTotalCount2(String UserID, String order) {
			Map<String, String> map = new HashMap<>();
			map.put("UserID", UserID);
			map.put("order", order);
			return session.selectOne("PostsMapper.getTotalCount", map); 
		}

		public PageDTO selectOrder2(HashMap<String, String> map, int curPage, PageDTO pDTO) {
			int perPage = pDTO.getPerPage();   //한페이지 2개씩 
			int offset = (curPage - 1) * perPage;
			
			String order = map.get("order");
			System.out.println("================================\n 좋아요누른글 이어야 함:"+order);
		    List<PostsDTO> list;
		    if (order.equals("내가 쓴 글")) {
		    	System.out.println("PAGEDAO부분>> 내가 쓴  글, ORDER2 실행 ");
		        list = session.selectList("PostsMapper.selectOrder2", map, new RowBounds(offset, perPage));
		    } else if (order.equals("좋아요 누른 글")) {
		    	System.out.println("PAGEDAO부분>> 좋아요 누른 글, ORDER3 실행 ");
		    	list = session.selectList("PostsMapper.selectOrder3", map, new RowBounds(offset, perPage));
		    } else {
		        // 기본적으로 어떤 쿼리를 실행할지 정의해야 합니다.
		        // 예외 처리 등을 추가로 구현할 수 있습니다.
		        throw new IllegalArgumentException("잘못된 order 값입니다.");
		    }

		    pDTO.setCurPage(curPage);
		    pDTO.setList(list);
		    
		    return pDTO;
		}

	
}// end class
