package com.example.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CartDAO;
import com.example.dto.CartDTO;

@Service
public class CartService {

	@Autowired
	CartDAO dao;
	
	
	public int addCartList(CartDTO dto) {
		return dao.addCartList(dto);
	}

	public List<CartDTO> cartList(String UserID){
		return dao.cartList(UserID);
	}

	public void delCart(String CartNum) {
		dao.delCart(CartNum);
	}

	public void delAllCart(String UserID) {
		dao.delAllCart(UserID);
	}
	public int cartAmountUpdate(Map<Object, Object> map) {
		return dao.cartAmountUpdate(map);
	}

	public List<CartDTO> cartOneList(Map<Object, Object> map) {
		return dao.cartOneList(map);
	}

	public List<CartDTO> cartNumList(List<Integer> checklist) {
		return dao.cartNumList(checklist);
	}

	public void cartDelCheckedList(List<Integer> checklist) {
		dao.cartDelCheckedList(checklist);
	}

	public CartDTO dupleSelect(CartDTO cDTO) {
		return dao.dupleSelect(cDTO);
	}

	public int dupleUpdate(Map<String, Integer> map) {
		return dao.dupleUpdate(map);
	}
	
	public int addAfterList(CartDTO cDTO) {
		return dao.addAfterList(cDTO);
	}
	public List<CartDTO> selectAfterList(CartDTO cdto) {
		return dao.selectAfterList(cdto);
	}

	public List<CartDTO> selectOrderAllList(String userid) {
		return dao.selectOrderAllList(userid);
	}

}
