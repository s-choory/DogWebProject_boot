package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.RequestDTO;

@Repository
public class RequestDAO {

	@Autowired
	SqlSessionTemplate session;

	public void AddRequest(RequestDTO dto) {
		session.insert("RequestMapper.AddRequest", dto);
	}
	public List<RequestDTO> UserOrderSelectList(RequestDTO rdto) {
		// TODO Auto-generated method stub
		return session.selectList("RequestMapper.UserOrderSelectList",rdto);
	}
	public List<RequestDTO> UserAllSelectList(RequestDTO rdto) {
		return session.selectList("RequestMapper.UserAllSelectList",rdto);
	}
	
	
}
