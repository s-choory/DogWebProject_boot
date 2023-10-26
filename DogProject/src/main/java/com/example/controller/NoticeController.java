package com.example.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.FAQDTO;
import com.example.dto.NoticeDTO;
import com.example.dto.PageNoticeDTO;
import com.example.service.FAQService;
import com.example.service.NoticeService;
import com.example.service.PageNoticeService;

@Controller
public class NoticeController {

	@Autowired
	NoticeService NoticeService;
	@Autowired 
	PageNoticeService Pageservice;
	@Autowired
	FAQService FAQService;
	
	
	/* customer_center*/
//	//고객센터글목록(페이징)
//	@RequestMapping(value = "/ContactCenter_Notice", method = RequestMethod.GET)
//	public String ContactCenter_Notice(Locale locale, Model model) {
//		return "customer_center/ContactCenter_Notice";
//	}
	
	/* 고객센터 공지사항 글목록(페이징 처리) */
	@RequestMapping(value = "/ContactCenter_Notice", method = RequestMethod.GET)
	public String page(String curPage, Model model, PageNoticeDTO pnDTO ,HttpServletRequest request, HttpServletResponse response) {
	
		if(curPage == null) curPage = "1";
		String search= request.getParameter("search");
		String order= request.getParameter("order");
		
		pnDTO = Pageservice.selectAll(Integer.parseInt(curPage), search, pnDTO, order);
		model.addAttribute("pnDTO",pnDTO);
		model.addAttribute("search", search);
		model.addAttribute("order", order);
		return "customer_center/ContactCenter_Notice";
	}
	
	//공지사항 글 클릭 시 상세페이지로 이동 
	@RequestMapping(value = "/ContactCenter_Notice_page", method = RequestMethod.GET)
		public String read(Locale locale, Model model, 
				@RequestParam("NoticeID") int NoticeID, PageNoticeDTO pnDTO){
		NoticeDTO ndto = NoticeService.read(NoticeID);

		NoticeService.hitadd(NoticeID); //조회수 처리
		
		model.addAttribute("read", ndto);
		
		//model.addAttribute("cri", cri);//페이징 관련
		model.addAttribute("pnDTO",pnDTO);//페이징 관련
		return "customer_center/ContactCenter_Notice_page";
	}
	
	/* customer_center*/
	//고객센터 FAQ
	@RequestMapping(value = "/ContactCenter_FAQ", method = RequestMethod.GET)
	public String ContactCenter_FAQ(Locale locale, Model model) {
		List<FAQDTO> flist=FAQService.list();
		model.addAttribute("list", flist);
		return "customer_center/ContactCenter_FAQ";
	}
	

}
