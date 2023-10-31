package com.example.dao;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.CalendarDTO;

@Repository
public class CalendarDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public List<CalendarDTO> selectEvent(String userid) {
		return session.selectList("CalendarMapper.selectEvent", userid);
	}

	public int addEvent(CalendarDTO calDTO, String userid) {
		calDTO.setCalendaruserid(userid);
		return session.insert("CalendarMapper.addEvent", calDTO);
	}

	public int deleteEvent(Integer calNO) {
		return session.delete("CalendarMapper.deleteEvent", calNO);
	}

	public CalendarDTO findcalNO(LocalDateTime startDate, LocalDateTime endDate) {
        Map<String, Object> params = new HashMap<>();
        params.put("startDate", startDate);
        params.put("endDate", endDate);
        return session.selectOne("CalendarMapper.findcalNO", params);
    }

	public CalendarDTO findCalDate(LocalDateTime oldStart, LocalDateTime oldEnd) {
		Map<String, Object> params = new HashMap<>();
        params.put("oldStart", oldStart);
        params.put("oldEnd", oldEnd);
		return session.selectOne("CalendarMapper.findCalDate", params);
	}

	public void upDateEvent(Integer calNo, CalendarDTO updateDTO) {
		Map<String, Object> params = new HashMap<>();
        params.put("calNo", calNo);
        params.put("updateDTO", updateDTO);
        session.update("CalendarMapper.upDateEvent", params);
		
	}

	
	

}
