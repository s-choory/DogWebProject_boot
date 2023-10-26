package com.example.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.config.UploadFileUtils;
import com.example.config.XSSFilter;
import com.example.dto.CartDTO;
import com.example.dto.GoodsDTO;
import com.example.dto.OrdersDTO;
import com.example.dto.ReviewsDTO;
import com.example.dto.UsersDTO;
import com.example.service.CartService;
import com.example.service.GoodsService;
import com.example.service.OrdersService;

@Controller
public class StoreController {

	@Autowired
	GoodsService service;
	@Autowired
	OrdersService oService;
	@Autowired
	CartService cService;
	
	@Autowired
	UploadFileUtils uploadPath;
//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	private XSSFilter xss = new XSSFilter();
	
	/* store */
	//스토어메인
	@RequestMapping(value = "/dogshop_main", method = RequestMethod.GET)
	public String dogshop_main(@RequestParam( required = false, value = "gCategory" ) String gCategory,Model m, HttpSession session) {
		
		String Category=gCategory;
		String gCategory1="사료";
		if (Category != null) {
			gCategory1 = Category;
		}
		List<GoodsDTO>list = service.goodList(gCategory1);
			m.addAttribute("list", list);
			
		//장바구니 몇개 있는지 count 구하기
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		int n = 0;
		if(uDTO != null) {
			String UserID = uDTO.getUserID();
			 n = service.CartCount(UserID);
		}
			m.addAttribute("CartCount", n);
		
		//String UserID = uDTO.getUserID();
		//int n = service.CartCount(UserID);
			
			
			
		return "store/dogshop_main";
	}
	
	
	//상품상세
	@RequestMapping(value = "/goodsRetrieve", method = RequestMethod.GET)
	
	public String goodsRetrieve(@RequestParam("gProductID") String gProductID, @RequestParam("gCategory") String gCategory, Model m) {
	    
		 // 상품 정보 조회 및 모델에 추가
	    GoodsDTO list2 = service.selectone(gProductID);
	    m.addAttribute("selectlist", list2);
	    // 상품 리스트 조회 및 모델에 추가
	   // List<GoodsDTO>list = service.goodList(gCategory);
	   // m.addAttribute("list", list);


	    return "store/dogshop_main";
	}
	
	
	//결제확인
		@RequestMapping(value = "/orderConfirm", method = RequestMethod.GET)
		public String orderConfirm(Model model,HttpSession session) {
			List<CartDTO> list = (List<CartDTO>)session.getAttribute("cDTO");
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			List<OrdersDTO> ordersAllList = oService.ordersAllList(uDTO.getUserID()); //OrderID 추출하기
	        int OrderID = ordersAllList.size() + 1; //OrderID 추출 후 주문번호 지정
	        session.setAttribute("OrderID", OrderID);
			return "store/orderConfirm";
		}
	//카테고리 클릭시 
	@RequestMapping(value = "/goodslist", method = RequestMethod.GET)
	public String goodslist(@RequestParam("gCategory") String gCategory, Model m) {
		
		String Category=gCategory;
		String gCategory1="장난감";
		if (Category != null) {
			gCategory1 = Category;
		}
		List<GoodsDTO>list = service.goodList(gCategory1);
		
		return "forward:store/dogshop_main";
	}
	
	
	//상세보기 창에서 구매 버튼을 클릭했을때
	@RequestMapping(value = "/goodsRetrieve", method = RequestMethod.POST)
	public String goodsRetrieve(@RequestParam("gProductID") String gProductID, Model m) {
		//url에 담아온 num파싱해서 그 num에 맞는  dto 모든 정보들을 goodsRetrieve로 넘겨줘야함	
		//특정 list
		GoodsDTO list = service.selectone(gProductID);
		m.addAttribute("list", list);
		
	    List<ReviewsDTO> rList = service.selectReview(gProductID);
	    //필터처리
	    for (ReviewsDTO rDTO : rList) {
	    	if(rDTO.getReviewContent() != null) {
	    		rDTO.setReviewContent(xss.xssFilter(rDTO.getReviewContent()));
	    	}
	    	List<UsersDTO> uDTO = service.reviewUserImg(rDTO.getUserAlias());
	    	rDTO.setUSERIMG(uDTO.get(0).getUSERIMG());
		}
	    m.addAttribute("ReviewList", rList);
	    return "store/goodsRetrieve"; 
	}
	
	//스토어 메인에서  인기순 가격높은순 가격낮은순 클릭시 
	@RequestMapping(value = "/dogshop_ASCPriceList", method = RequestMethod.GET)
	public String dogshop_main2(@RequestParam( value = "gCategory" ) String gCategory,Model m, HttpSession session) {
		
		// 가격  오름차순 
		List<GoodsDTO>list = service.ASCPriceList(gCategory);
		
		m.addAttribute("list", list);
		
		//장바구니 몇개 있는지 count 구하기
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		int n = 0;
		if(uDTO != null) {
		String UserID = uDTO.getUserID();
		n = service.CartCount(UserID);
		}
		m.addAttribute("CartCount", n);
		
		
		return "store/dogshop_main";
	}
	//dogshop_DESCPriceList
	@RequestMapping(value = "/dogshop_DESCPriceList", method = RequestMethod.GET)
	public String dogshop_main3(@RequestParam( value = "gCategory" ) String gCategory,Model m, HttpSession session) {
		
		// 가격  내림차순 
		List<GoodsDTO>list = service.DESCPriceList(gCategory);
		
		m.addAttribute("list", list);
		
				//장바구니 몇개 있는지 count 구하기
				UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
				int n = 0;
				if(uDTO != null) {
				String UserID = uDTO.getUserID();
				n = service.CartCount(UserID);
				}
				m.addAttribute("CartCount", n);
				
		return "store/dogshop_main";
	}
	//dogshop_MostPopular 인기순 클릭시 
	@RequestMapping(value = "/dogshop_MostPopular", method = RequestMethod.GET)
	public String dogshop_main4(@RequestParam( value = "gCategory" ) String gCategory,Model m, HttpSession session) {
		
		// 가격  내림차순 
		List<GoodsDTO>list = service.MostPopular(gCategory);
		
		m.addAttribute("list", list);
		//장바구니 몇개 있는지 count 구하기
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		int n = 0;
		if(uDTO != null) {
		String UserID = uDTO.getUserID();
		n = service.CartCount(UserID);
		}
		m.addAttribute("CartCount", n);
		
		return "store/dogshop_main";
	}
	
	//주문완료
	@RequestMapping(value = "/orderConfirm", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String orderConfirm2(CartDTO cDTO, HttpSession session) {
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		if(uDTO == null) {
			return "redirect:/login";
		}
		cDTO.setUserID(uDTO.getUserID());
		List<CartDTO> list = new ArrayList<CartDTO>();
		list.add(cDTO);
		session.setAttribute("orderList", list);
		return "redirect:/orderConfirm";
	}
	
	//리뷰등록
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String reviewAdd(MultipartFile[] files,HttpSession session, ReviewsDTO rDTO, Model model) throws Exception{
		int ProductID = rDTO.getProductID();
		UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
		//로그인 체크
		if(uDTO == null) {
			model.addAttribute("msg", "로그인이 필요한 기능입니다.");
			return "forward:/goodsRetrieve?gProductID="+ProductID;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("UserID",uDTO.getUserID());
		map.put("ProductID",ProductID);
		
		List<CartDTO> cDTO = service.findCartOrder(map);
		if(cDTO.size() == 0) {
			model.addAttribute("msg", "이미 리뷰를 등록했거나, 상품 구매 후 리뷰 등록이 가능합니다.");
			return "forward:/goodsRetrieve?gProductID="+ProductID;
		}
		
		//이미지 처리, 매개변수 MultipartFile도 추가했다.
		String ymdPath = null;
		String fileName = "";
		String imgUploadPath = File.separator + "imgUpload";
		ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		// 여러개의 이미지 이름 사이사이에 기호 '@'를 넣어 저장. split으로 파일을 분리하기위함
		for(int i=0; i<files.length; i++) {
			fileName +=  "@"+UploadFileUtils.fileUpload(imgUploadPath, files[i].getOriginalFilename(), files[i].getBytes(), ymdPath);
		}
		
		rDTO.setOrderID(cDTO.get(0).getOrderNumber());
		rDTO.setUserAlias(uDTO.getUserAlias());
		
		//리뷰 저장할 때, 텍스트 '&lt, &gt'를 DB에는 '<, >' 형태로 저장하기. 상품 상세페이지에서 리뷰 뿌릴때는 필터처리하여 '&lt, &gt' 로 변환.
		rDTO.setReviewContent(xss.xssDecoding(rDTO.getReviewContent()));
		//파일이 없을 때 fileName이 null이기 때문에 조건문추가
		if(fileName.equals("@null")) {
			fileName = null;
		}
		if(fileName != null) {
			rDTO.setrImg(ymdPath + File.separator + fileName);
			String [] fName = fileName.split("@");
			String fString = ymdPath;
			//인덱스 0번은 아무것도 없는 값이기 떄문에 1부터 시작
			for (int i = 1; i < fName.length; i++) {
				fString += "@" + File.separator + "s" + File.separator + "s_" + fName[i];
			}
			rDTO.setrThumbImg(fString);
		}
		int n = service.addReview(rDTO);
		//리뷰등록에 성공했다면 ReviewFlag를 false로 바꿔주고 등록 성공 메시지.
		if(n == 1) {
			for (CartDTO cartDTO : cDTO) {	
				service.ReviewFlagUpdate(cartDTO.getCartNum());
			}
			
			model.addAttribute("msg", "리뷰를 등록했습니다");
		}
		return "forward:/goodsRetrieve?gProductID="+ProductID;
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/delReview", method = RequestMethod.POST)
	public String reviewDelete(int ReviewID, int ProductID, Model model) {
		int n = service.delReview(ReviewID);
		if(n == 1) {
			model.addAttribute("msg", "리뷰가 삭제되었습니다.");
		}
		return "forward:/goodsRetrieve?gProductID="+ProductID;
	}
	
	//리뷰 업데이트
	@RequestMapping(value = "/updateReview", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String reviewUpdate(ReviewsDTO rDTO, Model model){
		rDTO.setReviewContent(xss.xssDecoding(rDTO.getReviewContent()));
		int n = service.reviewUpdate(rDTO);
		if(n == 1) {
			model.addAttribute("msg", "리뷰가 수정되었습니다.");
		}
		int ProductID = rDTO.getProductID();
		
		return "forward:/goodsRetrieve?gProductID="+ProductID;
	}
	
	// 검색기능  
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String storeSearch(@RequestParam("SearchName") String SearchName,Model model, HttpSession session) {
		
		List<GoodsDTO>list  = service.searchList(SearchName);
		model.addAttribute("list",list);
		
				//장바구니 몇개 있는지 count 구하기
				UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
				int n = 0;
				if(uDTO != null) {
				String UserID = uDTO.getUserID();
				n = service.CartCount(UserID);
				}
				model.addAttribute("CartCount", n);
				
		return "store/dogshop_main";
	}
	
}
