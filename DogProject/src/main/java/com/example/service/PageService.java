package com.example.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PageDAO;
import com.example.dto.PageDTO;

@Service("Pageservice")
public class PageService {
	@Autowired
	PageDAO dao;
	
	// 전체 페이징 계산
	public PageDTO selectAll(int curPage, String search, PageDTO pDTO, String order) {
		HashMap<String, String> map = new HashMap<>();
		if (search != null) {
			map.put("search", search);
			System.out.println("1거친다");
		}
		if (order != null) {
			map.put("order", order);
			// 카테고리별 정렬 함수
			System.out.println("2거친다");
			return dao.selectOrder(map, curPage, pDTO);
		}
		// 검색조건별 정렬함수

		return dao.selectSearch(map, curPage, pDTO);
	}
	
	// 특정 페이징 계산   curPage = parseInt
		public PageDTO selectAll2(int curPage, PageDTO pDTO, String order, String userID) {
		    HashMap<String, String> map = new HashMap<>();
		    map.put("userID", userID); // 특정 유저의 ID를 맵에 추가

		    if (order == null || (!order.equals("내가 쓴 글") && !order.equals("좋아요 누른 글"))) {
		        map.put("order", "내가 쓴 글"); // 기본값으로 "내가 쓴 글"을 사용
		    } else {
		        map.put("order", order);
		        // 카테고리별 정렬 함수
		    }
		    
		    return dao.selectOrder2(map, curPage, pDTO);
		}
		
		public int selecTotalCount2(String userID, String order) {
			return dao.selecTotalCount2(userID, order);
		}


}// end class
