package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NoticeDAO;
import com.example.dto.FAQDTO;
import com.example.dto.NoticeDTO;

@Service  // component-scan 자동생성
public class NoticeService {
	@Autowired
	NoticeDAO dao;

	public List<NoticeDTO> selectList() {
		return dao.selectList();
	}
	
	public NoticeDTO read(int NoticeID) {
		return dao.read(NoticeID);
	}
	
	public void hitadd(int NoticeID) {
		dao.hitadd(NoticeID);
		
	}

	public void delete(int NoticeID) {
		dao.delete(NoticeID);
	}

	public void update(NoticeDTO nDTO) {
		dao.update(nDTO);
	}

	public void insert(NoticeDTO nDTO) {
		dao.insert(nDTO);
	}

}
