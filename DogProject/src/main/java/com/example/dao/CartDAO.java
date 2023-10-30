package com.example.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.CartDTO;

@Repository
public class CartDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public int addCartList(CartDTO dto) {
		return session.insert("CartMapper.addCartList", dto);
	}

	public List<CartDTO> cartList(String UserID) {
		return session.selectList("CartMapper.cartList",UserID);
	}

	public void delCart(String CartNum) {
		session.delete("CartMapper.delCart", CartNum);
	}

	public void delAllCart(String UserID) {
		session.delete("CartMapper.delAllCart",UserID);
	}
	
	public int cartAmountUpdate(Map<Object, Object> map) {
		return session.update("CartMapper.cartAmountUpdate", map);
	}

	public List<CartDTO> cartOneList(Map<Object, Object> map) {
		return session.selectList("CartMapper.cartOneList", map);
	}

	public List<CartDTO> cartNumList(List<Integer> checklist) {
		return session.selectList("CartMapper.cartNumList", checklist);
	}

	public void cartDelCheckedList(List<Integer> checklist) {
		session.delete("CartMapper.cartDelCheckedList",checklist);
	}

	public CartDTO dupleSelect(CartDTO cDTO) {
		return session.selectOne("CartMapper.dupleSelect",cDTO);
	}

	public int dupleUpdate(Map<String, Integer> map) {
		return session.update("CartMapper.dupleUpdate",map);
	}

	public int addAfterList(CartDTO cDTO) {
		return session.update("CartMapper.addAfterList", cDTO);
	}

	public List<CartDTO> selectAfterList(CartDTO cdto) {
		return session.selectList("CartMapper.selectAfterList",cdto);
	}

	public List<CartDTO> selectOrderAllList(String userid) {
		return session.selectList("CartMapper.selectOrderAllList", userid);
	}
}
