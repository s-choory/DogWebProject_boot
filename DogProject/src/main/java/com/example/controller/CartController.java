package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CartDTO;
import com.example.dto.UsersDTO;
import com.example.service.CartService;
import com.example.service.GoodsService;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	@Autowired
	GoodsService gService;
	
	//장바구니 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public String cartList(HttpSession session, Model model) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		List<CartDTO> list = service.cartList(user.getUserID());
		model.addAttribute("list",list);
		return "store/cartList";
	}
	
	//장바구니 담기
	@RequestMapping(value = "/addCartList", method = RequestMethod.POST)
	public String addCartList(CartDTO cDTO, HttpSession session, Model model) {
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		if(uDTO == null) {
			return "redirect:/login";
		}
		cDTO.setUserID(uDTO.getUserID());
		//중복 아이템 검사
		CartDTO duplecDTO = service.dupleSelect(cDTO);
		int n;
		if(duplecDTO != null) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("Amount", cDTO.getAmount());
			map.put("CartNum", duplecDTO.getCartNum());
			n = service.dupleUpdate(map);
		}else {
			n = service.addCartList(cDTO);
		}
//		return "forward:/goodsRetrieve?gProductID="+cDTO.getProductID();
		return "redirect:/cartList";
	}
	
	//장바구니 항목 삭제
	@RequestMapping(value = "/delCartList")
	public String delCartList(String CartNum) {
		service.delCart(CartNum);
		return "redirect:/cartList";
	}
	
	//장바구니 전체 삭제
	@RequestMapping(value = "/DelAllCartList")
	public String DelAllCartList(HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		service.delAllCart(user.getUserID());
		return "redirect:/cartList";
	}
	
	//단일상품주문
	@RequestMapping(value = "/CartOrderOneConfirm")
	public String CartOrderConfirm(int num, String userid, HttpSession session) {
		Map<Object, Object> map = new HashMap<Object, Object>(); 
		map.put("UserID", userid);
		map.put("CartNum", num);
		List<CartDTO> list = service.cartOneList(map);
		session.setAttribute("orderList", list);
		return "redirect:/orderConfirm";
	}
	
	//수량 증감
	@RequestMapping(value = "/CartAmountUpdate")
	public @ResponseBody void CartAmountUpdate(int num, int Amount) {
		if(Amount > 0) {
			Map<Object, Object> map = new HashMap<Object, Object>(); 
			map.put("CartNum", num);
			map.put("Amount", Amount);
			int n = service.cartAmountUpdate(map);
		}
	}
	
	//선택한 상품 주문
	@RequestMapping(value = "/CartOrderListConfirm")
	public String CartOrderListConfirm(int [] checkedList, HttpSession session) {
		List<Integer> checklist = new ArrayList<Integer>();
		for (int i : checkedList) {
			checklist.add(i);
		}
		List<CartDTO> list = service.cartNumList(checklist);
		session.setAttribute("orderList", list);
		return "redirect:/orderConfirm";
	}
	
	//선택한 상품 삭제
	@RequestMapping(value = "/CartCheckedDel")
	public String CartCheckedDel(int [] checkedList) {
		List<Integer> checklist = new ArrayList<Integer>();
		for (int i : checkedList) {
			checklist.add(i);
		}
		service.cartDelCheckedList(checklist);
		return "redirect:/cartList";
	}
}
