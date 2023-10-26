package com.example.dto;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("ChatMessage")
public class ChatMessageDTO {
    private int roomId;		//발송지인 채팅방 (FK)
    private String sender;	//발송자
    private String message; //발송내용
    private LocalDateTime sendDate;//발송날짜
    
	public ChatMessageDTO() {}
	public ChatMessageDTO(int roomId, String sender, String message) {
		this.roomId = roomId;
		this.sender = sender;
		this.message = message;
	}
	public ChatMessageDTO(int roomId, String sender, String message, LocalDateTime sendDate) {
		this.roomId = roomId;
		this.sender = sender;
		this.message = message;
		this.sendDate = sendDate;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public LocalDateTime getSendDate() {
		return sendDate;
	}
	public void setSendDate(LocalDateTime sendDate) {
		this.sendDate = sendDate;
	}
	@Override
	public String toString() {
		return "ChatMessageDTO [roomId=" + roomId + ", sender=" + sender + ", message=" + message + ", sendDate="
				+ sendDate + "]";
	}
	
	
}
