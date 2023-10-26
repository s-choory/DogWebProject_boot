package com.example.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.DogTypeDTO;

@Repository
public class DogTypeDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public List<DogTypeDTO> dogsList(Map<String, String> map) {
		return session.selectList("DogTypeMapper.dogsList", map);
	}	

	public List<DogTypeDTO> dogSearch(String dogSearch) {
		return session.selectList("DogTypeMapper.dogSearch", dogSearch);
	}
}
