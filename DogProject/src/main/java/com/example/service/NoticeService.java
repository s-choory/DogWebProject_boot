package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NoticeDAO;
import com.example.dto.NoticeDTO;

@Service  // component-scan 자동생성
public class NoticeService {
	@Autowired
	NoticeDAO dao;

	public List<NoticeDTO> selectList() {
		return dao.selectList();
	}
	
	public NoticeDTO read(int NoticeID) {
		System.out.println("ss");
		return dao.read(NoticeID);
	}
	
	public void hitadd(int NoticeID) {
		dao.hitadd(NoticeID);
		
	}
	
	
//	public List<NoticeDTO> list(pageDTO cri){
//		return dao.list(cri);
//	}
//
//	public NoticeDTO read(int NoticeID) {
//		System.out.println("ss");
//		return dao.read(NoticeID);
//	}
//
//	public int boardCount() {
//		// TODO Auto-generated method stub
//		return dao.boardCount();
//	}
//
//	public void hitadd(int NoticeID) {
//		dao.hitadd(NoticeID);
//		
//	}
	
}
