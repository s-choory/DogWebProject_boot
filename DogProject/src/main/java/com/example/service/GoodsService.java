package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.GoodsDAO;
import com.example.dto.CartDTO;
import com.example.dto.GoodsDTO;
import com.example.dto.OrdersDTO;
import com.example.dto.ReviewsDTO;
import com.example.dto.UsersDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

	public GoodsService() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GoodsService(GoodsDAO dao) {
		super();
		this.dao = dao;
	}
	
	public List<GoodsDTO> select() {
		return dao.select();
	}
	
	public List<GoodsDTO> random(){
		return dao.random();
	}
	
	public GoodsDTO selectone(String gProductID) {
		return dao.selectone(gProductID);
	}


	public List<GoodsDTO> goodList(String gCategory1) {
		return dao.goodList(gCategory1);
	}

	public List<GoodsDTO> ASCPriceList(String gCategory) {
		return dao.ASCPriceList(gCategory);
	}

	public List<GoodsDTO> DESCPriceList(String gCategory) {
		return dao.DESCPriceList(gCategory);
	}

	public List<GoodsDTO> MostPopular(String gCategory) {
		return dao.MostPopular(gCategory);
	}

	public OrdersDTO OrderSelect(HashMap<String, Object> map) {
		return dao.OrderSelect(map);
	}

	public int addReview(ReviewsDTO rDTO) {
		return dao.addReview(rDTO);
	}

	public List<ReviewsDTO> selectReview(String gProductID) {
		return dao.selectReview(gProductID);
	}
	
	public int delReview(int ReviewID) {
		return dao.delReview(ReviewID);
	}

	public int reviewUpdate(ReviewsDTO rDTO) {
		return dao.reviewUpdate(rDTO);
	}
	
	public List<GoodsDTO> searchList(String SearchName) {
		return dao.searchList(SearchName);
	}

	public List<CartDTO> findCartOrder(HashMap<String, Object> map) {
		return dao.findCartOrder(map);
	}

	public void ReviewFlagUpdate(int cartNum) {
		dao.ReviewFlagUpdate(cartNum);
	}

	public List<UsersDTO> reviewUserImg(String userAlias) {
		return dao.reviewUserImg(userAlias);
	}
	
	public int CartCount(String userID) {
		return dao.CartCount(userID);
	}

	public void insert(GoodsDTO gDTO) {
		dao.insert(gDTO);
	}

	public void delete(int PRODUCTID) {
		dao.delete(PRODUCTID);
	}

	public void addReviewComment(ReviewsDTO rDTO) {
		dao.addReviewComment(rDTO);
	}
	
}
