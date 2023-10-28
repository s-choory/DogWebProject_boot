package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CommentsDTO;
import com.example.dto.UsersDTO;
import com.example.service.CommentsService;


@Controller
public class CommentsController {
	@Autowired
	CommentsService service;
	
	//댓글 리스트 보여주기
		@PostMapping("/replyui/{PostID}")
		@ResponseBody
		public List<CommentsDTO> replylist(@PathVariable int PostID) {
			
			List<CommentsDTO> replylist = service.replylist(PostID);
			
			
			return replylist;
		}
		
		
		//댓글 작성
		@PostMapping("/replywrite/{PostID}/{Content}")
		@ResponseBody
		public Map<String, Object> replywrite(@PathVariable int PostID,
				@PathVariable String Content, CommentsDTO DTO, HttpSession session) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			if(uDTO == null) {
				map.put("result", "error");
				return map;
			}else {
				try {
					DTO.setPostID(PostID);
					DTO.setAuthorID(uDTO.getUserID());
					DTO.setContent(Content);
					service.replyinsert(DTO);
					
					map.put("result", "success");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					map.put("result", "fail");	
				}
				
				return map;
			}
			
		}
		
		//대댓글 작성
		@PostMapping("/replywritewrite/{PostID}/{Content}/{ParentCommentID}")
		@ResponseBody
		public Map<String, Object> replywritewrite(
				@PathVariable String Content,@PathVariable int ParentCommentID, CommentsDTO DTO, HttpSession session) {
			Map<String, Object> map = new HashMap<String, Object>();
			//service.makeReply(DTO);
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			if(uDTO == null) {
				map.put("result", "error");
				return map;
			}else {
				try {
//					DTO.setPostID(CommentID);
					DTO.setAuthorID(uDTO.getUserID());
//					DTO.setContent(Content);
//					DTO.setParentCommentID(ParentCommentID);
					DTO.setRepIndent(DTO.getRepIndent()+1);
					service.reply(DTO);
					map.put("result", "success");
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					map.put("result", "fail");
				}
				return map;
			}
			
			
		}
		
			
//		//댓글작성
//		@RequestMapping("/reply_result")
//		//public void list(Model m) {   //list.jsp	
//		public String reply(Model m, BoardDTO DTO) {   //list.jsp
//			service.makeReply(DTO);
//			//System.out.println("@@@@@@@@@"+service.makeReply(DTO));
//			
//			try {
//				//BoardDTO DTO = new BoardDTO();
//				DTO.setAuthorID(DTO.getAuthorID());
//				DTO.setContent(DTO.getContent());
//				DTO.setParentCommentID(DTO.getParentCommentID());
//				DTO.setRepStep(DTO.getRepStep()+1);
//				DTO.setRepIndent(DTO.getRepIndent()+1);
//				System.out.println("reply_result()=================");
//				service.reply(DTO);
//				
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//				
//			}
//			return "redirect:/list";
//		}
		
		
		
		//댓글 수정
		@PostMapping("/replyupdate/{CommentID}/{AuthorID}/{Content}")
		@ResponseBody
		public Map<String, Object> replyupdate(@PathVariable int CommentID, @PathVariable String AuthorID,
				@PathVariable String Content, HttpSession session) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			if(uDTO == null) {
				map.put("result", "error");
				return map;
			}
			
			try {
				CommentsDTO replybean = new CommentsDTO();
				replybean.setCommentID(CommentID);
				replybean.setContent(Content);
				replybean.setAuthorID(AuthorID);;
				if(uDTO.getUserID().toString().equals(replybean.getAuthorID())){ //로그인 아이디와 작성자 아이디 일치여부
					service.replyupdate(replybean);
					map.put("result", "success");
				}else {
					map.put("result", "null");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				map.put("result", "fail");
			}
			return map;
		}
		
		
		//댓글 컬럼타입만 'deleted'로 변경 update
		@PostMapping("/replydelete/{CommentID}/{AuthorID}")
		@ResponseBody
		public Map<String, Object> replydelete(@PathVariable int CommentID, @PathVariable String AuthorID, HttpSession session) {
			Map<String, Object> map = new HashMap<String, Object>();
			
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			if(uDTO == null) {
				map.put("result", "error");
				return map;
			}
			
			try {
				
				CommentsDTO replybean = new CommentsDTO();
				replybean.setCommentID(CommentID);
				replybean.setAuthorID(AuthorID);
				if(uDTO.getUserID().toString().equals(replybean.getAuthorID())){ //로그인 아이디와 작성자 아이디 일치여부
					service.replydelete(replybean);
					map.put("result", "success");
				}else {
					map.put("result", "null");
				}
		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				map.put("result", "fail");
			}
			return map;
		}

	
}
