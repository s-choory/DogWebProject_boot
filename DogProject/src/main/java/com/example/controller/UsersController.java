package com.example.controller;

import java.util.HashMap;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.config.SecurityConfig;
import com.example.config.WebSecurityConfig;
import com.example.dto.UsersDTO;
import com.example.service.UsersService;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class UsersController {
	
	@Autowired
	private UsersService service;
	@Autowired
	WebSecurityConfig WebSecurityConfig;
	
	@GetMapping(value = "/login")
	public String login(Model model) {
		return "member/login";
	}

	//로그인 조건 체크
	@RequestMapping(value = "/loginChk", method = RequestMethod.POST)
	public String loginChk(HttpSession session, UsersDTO dto) {
		
		UsersDTO checkedDTO = service.loginChk(dto);
		
		String href = "redirect:/login";
		if(checkedDTO != null) {
			//DB에 저장된 비번과 파라미터로 받은 비번 비교
			
			if(SecurityConfig.getPasswordEncoder().matches(dto.getPassword(), checkedDTO.getPassword())) {
				session.setAttribute("User",checkedDTO);
				href = "redirect:/";		
			} else {
				session.setAttribute("msg", "패스워드를 잘못 입력했습니다");
			}
		}else {
			session.setAttribute("msg", "아이디를 잘못 입력했습니다.");
		}
		return href;
	}
	
	
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("User");
		return "redirect:/";
	}
	
	
	//회원가입 동의
	@RequestMapping(value = "/membership_agree", method = RequestMethod.GET)
	public String membership_agree(Locale locale, Model model) {
		return "member/membership_agree";
	}
	//회원가입 정보입력
	@RequestMapping(value = "/membership_sign", method = RequestMethod.GET)
	public String membership_sign(Locale locale, Model model) {
		return "member/membership_sign";
	}
	//아이디 체크
	@RequestMapping(value = "/idChk", method = RequestMethod.POST,  produces = "text/plain;charset=UTF-8")
	public @ResponseBody String idChk(String UserID) {
		int n  = service.idChk(UserID);
		String mesg = "사용가능 아이디입니다";
		if(n == 1 || UserID.length() < 4 || UserID.length() > 12) {
			mesg = "사용불가 아이디입니다";
		}
		return mesg;
	}
	//별명 체크
	@RequestMapping(value = "/aliasChk", method = RequestMethod.POST,  produces = "text/plain;charset=UTF-8")
	public @ResponseBody String UserAlias(String UserAlias) {
		int n  = service.aliasChk(UserAlias);
		String mesg = "사용가능 별명입니다";
		if(n == 1) {
			mesg = "사용불가 별명입니다";
		}
		return mesg;
	}
	//회원등록
	@RequestMapping(value = "/memberAdd", method = RequestMethod.POST)
	public String memberAdd(HttpSession session, Model model, UsersDTO user) {
		
		String str = "redirect:/membership_sign";
		String s = idChk(user.getUserID());
		if(s.equals("사용불가 아이디입니다")) {	//UserID 중복일때
			model.addAttribute("msg", "회원가입 실패");
			return str;
		}
		
		//암호화
		String password = user.getPassword();
		String encodePW = SecurityConfig.getPasswordEncoder().encode(password);
		user.setPassword(encodePW);
		
		
		int n = service.memberAdd(user);
		
		if(n == 1) {
			UsersDTO checkedDTO = service.loginChk(user);
			session.setAttribute("User",checkedDTO);
			str = "redirect:/";
		}
		return str;
	}
	
	//아이디찾기
	@RequestMapping(value="/findID", method = RequestMethod.GET)
	public String findID() {
		return "member/findID";
	}

	//비밀번호찾기1
	@RequestMapping(value="/findPW", method = RequestMethod.GET)
	public String findPW(HttpSession session) {
		return "member/findPW";
	}
	//비밀번호찾기2. 아이디 있는지 검사
	@RequestMapping(value="/findPW2", method = RequestMethod.GET)
	public String findPW2(String UserID, Model model, HttpSession session) {
		int n = service.idChk(UserID);
		if(n == 1) {
			model.addAttribute("UserID", UserID);
			return "member/findPW2";
		}else {
			session.setAttribute("msg", "해당 아이디가 존재하지 않습니다.");
			return "redirect:/findPW";
		}
	}
	
	//휴대폰 인증번호 보내기
	@RequestMapping(value="/sendNumber", method = RequestMethod.POST)
	@ResponseBody
	public String sendNumber(String PhoneNumber){
        Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<6; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }
        
		String apiKey = "NCSCTEIDBZTOQ6LU";
		String apiSecretKey = "V99CEJPQLFJC0YV44KCXAMUMK0MTH174";
		String domain = "https://api.coolsms.co.kr";
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecretKey, domain);

        Message message = new Message();
        message.setFrom("01092681933");
        message.setTo(PhoneNumber);
        message.setText("DoggyDoggy\n"+
        "인증번호는["+numStr+"]입니다.");
        System.out.println(numStr);
        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
        
        return numStr;
	}
	
	//아이디 찾기 확인
	@RequestMapping(value="/findIDConfirm", method = RequestMethod.GET)
	public String findIDConfirm(UsersDTO uDTO, Model model) {
		//DB에는 010-1234-1234형태로 저장되어있기 때문에 하이픈을 추가한다.
		String PhoneNumber = uDTO.getPhoneNumber();
		String insertion = "-";
		
		StringBuffer stringBuffer = new StringBuffer(PhoneNumber);
		stringBuffer.insert(3, insertion);
		stringBuffer.insert(8, insertion);
		String result = stringBuffer.toString();
		uDTO.setPhoneNumber(result);
		
		UsersDTO user = service.findID(uDTO);
		if(user != null) {
			model.addAttribute("UserID", user.getUserID());
		}
		return "member/findIDConfirm";
	}
	
	//비밀번호 찾기 확인
	@RequestMapping(value = "/findPWConfirm", method = RequestMethod.POST)
	public String findPWConfirm(UsersDTO uDTO, HttpSession session, Model model) {
		//DB에는 010-1234-1234형태로 저장되어있기 때문에 하이픈을 추가한다.
		if(uDTO.getPhoneNumber() == null || uDTO.getUserName() == null || uDTO.getPhoneNumber().length() != 11) {
			session.setAttribute("msg", "이름과 휴대번호 정보를 제대로 입력하세요");
			return "redirect:/findPW2?UserID="+uDTO.getUserID();
		}
		String PhoneNumber = uDTO.getPhoneNumber();
		String insertion = "-";
		
		StringBuffer stringBuffer = new StringBuffer(PhoneNumber);
		stringBuffer.insert(3, insertion);
		stringBuffer.insert(8, insertion);
		String result = stringBuffer.toString();
		uDTO.setPhoneNumber(result);
		
		UsersDTO user = service.findPW(uDTO);
		model.addAttribute("user", user);
		
		return "member/findPWConfirm";
	}
	
	//비밀번호 변경
	@RequestMapping(value="/changePW", method = RequestMethod.POST)
	public String changePW(UsersDTO uDTO, HttpSession session) {
		//암호화
		String password = uDTO.getPassword();
		String encodePW = SecurityConfig.getPasswordEncoder().encode(password);
		uDTO.setPassword(encodePW);
		
		int n = service.updatePW(uDTO);
		session.setAttribute("msg", "비밀번호를 변경했습니다.");
		return "redirect:/login";
	}

}
