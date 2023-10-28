package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.dto.CommentsDTO;
import com.example.dto.FileDTO;
import com.example.dto.LikeDTO;
import com.example.dto.PageDTO;
import com.example.dto.PostsDTO;
import com.example.dto.UsersDTO;
import com.example.service.CommentsService;
import com.example.service.FileService;
import com.example.service.LikeService;
import com.example.service.PageService;
import com.example.service.PostsService;

@Controller
public class PostController {
	
	@Autowired
	PostsService Postsservice;	
	@Autowired 
	PageService Pageservice;
	@Autowired
	LikeService LikeService;
	@Autowired
	CommentsService commentsService;
	@Autowired
	FileService fservice;
	
	/* community */
	//커뮤니티메인화면
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET)
	public String community(Locale locale, Model model) {
		List<PostsDTO> list = Postsservice.selectList();
		model.addAttribute("list",list);
		return "community/community_main";
	}
	
	/* 페이징 */
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String page(String curPage, Model model, PageDTO pDTO ,HttpServletRequest request, HttpServletResponse response) {
	
		if(curPage == null) curPage = "1";
		String search= request.getParameter("search");
		String order= request.getParameter("order");
		
		pDTO = Pageservice.selectAll(Integer.parseInt(curPage), search, pDTO, order);
		model.addAttribute("pDTO",pDTO);
		model.addAttribute("search", search);
		model.addAttribute("order", order);
		/* System.out.println("all 최신 내림차순 정렬"+ pDTO); */
		return "community/community_main";
	}
	
	//게시물 클릭 시 상세 내용 보기
			@RequestMapping(value = "/post", method = RequestMethod.GET)
			public String post(Locale locale, Model model, 
				@RequestParam("PostID") int PostID, LikeDTO ldto, HttpServletResponse response, HttpServletRequest request,
				HttpSession session, PageDTO ppDTO, CommentsDTO cdto) {
				UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
				
//				List<LikeDTO> Like_list = LikeService.selectLikeList();
//				model.addAttribute("Like_list", Like_list);
				
				PostsDTO pdto = Postsservice.read(PostID);//게시글 상세보기
			
				FileDTO fdto = fservice.fileSelect(PostID);
						
				//조회수-Cookie or 세션 이용해서 조회수 중복 방지
				Cookie[] cookies=request.getCookies();
				int countCookie=0;
					for(Cookie c : cookies) {
						if(c.getName().equals(Integer.toString(PostID))) {
							countCookie++;
						}
					}
					if(countCookie==0) {
						Cookie cookie = new Cookie(Integer.toString(PostID),Integer.toString(PostID));
						cookie.setMaxAge(30);
						response.addCookie(cookie);
						Postsservice.hitadd(PostID); //조회수 처리
					}
				
				cdto.setPostID(PostID);
				int n6 = commentsService.replyCount(cdto);
				model.addAttribute("replyCount", n6); //댓글 갯수
				
				List<LikeDTO> likeList = LikeService.selectLikeList();
				int n2222;
				for (LikeDTO like : likeList) {
					if(like.getCategoryID() == PostID) {
						n2222 = LikeService.like_likeTotalCount(like); //좋아요 갯수
						model.addAttribute("n2222", n2222);
					}else if(likeList == null) {
						model.addAttribute("n2222", 0);
					}
				}
				model.addAttribute("uDTO", uDTO);
				model.addAttribute("read", pdto);// 게시글 상세보기
				model.addAttribute("upload", fdto);// 게시글 상세보기
				
			
				//model.addAttribute("cri", cri);//페이징 관련
				model.addAttribute("ppDTO",ppDTO);//페이징 관련
				return "community/community_post";
			}
	
//	//상세보기
//	@RequestMapping(value = "/post", method = RequestMethod.GET)
//	public String post(Locale locale, Model model) {
//		return "community/community_post";
//	}
	
		
		//좋아요 클릭 시 db에 저장,삭제
		@RequestMapping(value = "/like", method = RequestMethod.POST)
		@ResponseBody
		public int like(Locale locale, Model model, HttpSession session, int PostID, PostsDTO pdto, LikeDTO ldto) {
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			
			ldto.setUserID(uDTO.getUserID());
			ldto.setCategoryID(PostID);
			ldto.setCategories("posts");    //컨트롤러에서 임의로 설정
			
			int n = 0;
			if(LikeService.like_likeCount(ldto) == 0) { //좋아요 갯수 db
				LikeService.likeinsert(ldto); //좋아요 버튼 클릭 시  db 1개 추가
				n = LikeService.like_likeTotalCount(ldto);
				Postsservice.likeUpdate(Integer.toString(n), Integer.toString(PostID));
			}else if(LikeService.like_likeCount(ldto) != 0) {
				LikeService.likedelete(ldto); //좋아요 버튼 클릭 시  db 1개 감소
				n = LikeService.like_likeTotalCount(ldto);
				Postsservice.likeUpdate(Integer.toString(n), Integer.toString(PostID));
			}
			//return "redirect:/community/community_post";
			return n;
		}
		
		
		//컬럼타입만 'deleted'로 변경 update
		@RequestMapping(value = "/delete" )
		@ResponseBody
		public String delete_result(Locale locale, Model model, HttpSession session, 
				PostsDTO dto){
			
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			if(uDTO == null) {
				return "로그인이 필요합니다";
			}
			
			if(uDTO.getUserID().toString().equals(dto.getAuthorID().toString())) { //로그인 아이디와 작성자 아이디 일치여부
				int n = Postsservice.delete_column(dto);
				return "삭제되었습니다";
			//	return "redirect:/";
			}else {
				return "삭제할 수 없습니다";
				
			}
			
		}	
	
	//등록화면
	@RequestMapping(value = "/addPost", method = RequestMethod.GET)
	public String addPost(Locale locale, Model model, HttpSession session) {
	    UsersDTO udto = (UsersDTO) session.getAttribute("User");
	    if(udto == null) {
	    	return "redirect:/login";
	    }
		return "community/community_addPost";
	}
	
	
	@RequestMapping(value = "/addPost", method = RequestMethod.POST)
	public String addPost(HttpSession session, PostsDTO post, @RequestParam("files") MultipartFile[] files, Model model) {
	    UsersDTO udto = (UsersDTO) session.getAttribute("User");
	    post.setAuthorID(udto.getUserID());

	    /////////  ckeditor 관련 실제로 업로드 된 파일들을 임시폴더 -> 정식 업로드 폴더로 옮기고 임시폴더의 파일들은 삭제함
	    String tempFolderPath = "C:/temp";
	    String uploadFolderPath = "C:/upload";
	    File tempFolder = new File(tempFolderPath);
	    File[] ckfiles = tempFolder.listFiles();
	    
	    if (files != null) {
	        for (File ckfile : ckfiles) {
	            if (ckfile.isFile()) {
	                if (isFileUsedInPost(ckfile.getName(), post)) {
	                    try {
	                        String uploadFilePath = uploadFolderPath + "/" + ckfile.getName();
	                        Files.copy(ckfile.toPath(), Paths.get(uploadFilePath), StandardCopyOption.REPLACE_EXISTING);

	                        // 이미지 주소 변경
	                        String imageUrlInContentTemp = "/temp/" + ckfile.getName();
	                        String imageUrlInContentUpload = "/upload/" + ckfile.getName();
	                        String modifiedContent = post.getContent().replace(imageUrlInContentTemp, imageUrlInContentUpload);
	                   
	                        post.setContent(modifiedContent);
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	                }
	                
	                ckfile.delete();
	            }
	        }
	    }
	 // 글쓰기 업로드
	    	
	    	int find_postid = Postsservice.addPost(post); 
	    	 // 멀티 파일 업로드 기능 구현
		    for (MultipartFile file : files) {
		        if (!file.isEmpty()) {
		            try {

		                String originalFilename = file.getOriginalFilename();
		                String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

		                String randomFileName = UUID.randomUUID().toString() + extension;

		                String uploadPath = "C:/upload/";

		                File saveFile = new File(uploadPath + randomFileName);
		                file.transferTo(saveFile);
		                String fileUrl = "upload/" + randomFileName;

		                FileDTO fileDto = new FileDTO();
		                
						fileDto.setRealname(originalFilename);
						fileDto.setExtension(extension);
						fileDto.setFilename(randomFileName);
						fileDto.setUploadpath(uploadPath);
						fileDto.setFileurl(fileUrl);
						fileDto.setPostid(find_postid);
		             
		           // 파일 정보 db에 등록
		                fservice.insert(fileDto);
		            } catch (IOException e) {
		            }
		        }
		    }
		    
		    if(find_postid != 0) {
		    	model.addAttribute("msg", "등록완료했다");
		    	return "redirect:/post?PostID="+find_postid;
		    }else {
		    	model.addAttribute("msg", "등록실패");
		    	return "redirect:/";
		    }
	    }
	 

	// 등록된 글의 content에 실제로 업로드 된 이미지 파일들을 확인
	private boolean isFileUsedInPost(String fileName, PostsDTO post) {
	  String imageUrlInContent = "/temp/" + fileName;  
	  
	  boolean usedInContent = post.getContent().contains(imageUrlInContent);
	  
	  return usedInContent;
	}
	
	
	
	//수정화면
		@RequestMapping(value = "/updatePost", method = RequestMethod.GET)
		public String updatePost(Locale locale, Model model, HttpSession session,@RequestParam("PostID") int PostID) {
			UsersDTO uDTO = (UsersDTO)session.getAttribute("User");
			if(uDTO == null) {
				return "redirect:/login";
			}
		    model.addAttribute("read", Postsservice.read(PostID));
			return "community/community_updatePost";
		}
		
		
		@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
		public String updatePost(HttpSession session, PostsDTO post, @RequestParam("files") MultipartFile[] files, Model model) {
		    UsersDTO udto = (UsersDTO) session.getAttribute("User");
		    post.setAuthorID(udto.getUserID());
		    
		    /////////  ckeditor 관련 실제로 업로드 된 파일들을 임시폴더 -> 정식 업로드 폴더로 옮기고 임시폴더의 파일들은 삭제함
		    String tempFolderPath = "C:/temp";
		    String uploadFolderPath = "C:/upload";
		    File tempFolder = new File(tempFolderPath);
		    File[] ckfiles = tempFolder.listFiles();
		    
		    if (files != null) {
		        for (File ckfile : ckfiles) {
		            if (ckfile.isFile()) {
		                if (isFileUsedInPost(ckfile.getName(), post)) {
		                    try {
		                        String uploadFilePath = uploadFolderPath + "/" + ckfile.getName();
		                        Files.copy(ckfile.toPath(), Paths.get(uploadFilePath), StandardCopyOption.REPLACE_EXISTING);

		                        // 이미지 주소 변경
		                        String imageUrlInContentTemp = "/temp/" + ckfile.getName();
		                        String imageUrlInContentUpload = "/upload/" + ckfile.getName();
		                        String modifiedContent = post.getContent().replace(imageUrlInContentTemp, imageUrlInContentUpload);
		                   
		                        post.setContent(modifiedContent);
		                    } catch (IOException e) {
		                        e.printStackTrace();
		                    }
		                }
		                
		                ckfile.delete();
		            }
		        }
		    }
		 // 글쓰기 업로드
		    	int find_postid = Postsservice.updateContent(post); 
		    	 // 멀티 파일 업로드 기능 구현
			    for (MultipartFile file : files) {
			        if (!file.isEmpty()) {
			            try {

			                String originalFilename = file.getOriginalFilename();
			                String extension = originalFilename.substring(originalFilename.lastIndexOf("."));

			                String randomFileName = UUID.randomUUID().toString() + extension;

			                String uploadPath = "C:/upload/";

			                File saveFile = new File(uploadPath + randomFileName);
			                file.transferTo(saveFile);
			                String fileUrl = "upload/" + randomFileName;

			                FileDTO fileDto = new FileDTO();
			                
							fileDto.setRealname(originalFilename);
							fileDto.setExtension(extension);
							fileDto.setFilename(randomFileName);
							fileDto.setUploadpath(uploadPath);
							fileDto.setFileurl(fileUrl);
							fileDto.setPostid(find_postid);
			             
			           // 파일 정보 db에 등록
			                fservice.update(fileDto);
			       
			            } catch (IOException e) {
			            }
			        }
			    }
			    
			    if(find_postid != 0) {
			    	model.addAttribute("msg", "등록완료했다");
			    	return "redirect:/post?PostID="+find_postid;
			    }else {
			    	model.addAttribute("msg", "등록실패");
			    	return "redirect:/";
			    }
		    }
	
}
