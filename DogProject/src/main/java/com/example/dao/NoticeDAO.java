package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.NoticeDTO;

@Repository  // component-scan 자동빈생성 
public class NoticeDAO {
	@Autowired
	SqlSessionTemplate session;

	public List<NoticeDTO> selectList() {
		return session.selectList("NoticeMapper.selectList");
	}
	
	
	public NoticeDTO read(int NoticeID){
		return session.selectOne("NoticeMapper.Notice_read", NoticeID);
	}
	
	public void hitadd(int NoticeID) {
		session.update("NoticeMapper.Notice_hitadd", NoticeID);
		
	}

	public void delete(int NoticeID) {
		session.delete("NoticeMapper.delete",NoticeID);
	}


	public void update(NoticeDTO nDTO) {
		session.update("NoticeMapper.update", nDTO);
	}


	public void insert(NoticeDTO nDTO) {
		session.insert("NoticeMapper.insert",nDTO);
	}
	

}
