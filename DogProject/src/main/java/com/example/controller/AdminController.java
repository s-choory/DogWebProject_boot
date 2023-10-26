package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.dto.RequestDTO;
import com.example.service.RequestService;

@Controller
public class AdminController {

	@Autowired
	RequestService rService;
	
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
	
	@GetMapping("/adminRequest")
	public String adminRequest(Model model) {
		List<RequestDTO> rList = rService.adminSelectList();
		model.addAttribute("rList", rList);
		return "admin/adminRequest";
	}
	
	
}


