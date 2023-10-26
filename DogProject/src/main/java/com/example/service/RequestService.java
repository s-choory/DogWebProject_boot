package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RequestDAO;
import com.example.dto.RequestDTO;

@Service("Requestservice")
public class RequestService {
	
	@Autowired
	RequestDAO dao;

	public void AddRequest(RequestDTO dto) {
		dao.AddRequest(dto);
	}

	public List<RequestDTO> UserOrderSelectList(RequestDTO rdto) {
		return dao.UserOrderSelectList(rdto);
	}

	public List<RequestDTO> adminSelectList() {
		return dao.adminSelectList();
	}

	
}
