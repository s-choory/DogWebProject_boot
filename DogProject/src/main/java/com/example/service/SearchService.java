package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.SearchDAO;
import com.example.dto.AccompanyingFacilitiesDTO;
import com.example.dto.CommentsDTO;
import com.example.dto.GoodsDTO;
import com.example.dto.LikeDTO;
import com.example.dto.NoticeDTO;
import com.example.dto.PostsDTO;
import com.example.dto.ReviewsDTO;

@Service
public class SearchService {
	
	@Autowired
	SearchDAO dao;


	public List<AccompanyingFacilitiesDTO> AccompanyingFacilities_search(String search) {
		return dao.AccompanyingFacilities_search(search);
	}


	public List<NoticeDTO> Notices_search(String search) {
		return dao.Notices_search(search);
	}


	public List<PostsDTO> Posts_search(String search) {
		return dao.Posts_search(search);
	}


	public List<GoodsDTO> Products_search(String search) {
		return dao.Products_search(search);
	}


	public List<LikeDTO> Like_search() {
		return dao.Like_search();
	}


	public List<ReviewsDTO> Review_search() {
		return dao.Review_search();
	}


	public List<CommentsDTO> Comments_search() {
		return dao.Comments_search();
	}
	
	


}
