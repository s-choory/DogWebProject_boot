package com.example.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.CalendarDTO;
import com.example.dto.UsersDTO;
import com.example.service.CalendarService;
import com.example.service.UsersService;

@Controller
public class CalendarController {
	
	@Autowired
	CalendarService calservice;
	@Autowired
	UsersService service;
	
	/* mypage */
	// 기본 calendar 조회
//	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
//	public String mypage(Locale locale, Model model) {
//		return "mypage/calendar";
//	}// end mypage
	
	//selectEvent DB조회 
	@GetMapping("/mypage/calendar")
	@ResponseBody
	 	public List<Map<String, Object>> selectEvent(HttpSession session) {
		
		UsersDTO user = (UsersDTO)session.getAttribute("User");
        String userid= user.getUserID();
        
        List<CalendarDTO> listAll = calservice.selectEvent(userid);
        JSONArray jsonArr = new JSONArray(); // 디펜더시 추가함
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",Locale.KOREA);
		
        
        for (int i = 0; i < listAll.size(); i++) {
        	HashMap<String, Object> map = new HashMap<String, Object>();
       // 	map.put("userid", listAll.get(i).getCalendaruserid());
        	map.put("title", listAll.get(i).getCalendartitle());
        	map.put("start", listAll.get(i).getCalendarstart().format(dateTimeFormatter));
        	map.put("end", listAll.get(i).getCalendarend().format(dateTimeFormatter));
            
        	JSONObject jsonObj = new JSONObject(map);
            jsonArr.add(jsonObj);
            
        }
        
        LocalDateTime dateTime = LocalDateTime.now();
        String formattedDateTime = dateTime.toString();
        
        return jsonArr;
       
    }// end selectEvent

	// 이벤트 생성
	@PostMapping(value = "/mypage/calendar/addEvent")
    @ResponseBody
	public String addEvent(@RequestBody List<Map<String, Object>> param, HttpSession session, UsersDTO dto){
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",Locale.KOREA);
		for (int i = 0; i < param.size(); i++) {
			String eventName= (String)param.get(i).get("title");
			String startDateString= (String)param.get(i).get("start");
			String endDateString= (String)param.get(i).get("end");
			
			// 얘 필요한가? Test 해보기
			LocalDateTime startDateUTC = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime endDateUTC = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime endDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            CalendarDTO calDTO= new CalendarDTO();
            calDTO.setCalendartitle(eventName);
            calDTO.setCalendarstart(startDate);
         	calDTO.setCalendarend(endDate);
            
            UsersDTO user = (UsersDTO)session.getAttribute("User");
            String userid= user.getUserID();
            
            int n= calservice.addEvent(calDTO, userid);
            
		} // end for
		return "mypage/calendar/addEvent";
	}// end addEvent
	
	// 캘린더 이벤트 삭제
	@DeleteMapping("/mypage/calendar/deleteEvent")
	@ResponseBody
	public String deleteEvent(@RequestBody List<Map<String, Object>> param, HttpSession session) {
		
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",Locale.KOREA);
		for (Map<String, Object> list : param) {
            
           String startDateString = (String) list.get("start");
           String endDateString = (String) list.get("end");
 
           LocalDateTime startDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
           LocalDateTime endDate = LocalDateTime.parse(endDateString, dateTimeFormatter);

           CalendarDTO calDTO= calservice.findcalNO(startDate, endDate);
           
           Integer calNO= calDTO.getCalendarNo();
          
           int n= calservice.deleteEvent(calNO);
           
        }
		
        return "mypage/calendar/deleteEvent";
    }// end deleteEvent
	
	@PatchMapping("mypage/calendar/updateEvent")
	@ResponseBody
	public String modifyEvent(@RequestBody List<Map<String, Object>> param){
		 
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.KOREA);
 
        for (Map<String, Object> list : param) {
        	 
            String eventName = (String) list.get("title"); // 일정name 받아오기
            String startDateString = (String) list.get("start");
            String endDateString = (String) list.get("end");
 
            String oldTitle = (String) list.get("oldTitle");
            
            String oldStartString = (String) list.get("oldStart");
            String oldEndString = (String) list.get("oldEnd");
 
            LocalDateTime modifiedStartDate = LocalDateTime.parse(startDateString, dateTimeFormatter);
            LocalDateTime modifiedEndDate = LocalDateTime.parse(endDateString, dateTimeFormatter);
            
            LocalDateTime oldStart = LocalDateTime.parse(oldStartString, dateTimeFormatter);
            LocalDateTime oldEnd = LocalDateTime.parse(oldEndString, dateTimeFormatter);
 
            CalendarDTO calDTO= calservice.findCalDate(oldStart, oldEnd);
            
            Integer calNo = calDTO.getCalendarNo();
            
            CalendarDTO updateDTO= new CalendarDTO();
            updateDTO.setCalendartitle(eventName);
            updateDTO.setCalendarstart(modifiedStartDate);
            updateDTO.setCalendarend(modifiedEndDate);
         	
            calservice.upDateEvent(calNo, updateDTO);
            
        }
        return "mypage/calendar/updateEvent";
	
	}// end updateEvent
	
	
}// end class