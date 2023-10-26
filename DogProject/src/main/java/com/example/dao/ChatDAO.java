package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.ChatMessageDTO;
import com.example.dto.ChatRoomDTO;

@Repository
public class ChatDAO {
	@Autowired
	SqlSessionTemplate session;

	//모든채팅방 조회
	public List<ChatRoomDTO> findAllRoom() {
		return session.selectList("ChatMapper.findAllRoom");
	}

	//채팅방 생성
	public int createChatRoom(ChatRoomDTO chatRoomDTO) {
		return session.insert("ChatMapper.createChatRoom", chatRoomDTO);
	}
	
	//채팅방 채팅내용 불러오기
	public List<ChatMessageDTO> findAllChatMessage(int roomId) {
		return session.selectList("ChatMapper.findAllChatMessage", roomId);
	}
	
	//채팅방입장, 특정 채팅방 찾기
	public ChatRoomDTO findChatRoom(int roomId) {
		return session.selectOne("ChatMapper.findChatRoom", roomId);
	}

	//채팅방에서 채팅전송
	public int sendChat(ChatMessageDTO chatMessageDto) {
		return session.insert("ChatMapper.sendChat", chatMessageDto);
	}

	//비공개채팅방 입장시 암호확인
	public int roomPwdCh(ChatRoomDTO dto) {
		return session.selectOne("ChatMapper.roomPwdCh", dto);
	}

	//대화방입장 시 현재인원과 정원찾기
	public ChatRoomDTO chkUserCnt(int roomId) {
		return session.selectOne("ChatMapper.chkUserCnt",roomId);
	}

	//대화방 제거
	public void delChatRoom(int roomId) {
		session.delete("ChatMapper.delChatRoom",roomId);
	}

	

}
