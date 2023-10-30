package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.OrdersDTO;
import com.example.service.OrdersService;

@Repository
public class OrdersDAO {

	@Autowired
	SqlSessionTemplate session;

	public List<OrdersDTO> ordersAllList(String UserID) {
		return session.selectList("OrdersMapper.ordersAllList", UserID);
	}

	public void orderInsert(OrdersDTO ordersdto) {
		session.insert("OrdersMapper.orderInsert", ordersdto);
	}

	public OrdersDTO orderSelect(int OrderID) {
		return session.selectOne("OrdersMapper.orderSelect", OrderID);
	}

	public List<OrdersService> selectbeforeList() {
		return session.selectList("OrdersMapper.selectBeforeList");
	}

	public void adminUpdateOrderState(int OrderID) {
		session.update("OrdersMapper.adminUpdateOrderState", OrderID);
	}

	public List<OrdersService> selectAfterList() {
		return session.selectList("OrdersMapper.selectAfterList");
	}

	public void adminUpdateOrderState2(int OrderID) {
		session.update("OrdersMapper.adminUpdateOrderState2", OrderID);
	}
	


}
