package com.example.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.FileDTO;

@Repository
public class FileDAO {
	@Autowired
	SqlSessionTemplate session;


	public void insert(FileDTO fileDto) {
		session.insert("FileMapper.insert",fileDto);
		
	}
	
	public FileDTO fileSelect(int postID) {
		return session.selectOne("FileMapper.fileSelect",postID);
	}


	public void update(FileDTO fileDto) {
		session.update("FileMapper.update",fileDto);
		
	}
	


}
