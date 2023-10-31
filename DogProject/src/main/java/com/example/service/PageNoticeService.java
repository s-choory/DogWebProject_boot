package com.example.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PageNoticeDAO;
import com.example.dto.PageNoticeDTO;

@Service("PageNoticeService")
public class PageNoticeService {
	@Autowired
	PageNoticeDAO dao;
	
	// 전체 페이징 계산
	public PageNoticeDTO selectAll(int curPage, String search, PageNoticeDTO pnDTO, String order) {
		HashMap<String, String> map = new HashMap<>();
		if (search != null) {
			map.put("search", search);
		}
		if (order != null) {
			map.put("order", order);
			// 카테고리별 정렬 함수
			return dao.selectOrder(map, curPage, pnDTO);
		}
		// 검색조건별 정렬함수
		return dao.selectSearch(map, curPage, pnDTO);
	}


}// end class
