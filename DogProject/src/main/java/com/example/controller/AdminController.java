package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.dto.ChatMessageDTO;
import com.example.dto.ChatRoomDTO;
import com.example.dto.CommentsDTO;
import com.example.dto.FAQDTO;
import com.example.dto.GoodsDTO;
import com.example.dto.NoticeDTO;
import com.example.dto.PageDTO;
import com.example.dto.PostsDTO;
import com.example.dto.RequestDTO;
import com.example.dto.ReviewsDTO;
import com.example.dto.UsersDTO;
import com.example.service.ChatService;
import com.example.service.CommentsService;
import com.example.service.FAQService;
import com.example.service.GoodsService;
import com.example.service.NoticeService;
import com.example.service.OrdersService;
import com.example.service.PageService;
import com.example.service.PostsService;
import com.example.service.RequestService;

@Controller
public class AdminController {

	@Autowired
	private RequestService rService;
	
	@Autowired
	private ChatService cService;
	
	@Autowired
	private GoodsService gService;
	
	@Autowired
	private PostsService pService;
	
	@Autowired 
	private PageService Pageservice;
	
	@Autowired
	private CommentsService coService;
	
	@Autowired
	private NoticeService nService;
	
	@Autowired
	private FAQService fService;
	
	@Autowired
	private OrdersService oService;
	
	@GetMapping("/adminPage")
	public String adminPage(HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		return "admin/adminPage";
	}
	
	
	//Request===========================================================
	//문의 목록(답변대기)
	@GetMapping("/adminRequest")
	public String adminRequest(HttpSession session, Model model) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		List<RequestDTO> rList = rService.adminSelectList();
		model.addAttribute("rList", rList);
		return "admin/adminRequest";
	}
	
	//문의 목록(답변완료)
	@GetMapping("/adminRequest2")
	public String adminRequest2(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<RequestDTO> rList = rService.adminSelectList2();
		model.addAttribute("rList", rList);
		return "admin/adminRequest2";
	}
	
	//문의 답변 창 띄우기
	@GetMapping("/adminRequestResponse")
	public String adminRequestResponse(String requestid, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		return "admin/adminRequestResponse";
	}
	
	//문의 답변
	@GetMapping("/adminRequestResponseConfirm")
	public String adminRequestResponseConfirm(RequestDTO rDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		rService.replyRecontent(rDTO);
		return "admin/closeWindow";
	}
	//=================================================================
	
	
	//Chat=============================================================
	//모임 목록
	@GetMapping("/adminGroup")
	public String adminGroup(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<ChatRoomDTO> chatList = cService.findAllRoom();
	    model.addAttribute("chatList", chatList);
		return "admin/adminGroup";
	}
	
	//채팅 내역 목록 보기
	@GetMapping("/adminChatMessage")
	public String adminChatMessage(int roomId, Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<ChatMessageDTO> chatMessageList = cService.findChatMessage(roomId);
		model.addAttribute("mList",chatMessageList);
		return "admin/adminChatMessage";
	}
	
	//채팅방 삭제
	@GetMapping("/adminDeleteGroup")
	public String adminDeleteGroup(Model model, int roomId, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		cService.delChatRoom(roomId);
		return "redirect:/adminGroup";
	}
	//=================================================================
	
	
	//Store============================================================
	@GetMapping("/adminGoodsList")
	public String adminGoodsList(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<GoodsDTO> gList = gService.select();
		model.addAttribute("gList", gList);
		return "admin/adminGoodsList";
	}
	
	@GetMapping("/adminAddProductForm")
	public String adminAddProductForm(HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		return "admin/adminAddProductForm";
	}
	
	@GetMapping("/adminAddProduct")
	public String adminAddProduct(GoodsDTO gDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		gService.insert(gDTO);
		return "admin/closeWindow";
	}
	
	@GetMapping("/adminDeleteProduct")
	public String adminDeleteProduct(int PRODUCTID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		gService.delete(PRODUCTID);
		return "redirect:/adminGoodsList";
	}
	@GetMapping("/openReviewList")
	public String openReviewList(String PRODUCTID, Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<ReviewsDTO> rList = gService.selectReview(PRODUCTID);
		model.addAttribute("rList",rList);
		return "admin/adminReviewListForm";
	}
	
	@GetMapping("/addReviewComment")
	public String addReviewComment(int ReviewID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		return "admin/addReviewComment";
	}
	@GetMapping("/adminAddReviewComment")
	public String adminAddReviewComment(ReviewsDTO rDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		gService.addReviewComment(rDTO);
		return "admin/closeWindow";
	}
	//=================================================================

	
	//Posts============================================================
	@GetMapping("/adminPostsList")
	public String adminPostsList(String curPage, Model model, PageDTO pDTO ,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		
		if(curPage == null) curPage = "1";
		String search= request.getParameter("search");
		String order= request.getParameter("order");
		
		pDTO = Pageservice.selectAll(Integer.parseInt(curPage), search, pDTO, order);
		model.addAttribute("pDTO",pDTO);
		model.addAttribute("search", search);
		model.addAttribute("order", order);
		/* System.out.println("all 최신 내림차순 정렬"+ pDTO); */
		return "admin/adminPostsList";
	}
	
	@GetMapping("/adminCommentsList")
	public String adminCommentsList(int PostID, Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<CommentsDTO> coList = coService.selectList(PostID);
		model.addAttribute("coList", coList);
		return "admin/adminCommentsList";
	}
	
	@GetMapping("/adminDeletePost")
	public String adminDeletePost(PostsDTO DTO, Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		pService.delete_column(DTO);
		return "redirect:/adminPostsList";
	}
	
	@GetMapping("/adminDeleteComment")
	public String adminDeleteComment(CommentsDTO DTO, int PostID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		
		coService.replydelete(DTO);
		return "redirect:/adminCommentsList?PostID="+PostID;
	}
	
	//=================================================================

	//Notice============================================================
	@GetMapping("/adminNoticeList")
	public String adminNoticeList(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<NoticeDTO> nList = nService.selectList();
		model.addAttribute("nList",nList);
		return "admin/adminNoticeList";
	}

	@GetMapping("/adminDeleteNotice")
	public String adminDeleteNotice(Model model, int NoticeID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		nService.delete(NoticeID);
		return "redirect:/adminNoticeList";
	}

	@GetMapping("/adminUpdateNoticeForm")
	public String adminUpdateNoticeForm(Model model, int NoticeID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		return "admin/adminUpdateNoticeForm";
	}
	@GetMapping("/adminUpdateNotice")
	public String adminUpdateNotice(Model model, NoticeDTO nDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		nService.update(nDTO);
		return "admin/closeWindow";
	}
	
	@GetMapping("/adminAddNoticeForm")
	public String adminAddNoticeForm(NoticeDTO nDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		return "admin/adminAddNoticeForm";
	}
	@GetMapping("/adminAddNotice")
	public String adminAddNotice(NoticeDTO nDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		
		nService.insert(nDTO);
		return "admin/closeWindow";
	}
	//=================================================================

	//문의============================================================	
	@GetMapping("/adminFAQList")
	public String adminFAQList(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<FAQDTO> nList = fService.list();
		model.addAttribute("nList",nList);
		return "admin/adminFAQList";
	}
	
	@GetMapping("/adminAddFAQForm")
	public String adminAddFAQForm(HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		return "admin/adminAddFAQForm";
	}
	@GetMapping("/adminAddFAQ")
	public String adminAddFAQ(FAQDTO fDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		fService.insert(fDTO);
		return "admin/closeWindow";
	}
	@GetMapping("/adminUpdateFAQForm")
	public String adminUpdateFAQForm(int FaqID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		
		return "admin/adminUpdateFAQForm";
	}
	@GetMapping("/adminUpdateFAQ")
	public String adminUpdateFAQ(FAQDTO fDTO, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		fService.update(fDTO);
		return "admin/closeWindow";
	}
	@GetMapping("/adminDeleteFAQ")
	public String adminDeleteFAQ(int FaqID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		
		fService.delete(FaqID);
		return "redirect:/adminFAQList";
	}
	//=================================================================
	
	//주문==============================================================
	@GetMapping("/adminOrderList")
	public String adminOrderList(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		
		List<OrdersService> oList = oService.selectbeforeList();
		model.addAttribute("oList", oList);
		return "admin/adminOrderList";
	}
	@GetMapping("/adminUpdateOrderState")
	public String adminUpdateOrderState(int OrderID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		oService.adminUpdateOrderState(OrderID);
		return "redirect:/adminOrderList";
	}
	@GetMapping("/adminOrderListConfirm")
	public String adminOrderListConfirm(Model model, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		List<OrdersService> oList = oService.selectAfterList();
		model.addAttribute("oList", oList);
		return "admin/adminOrderListConfirm";
	}
	@GetMapping("/adminUpdateOrderState2")
	public String adminUpdateOrderState2(int OrderID, HttpSession session) {
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/";
		}else {
			if(user.getUserType().equals("admin") == false) {
				return "redirect:/";
			}
		}
		
		
		oService.adminUpdateOrderStat2e(OrderID);
		return "redirect:/adminOrderListConfirm";
	}
	//=================================================================
}


