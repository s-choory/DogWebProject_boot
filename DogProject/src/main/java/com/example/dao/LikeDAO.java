package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.LikeDTO;

@Repository
public class LikeDAO {
	@Autowired
	SqlSessionTemplate session;

	public void likeinsert(LikeDTO dto) {
		int n = session.insert("LikeMapper.likeinsert", dto);	
	}
	
	public int like_likeCount(LikeDTO dto) {
		return session.selectOne("LikeMapper.like_likeCount", dto);
	}
	
	public int like_likeTotalCount(LikeDTO ldto) {
		return session.selectOne("LikeMapper.like_likeTotalCount", ldto);
	}
	
	public int likedelete(LikeDTO dto) {
		return session.delete("LikeMapper.likedelete", dto);
	}

	public List<LikeDTO> selectLikeList() {
		return session.selectList("LikeMapper.selectLikeList");
	}
	
	public List<LikeDTO> likeUser_read(int categoryID) {
		return session.selectList("LikeMapper.likeUser_read" , categoryID);
	}
	

}
