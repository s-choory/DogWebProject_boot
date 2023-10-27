package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.dto.ChatMessageDTO;
import com.example.dto.ChatRoomDTO;
import com.example.dto.RequestDTO;
import com.example.service.ChatService;
import com.example.service.RequestService;

@Controller
public class AdminController {

	@Autowired
	private RequestService rService;
	
	@Autowired
	private ChatService cService;
	
	@GetMapping("/adminPage")
	public String adminPage(HttpSession session) {
//		UsersDTO user = (UsersDTO)session.getAttribute("User");
//		if(user == null) {
//			return "redirect:/";
//		}else {
//			if(user.getUserType().equals("admin") == false) {
//				return "redirect:/";
//			}
//		}
		
		return "admin/adminPage";
	}
	
	
	//Request=================================================================
	//문의 목록(답변대기)
	@GetMapping("/adminRequest")
	public String adminRequest(Model model) {
		List<RequestDTO> rList = rService.adminSelectList();
		model.addAttribute("rList", rList);
		return "admin/adminRequest";
	}
	
	//문의 목록(답변완료)
	@GetMapping("/adminRequest2")
	public String adminRequest2(Model model) {
		List<RequestDTO> rList = rService.adminSelectList2();
		model.addAttribute("rList", rList);
		return "admin/adminRequest2";
	}
	
	//문의 답변 창 띄우기
	@GetMapping("/adminRequestResponse")
	public String adminRequestResponse(String requestid) {
		return "admin/adminRequestResponse";
	}
	
	//문의 답변
	@GetMapping("/adminRequestResponseConfirm")
	public String adminRequestResponseConfirm(RequestDTO rDTO) {
		rService.replyRecontent(rDTO);
		return "admin/closeWindow";
	}
	//=================================================================
	
	
	//Chat=================================================================
	//모임 목록
	@GetMapping("/adminGroup")
	public String adminGroup(Model model) {
		List<ChatRoomDTO> chatList = cService.findAllRoom();
	    model.addAttribute("chatList", chatList);
		return "admin/adminGroup";
	}
	
	//채팅 내역 목록 보기
	@GetMapping("/adminChatMessage")
	public String adminChatMessage(int roomId, Model model) {
		List<ChatMessageDTO> chatMessageList = cService.findChatMessage(roomId);
		model.addAttribute("mList",chatMessageList);
		return "admin/adminChatMessage";
	}
	
	//채팅방 삭제
	@GetMapping("/adminDeleteGroup")
	public String adminDeleteGroup(Model model, int roomId) {
		cService.delChatRoom(roomId);
		return "redirect:/adminGroup";
	}
	//=================================================================
	
	
	//Store=================================================================
	
	//=================================================================
}


