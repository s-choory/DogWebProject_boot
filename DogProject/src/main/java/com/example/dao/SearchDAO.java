package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.AccompanyingFacilitiesDTO;
import com.example.dto.CommentsDTO;
import com.example.dto.GoodsDTO;
import com.example.dto.LikeDTO;
import com.example.dto.NoticeDTO;
import com.example.dto.PostsDTO;
import com.example.dto.ReviewsDTO;

@Repository
public class SearchDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<AccompanyingFacilitiesDTO> AccompanyingFacilities_search(String search) {
		return session.selectList("SearchMapper.AccompanyingFacilities_search", search);
	}

	public List<NoticeDTO> Notices_search(String search) {
		return session.selectList("SearchMapper.Notices_search", search);
	}

	public List<PostsDTO> Posts_search(String search) {
		return session.selectList("SearchMapper.Posts_search", search);
	}

	public List<GoodsDTO> Products_search(String search) {
		return session.selectList("SearchMapper.Products_search", search);
	}

	public List<LikeDTO> Like_search() {
		return session.selectList("SearchMapper.Like_search");
	}

	public List<ReviewsDTO> Review_search() {
		return session.selectList("SearchMapper.Review_search");
	}

	public List<CommentsDTO> Comments_search() {
		return session.selectList("SearchMapper.Comments_search");
	}

	
}
