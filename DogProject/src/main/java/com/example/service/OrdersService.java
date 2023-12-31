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

	public int ordersAllList() {
		return dao.ordersAllList();
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

	public List<OrdersDTO> ordersAllList2(String UserID) {
		return dao.ordersAllList2(UserID);
	}
	
	
}
