package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.LikeDAO;
import com.example.dto.LikeDTO;

@Service("LikeService")
public class LikeService {
	@Autowired
	LikeDAO dao;
	

	public void likeinsert(LikeDTO ldto) {
		dao.likeinsert(ldto);
	}
	
	public int like_likeCount(LikeDTO ldto) {
		return dao.like_likeCount(ldto);
	}
	
	public int like_likeTotalCount(LikeDTO ldto) {
		return dao.like_likeTotalCount(ldto);
	}
	
	public int likedelete(LikeDTO dto) {
		return dao.likedelete(dto);
	}

	public List<LikeDTO> selectLikeList() {
		return dao.selectLikeList();
	}
	
	public List<LikeDTO> likeUser_read(int categoryID) {
		return dao.likeUser_read(categoryID);
	}
	
	
}// end class
