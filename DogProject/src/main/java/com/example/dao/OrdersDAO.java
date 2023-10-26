package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.OrdersDTO;

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
	


}
