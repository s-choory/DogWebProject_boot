package com.example.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.AccompanyingFacilitiesDTO;

@Repository
public class AccompanyingFacilitiesDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public List<AccompanyingFacilitiesDTO> selectList(AccompanyingFacilitiesDTO dto) {
		return session.selectList("AccompanyingFacilitiesMapper.selectList", dto);
	}

	public List<AccompanyingFacilitiesDTO> selectListChange(Map<String, Object> map) {
		return session.selectList("AccompanyingFacilitiesMapper.selectListChange", map);
	}


}
