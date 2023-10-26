package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.FAQDTO;

@Repository  // component-scan 자동빈생성 
public class FAQDAO {
	@Autowired
	SqlSessionTemplate session;

	public List<FAQDTO> list(){
		return session.selectList("FAQMapper.list");
	}
	

}
