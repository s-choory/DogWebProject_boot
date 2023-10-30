package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.OrdersDAO;
import com.example.dto.OrdersDTO;

@Service
public class OrdersService {

	@Autowired
	OrdersDAO dao;

	public List<OrdersDTO> ordersAllList(String UserID) {
		return dao.ordersAllList(UserID);
	}

	public void orderInsert(OrdersDTO ordersdto) {
		dao.orderInsert(ordersdto);
	}

	public OrdersDTO orderSelect(int OrderID) {
		return dao.orderSelect(OrderID);
	}

	public List<OrdersService> selectbeforeList() {
		return dao.selectbeforeList();
	}

	public void adminUpdateOrderState(int orderID) {
		dao.adminUpdateOrderState(orderID);
	}

	public List<OrdersService> selectAfterList() {
		return dao.selectAfterList();
	}

	public void adminUpdateOrderStat2e(int orderID) {
		dao.adminUpdateOrderState2(orderID);
	}
	
	
}
