package com.example.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Alias("CalendarDTO")
public class CalendarDTO {

		private int calendarNo;
		private String calendaruserid;
		private String calendartitle; // 일정
		
		// 서버 Get요청 @modelAttribute 에는 DateTimeFormat 사용
		// 서버 Post요청 @requestBody에는 Json객체를 두개다 사용, 모두 사용시 @JsonFormat이 먼저 적용
		// 서버 응답 시 ResponseBody에서는 @JsonFormat만 적용
		// , timezone = "GMT+9"
		@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul") // 타임존 안되면 이걸로 바꿔보자 GMT+9 : default utc로 되어 있기 때문에 +9해줘야 맞는다
	//	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9") // 타임존 안되면 이걸로 바꿔보자 GMT+9 : default utc로 되어 있기 때문에 +9해줘야 맞는다
	//	@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9") // 타임존 안되면 이걸로 바꿔보자 GMT+9 : default utc로 되어 있기 때문에 +9해줘야 맞는다
		@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
		private LocalDateTime calendarstart; // 시작시간
//		private String calendarstart; // 시작시간
		//@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+9")
//		@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
//		@JsonFormat(pattern = "yyyy-MM-dd HH:mm", timezone = "GMT+9")
		@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
		@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
		private LocalDateTime calendarend;	// 끝나는 시간
//		private String calendarend;	// 끝나는 시간
		// 까지 기본

		public CalendarDTO() {
			super();
			// TODO Auto-generated constructor stub
		}

//		public CalendarDTO(int calendarNo, String calendaruserid, String calendartitle, LocalDateTime calendarstart,
//				LocalDateTime calendarend) {
//			super();
//			this.calendarNo = calendarNo;
//			this.calendaruserid = calendaruserid;
//			this.calendartitle = calendartitle;
//			this.calendarstart = calendarstart;
//			this.calendarend = calendarend;
//		}

		
		public int getCalendarNo() {
			return calendarNo;
		}
		@Override
		public String toString() {
			return "CalendarDTO [calendarNo=" + calendarNo + ", calendaruserid=" + calendaruserid + ", calendartitle="
					+ calendartitle + ", calendarstart=" + calendarstart + ", calendarend=" + calendarend + "]";
		}

		public void setCalendarNo(int calendarNo) {
			this.calendarNo = calendarNo;
		}
		public String getCalendaruserid() {
			return calendaruserid;
		}
		public void setCalendaruserid(String calendaruserid) {
			this.calendaruserid = calendaruserid;
		}
		public String getCalendartitle() {
			return calendartitle;
		}
		public void setCalendartitle(String calendartitle) {
			this.calendartitle = calendartitle;
		}

		public LocalDateTime getCalendarstart() {
			return calendarstart;
		}

		public void setCalendarstart(LocalDateTime calendarstart) {
			this.calendarstart = calendarstart;
		}

		public LocalDateTime getCalendarend() {
			return calendarend;
		}

		public void setCalendarend(LocalDateTime calendarend) {
			this.calendarend = calendarend;
		}

		

}
