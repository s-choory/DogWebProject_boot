package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FAQDAO;
import com.example.dto.FAQDTO;

@Service  // component-scan 자동생성
public class FAQService {
	@Autowired
	FAQDAO dao;

	public List<FAQDTO> list(){
		return dao.list();
	}

	public void insert(FAQDTO fDTO) {
		dao.insert(fDTO);
	}

	public void update(FAQDTO fDTO) {
		dao.update(fDTO);
	}

	public void delete(int FaqID) {
		dao.delete(FaqID);
	}

}
