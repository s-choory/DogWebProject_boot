package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.CommentsDTO;

@Repository   //component-scan 으로 빈생성 
public class CommentsDAO {
	@Autowired
	SqlSessionTemplate session;

	public CommentsDTO replyui(int PostID) {
		return session.selectOne("CommentsMapper.replyui", PostID);
	}
	
	public int makeReply(CommentsDTO dto) {
		return session.update("CommentsMapper.makeReply", dto);
		
	}
	public void reply(CommentsDTO dto) {
		int n2 = session.insert("CommentsMapper.reply", dto);
		
	}
	
	public List<CommentsDTO> replylist(int PostID){
		return session.selectList("CommentsMapper.replylist", PostID);
	}
	
	public int replyCount(CommentsDTO dto) {
		return session.selectOne("CommentsMapper.replyCount", dto);
	}
	
	public void replyinsert(CommentsDTO dto) {
		int n = session.insert("CommentsMapper.replyinsert", dto);
		
	}
	
	public int replyupdate(CommentsDTO dto) {
		return session.update("CommentsMapper.replyupdate", dto);
	}
	
	public int replydelete(CommentsDTO dto) {
		return session.update("CommentsMapper.replydelete_column", dto);
	}

	public List<CommentsDTO> selectList(int PostID) {
		return session.selectList("CommentsMapper.selectList", PostID);
	}
	


	

}
