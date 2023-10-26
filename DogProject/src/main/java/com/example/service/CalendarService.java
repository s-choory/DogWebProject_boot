package com.example.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CalendarDAO;
import com.example.dto.CalendarDTO;

@Service("calservice")
public class CalendarService {

	@Autowired(required = false)
	CalendarDAO dao;
	
	// 조회
	public List<CalendarDTO> selectEvent(String userid) {
		return dao.selectEvent(userid);
	}
	// 생성
	public int addEvent(CalendarDTO calDTO, String userid) {
		calDTO.setCalendaruserid(userid);
		return dao.addEvent(calDTO, userid);
	}
	public int deleteEvent(Integer calNO) {
		return dao.deleteEvent(calNO);
	}
	
	public CalendarDTO findcalNO(LocalDateTime startDate, LocalDateTime endDate) {
        return dao.findcalNO(startDate, endDate);
    }
	public CalendarDTO findCalDate(LocalDateTime oldStart, LocalDateTime oldEnd) {
		return dao.findCalDate(oldStart, oldEnd);
	}
	public void upDateEvent(Integer calNo, CalendarDTO updateDTO) {
		dao.upDateEvent(calNo, updateDTO);
	}


	
}
