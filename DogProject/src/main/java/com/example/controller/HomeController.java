package com.example.controller;

import java.util.Base64;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.example.dao.PageDAO;
import com.example.dto.AccompanyingFacilitiesDTO;
import com.example.dto.CartDTO;
import com.example.dto.GoodsDTO;
import com.example.dto.LikeDTO;
import com.example.dto.NoticeDTO;
import com.example.dto.PageDTO;
import com.example.dto.PostsDTO;
import com.example.dto.ReviewsDTO;
import com.example.dto.UsersDTO;
import com.example.service.AccompanyingFacilitiesService;
import com.example.service.CartService;
import com.example.service.GoodsService;
import com.example.service.LikeService;
import com.example.service.PageService;
import com.example.service.PostsService;
import com.example.service.SearchService;
import com.example.service.UsersService;

@Controller
public class HomeController {

	@Autowired
	AccompanyingFacilitiesService service;
	@Autowired
	CartService cartservice;
	@Autowired
	UsersService usersservice;
	@Autowired
	PostsService Postsservice;	
	@Autowired 
	PageService Pageservice;
	@Autowired
	GoodsService gservice;
	@Autowired
	SearchService searchService;
	@Autowired
	LikeService likeService;
	
	/* mypage */
	//마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model, String curPage, PageDTO pDTO, PageDAO dao ,HttpServletRequest request, HttpServletResponse response) {
	
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		List<CartDTO> list = cartservice.cartList(user.getUserID());
		model.addAttribute("list",list);
		
		// 글쓰기 정보들도 jsp로 같이 넘겨줌 + 페이징 
		String UserID = user.getUserID(); //로그인한 유저의 ID 
		List<PostsDTO> list2 = Postsservice.selectList2(UserID);   //여기서 해당 userid로 해당 user가 쓴 글만 넘겨줘야함 - 수정 필요
		model.addAttribute("list2",list2);
		if(curPage == null) curPage = "1";
		String order= request.getParameter("order");
		
		//pdto의 total은 전체 total이라 특정userid의 total로 바꿔줘야함
		int totalCountByUser = Pageservice.selecTotalCount2(UserID);
		pDTO.setTotalCount(totalCountByUser);
		model.addAttribute("pDTO",pDTO);
		//pdto부분 수정해야함 현재 모든 글쓰기 정보가 나옴 
		PageDTO pDTO2;
		pDTO2 = Pageservice.selectAll2(Integer.parseInt(curPage), pDTO, order, UserID);
		
		model.addAttribute("order", order);
		
		return "mypage/mypage_white";
	}
	
	//마이페이지 모달창 파일 db에 업로드하기 
	@RequestMapping(value = "/profil-img", method = RequestMethod.POST)
	public ResponseEntity<String> profil(HttpServletRequest request, HttpSession session) {

	    // 파일 업로드 처리
	    MultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
	    if (multipartResolver.isMultipart(request)) {
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
	        MultipartFile file = multipartRequest.getFile("file");

	        if (file != null && !file.isEmpty()) {
	            String fileName = file.getOriginalFilename();

	            try {
	                byte[] fileBytes = file.getBytes();

	                // Base64 인코딩
	                String encodedFile = Base64.getEncoder().encodeToString(fileBytes);

	                UsersDTO user = (UsersDTO) session.getAttribute("User");
	                String userID = user.getUserID();

	                // db에 업데이트 코드
	                UsersDTO DTO = new UsersDTO(userID, fileBytes);
	                
	                // 세션 정보 업데이트
					user.setUSERIMG(fileBytes); // 새로운 이미지 데이터 설정
					
					session.setAttribute("User", user); // 세션에 업데이트된 User 객체 저장
	                
					int n = usersservice.ProfilImg(DTO);
	                
					if (n > 0) {
	                    return ResponseEntity.ok(encodedFile); // 성공적으로 업데이트되면 인코딩된 이미지 데이터를 응답으로 전송
					} else {
						return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("이미지 업데이트 실패");
					}
	                
	            } catch (Exception e) {
	                e.printStackTrace();
	                
					return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 처리 중 오류 발생");
	            }
	        }
	    }

	    return ResponseEntity.badRequest().body("파일이 없습니다.");
	}
	
	// 모달창에서 이미지 삭제 => 기본이미지로   
	@RequestMapping(value = "/delete-profil-img", method = RequestMethod.POST)
	public  ResponseEntity<String> profildelete(HttpSession session, Model model, String curPage, PageDTO pDTO, HttpServletRequest request) {

		UsersDTO user = (UsersDTO)session.getAttribute("User");
		String UserID = user.getUserID();
		int n = usersservice.profilImgDelete(UserID);
		
		
		// 이미지 삭제 후에 세션의 User 객체를 업데이트해야 함
	    UsersDTO updatedUser = usersservice.userinfo(UserID);
	    session.setAttribute("User", updatedUser); // 세션에 업데이트된 User 객체 저장

		
		List<CartDTO> list = cartservice.cartList(user.getUserID());
		model.addAttribute("list",list);
		
		// 글쓰기 정보들도 jsp로 같이 넘겨줌 + 페이징 
		List<PostsDTO> list2 = Postsservice.selectList2(UserID);   //여기서 해당 userid로 해당 user가 쓴 글만 넘겨줘야함 - 수정 필요
		model.addAttribute("list2",list2);
		if(curPage == null) curPage = "1";
		//String search= request.getParameter("search");
		String order= request.getParameter("order");
		
		return ResponseEntity.ok().build();
	}
	
	//프로필 모달창  프로필 정보 변경 클릭시  // profil-text
	@RequestMapping(value = "/profil-text", method = RequestMethod.POST)
	public String profilupdate(HttpSession session, Model model, UsersDTO dto) {
		
		UsersDTO user = (UsersDTO)session.getAttribute("User");
		if(user == null) {
			return "redirect:/login";
		}
		
		usersservice.profilUpdate(dto);
		
		String UserID = user.getUserID();
		user = usersservice.userinfo(UserID);
		session.setAttribute("User", user);
		
		
		return "redirect:/mypage";
	}
		
		
	
	
	/* group */
	//모임생성
	@RequestMapping(value = "/meeting_create", method = RequestMethod.GET)
	public String meeting_create(Locale locale, Model model) {
		return "group/meeting_create";
	}
	//모임목록
	@RequestMapping(value = "/MoIm", method = RequestMethod.GET)
	public String MoIm(Locale locale, Model model) {
		return "group/MoIm";
	}
	//모임상세화면
	@RequestMapping(value = "/MoIm2", method = RequestMethod.GET)
	public String MoIm2(Locale locale, Model model) {
		return "group/MoIm2";
	}
	
	
//	/* customer_center*/
//	//고객센터QnA
//	@RequestMapping(value = "/ContactCenter_FAQ", method = RequestMethod.GET)
//	public String ContactCenter_FAQ(Locale locale, Model model) {
//		return "customer_center/ContactCenter_FAQ";
//	}
//	//고객센터글목록(페이징)
//	@RequestMapping(value = "/ContactCenter_Notice", method = RequestMethod.GET)
//	public String ContactCenter_Notice(Locale locale, Model model) {
//		return "customer_center/ContactCenter_Notice";
//	}
	
	
	//인덱스페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		List<GoodsDTO> random=gservice.random();
		List<PostsDTO> popular=Postsservice.popular();
		model.addAttribute("random", random);
		model.addAttribute("popular",popular);
		return "main";
	}
	//검색
		@RequestMapping(value = "/main_searchList", method = RequestMethod.GET)
		public String main_searchList(String search, Model m) {
			
			List<AccompanyingFacilitiesDTO> AccompanyingFacilities_list = searchService.AccompanyingFacilities_search(search);
			List<NoticeDTO> Notices_list = searchService.Notices_search(search);
			List<PostsDTO> Posts_list = searchService.Posts_search(search);
			List<GoodsDTO> Products_list = searchService.Products_search(search);
			List<LikeDTO> Like_list = searchService.Like_search();
			List<ReviewsDTO> Review_list = searchService.Review_search();
			//댓글 관련으로 list 필요
			m.addAttribute("search",search);
			m.addAttribute("AccompanyingFacilities_list",AccompanyingFacilities_list);
			m.addAttribute("Notices_list",Notices_list);
			m.addAttribute("Posts_list",Posts_list);
			m.addAttribute("Products_list",Products_list);
			m.addAttribute("Like_list",Like_list);
			m.addAttribute("Review_list",Review_list);
			
			return "main_searchList";
		}
	
}
