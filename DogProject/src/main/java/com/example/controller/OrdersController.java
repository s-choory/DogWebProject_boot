package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CartDTO;
import com.example.dto.OrdersDTO;
import com.example.dto.RequestDTO;
import com.example.dto.UsersDTO;
import com.example.service.CartService;
import com.example.service.OrdersService;
import com.example.service.RequestService;

@Controller
public class OrdersController {
	
	@Autowired
	CartService service;
	@Autowired
	OrdersService oService;
	@Autowired
	RequestService rService;
			
	@RequestMapping("/test")
	@ResponseBody
		public String test() {
		OrdersDTO ordersdto = new OrdersDTO(2, null,null,null,null,0,null,null,null,null,null,null,0,null,null,null,null);
		oService.orderInsert(ordersdto);
			return "";
		}
	//주문확인 페이지
			@RequestMapping(value = "/orderConfirmation", method = RequestMethod.POST)
		    public String orderConfirmation(String cardname, String cardnumber, OrdersDTO ordersdto, HttpSession session) {
				int postnum = ordersdto.getPostNumber();
				//UserID 값 넣기
				UsersDTO usersdto = (UsersDTO) session.getAttribute("User");
				String UserID = usersdto.getUserID();
				int OrderID = ordersdto.getOrderID();
				ordersdto.setUserID(UserID);
				//OrderName 값 넣기 & list의 state 'before' -> 'after'로 변경 
				List<CartDTO> CartDTO_list = (List<CartDTO>)session.getAttribute("orderList");
				String OrderName = "";
		        int total = 0;
		        for (int i = 0; i < CartDTO_list.size(); i++) { 
<<<<<<< HEAD
		        	CartDTO cDTO = new CartDTO();
		        	cDTO.setCartNum(CartDTO_list.get(i).getCartNum());
		        	cDTO.setOrderNumber(OrderID);
		        	int n = service.addAfterList(cDTO);
=======
		        	int n = service.addAfterList(CartDTO_list.get(i), UserID, OrderID);
		        	System.out.println(n);
>>>>>>> branch 'yong' of https://github.com/s-choory/DogWebProject_boot.git
					total += n;
					OrderName = CartDTO_list.get(0).getProductName();
				}
		        if(total == 1) {
		        	ordersdto.setOrderName(OrderName);
		        } else {
		        	ordersdto.setOrderName(OrderName+"..외 "+total+"개");
		        }
		        //OrderState, paymethodcard, paymethodnumber 값 넣기
		        String paymethod = ordersdto.getPayMethod();
		        if(paymethod.equals("무통장입금")) { // 입금대기 결제완료 배송중 배송완료 배송확정 취소요청 취소완료
		        	ordersdto.setOrderState("입금대기");
		        	ordersdto.setPaymethodcard("없음");
				    ordersdto.setPaymethodnumber("없음");
		        } else {
		        	ordersdto.setOrderState("결제완료"); //입
			        ordersdto.setPaymethodcard(cardname);
			        ordersdto.setPaymethodnumber(cardnumber);
		        }
		        oService.orderInsert(ordersdto);
		        //orderid와 동일한 장바구니 정보 select
		        CartDTO cdto = new CartDTO();
		        cdto.setUserID(UserID);
		        cdto.setOrderNumber(OrderID);
		        List<CartDTO> CartDTO_AfterList = service.selectAfterList(cdto);
		        //OrderTime 값 가져오기 위한 select
		        OrdersDTO odto = oService.orderSelect(OrderID);
		        session.setAttribute("orderDate", odto);
		        session.setAttribute("orderAfterList", CartDTO_AfterList);
		        return "redirect:/orderConfirmation";
		    }

			@RequestMapping(value = "/orderConfirmation", method = RequestMethod.GET)
			public String orderConfirmation2() {
				return "store/orderConfirmation";
			}
			
	//주문리스트
			@RequestMapping(value = "/orderList", method = RequestMethod.GET)
			public String orderList(HttpSession session) {
				UsersDTO udto = (UsersDTO)session.getAttribute("User");
			    	if(udto == null) {
			        return "redirect:/login";
			        }
				String userid = udto.getUserID();
				List<OrdersDTO> olist = oService.ordersAllList(userid);
				List<CartDTO> clist = service.selectOrderAllList(userid);
				session.setAttribute("olist", olist);
				session.setAttribute("clist", clist);
				return "store/orderList";
			}
			
			@RequestMapping(value = {"/requestPage", "/requestPage2"})
			public String requestPage3(HttpSession session, String userid, int requestid, String category) {
				RequestDTO rdto = new RequestDTO();
				rdto.setUserid(userid);
				rdto.setRequestid(requestid);
				rdto.setCategory(category);
				List<RequestDTO> rlist = rService.UserOrderSelectList(rdto);
				session.setAttribute("request_userid", userid);
				session.setAttribute("request_requestid", requestid);
				session.setAttribute("request_category", category);
				session.setAttribute("request_SelectList", rlist);
				session.setAttribute("request_PageSee", rlist);
				if(rlist.size() == 0) {
					return "request/requestForm";
				} else {
					return "redirect:/requestPageChange?num=1";
				}
			}
			
			@RequestMapping(value = "/requestPageChange")
			public String requestRerequest(HttpSession session, int num) {
				List<RequestDTO> pageChangList = new ArrayList<RequestDTO>();
 				List<RequestDTO> rlist = (List<RequestDTO>)session.getAttribute("request_SelectList");
				int rlistMax = rlist.size();
 				for (int i = rlistMax-(num*7); i < rlistMax-((num-1)*7); i++) {
 					if(i >= 0) {
 					pageChangList.add(rlist.get(i));
 					}
				}
				session.setAttribute("request_PageSee", pageChangList);
				return "request/requestList";
			}
			
			@RequestMapping(value = "/requestSave")
			public String requestSave(HttpSession session, RequestDTO dto) {
				System.out.println("requestSave 호출 : "+ dto);
				rService.AddRequest(dto);
				RequestDTO rdto = new RequestDTO();
				rdto.setUserid(dto.getUserid());
				rdto.setRequestid(dto.getRequestid());
				rdto.setCategory(dto.getCategory());
				if(dto.getCategory().equals("상품주문")) {
				List<RequestDTO> rlist = rService.UserOrderSelectList(rdto);
<<<<<<< HEAD
				session.setAttribute("request_UserOrderSelectList", rlist);
				return "redirect:/requestPage?userid="+dto.getUserid()+"&orderid="+dto.getRequestid();
=======
				session.setAttribute("request_SelectList", rlist);
				} else {
				List<RequestDTO> rlist = rService.UserAllSelectList(rdto);	
				session.setAttribute("request_SelectList", rlist);
				}
				return "redirect:/requestPageChange?num=1";
>>>>>>> branch 'yong' of https://github.com/s-choory/DogWebProject_boot.git
			}
			
//			<a href="requestPost?requestid=<%= rlistSee.get(i).getRequestid() %>&userid=<%=userid%>&count=<%=rlistSee.get(i).getCount() %>">
//			<%= rlistSee.get(i).getCategory() %> > <%= rlistSee.get(i).getTag() %> > <%= rlistSee.get(i).getRequestid() %>
//			</a>
			
			@RequestMapping(value = "/requestPost")
			public String requestPost(HttpSession session, int requestid, String userid, int count) {
				RequestDTO rdto = new RequestDTO();
				rdto.setUserid(userid);
				rdto.setRequestid(requestid);
				rdto.setCount(count);
				session.setAttribute("request_selectone", rdto);
				return "request/requestPost";
			}
			@RequestMapping(value = "/requestList")
			public String requestList(HttpSession session) {
				return "redirect:/requestPageChange?num=1";
			}
			@RequestMapping(value = "/requestRerequest")
			public String requestRerequest(HttpSession session) {
				return "request/requestForm";
			}
			
//			@RequestMapping(value = "/requestSave2")
//			@ResponseBody
//			public String requestSave2(HttpSession session, RequestDTO dto) {
//				dto.setRequestid(9999);
//		rService.AddRequest(dto);
//		 /* RequestDTO rdto = new RequestDTO(); rdto.setUserid(dto.getUserid());
//		 * rdto.setRequestid(dto.getRequestid()); String category = (String)
//		 * session.getAttribute("request_category"); List<RequestDTO> rlist = new
//		 * ArrayList<RequestDTO>(); if(category == "상품문의") { rlist =
//		 * rService.UserOrderSelectList(rdto); } else { rlist =
//		 * rService.UserAllSelectList(rdto); }
//		 * session.setAttribute("request_UserOrderSelectList", rlist);
//		 */
//				return "redirect:/requestPageChange?num=1";
//			}
//			@RequestMapping(value = "/requestPost")
//			public String requestPost(HttpSession session, String userid, int requestid, int count) {
//				RequestDTO rdto = new RequestDTO();
//				rdto.setUserid(userid);
//				rdto.setRequestid(requestid);
//				rdto.setCount(count);
//				session.setAttribute("request_selectone", rdto);
//				return "request/requestPost";
//			}
			
}