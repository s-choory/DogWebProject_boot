package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("ChatRoom")
public class ChatRoomDTO {
    private int roomId; 	   //시퀀스번호(CHATROOM_SEQ), (PK)
    private String roomName;   //대화방이름
    private int userCnt;	   //접속인원 수
    private int maxUserCnt;	   //최대정원 수
    private boolean secretChk; //비공개방 여부
    private String roomPwd;	   //대화방 암호

	public ChatRoomDTO() {}
	public ChatRoomDTO(int roomId, String roomPwd) {
		this.roomId = roomId;
		this.roomPwd = roomPwd;
	}
	public ChatRoomDTO(int userCnt, int maxUserCnt) {
		this.userCnt = userCnt;
		this.maxUserCnt = maxUserCnt;
	}
	public ChatRoomDTO(int roomId, String roomName, int userCnt, int maxUserCnt, boolean secretChk, String roomPwd) {
		super();
		this.roomId = roomId;
		this.roomName = roomName;
		this.userCnt = userCnt;
		this.maxUserCnt = maxUserCnt;
		this.secretChk = secretChk;
		this.roomPwd = roomPwd;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getUserCnt() {
		return userCnt;
	}
	public void setUserCnt(int userCnt) {
		this.userCnt = userCnt;
	}
	public boolean isSecretChk() {
		return secretChk;
	}
	public void setSecretChk(boolean secretChk) {
		this.secretChk = secretChk;
	}
	public String getRoomPwd() {
		return roomPwd;
	}
	public void setRoomPwd(String roomPwd) {
		this.roomPwd = roomPwd;
	}
	public int getMaxUserCnt() {
		return maxUserCnt;
	}
	public void setMaxUserCnt(int maxUserCnt) {
		this.maxUserCnt = maxUserCnt;
	}
	@Override
	public String toString() {
		return "ChatRoomDTO [roomId=" + roomId + ", roomName=" + roomName + ", userCnt=" + userCnt + ", maxUserCnt="
				+ maxUserCnt + ", secretChk=" + secretChk + ", roomPwd=" + roomPwd + "]";
	}
	

}
