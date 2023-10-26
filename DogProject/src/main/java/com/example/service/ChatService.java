package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ChatDAO;
import com.example.dto.ChatMessageDTO;
import com.example.dto.ChatRoomDTO;

@Service
public class ChatService {
	@Autowired
	ChatDAO chatDao;

	//모든채팅방 조회
	public List<ChatRoomDTO> findAllRoom() {
		return chatDao.findAllRoom();
	}

	//채팅방 생성
	public int createChatRoom(ChatRoomDTO chatRoomDTO) {
		return chatDao.createChatRoom(chatRoomDTO);
	}
	
	//채팅방 채팅내용 불러오기
	public List<ChatMessageDTO> findAllChatMessage(int roomId) {
		return chatDao.findAllChatMessage(roomId);
	}

	//채팅방입장, 특정 채팅방 찾기 -- 제거대상
    public ChatRoomDTO findChatRoom(int roomId) {
		return chatDao.findChatRoom(roomId);
	}

    //채팅방에서 채팅전송 -- 미완
	public int sendChat(ChatMessageDTO chatMessageDto) {
		return chatDao.sendChat(chatMessageDto);
	}

	//비공개채팅방 입장시 암호확인
	public int roomPwdCh(ChatRoomDTO dto) {
		return chatDao.roomPwdCh(dto);
	}

	//대화방입장 시 정원확인
	public ChatRoomDTO chkUserCnt(int roomId) {
		return chatDao.chkUserCnt(roomId);
	}

	//대화방 제거
	public void delChatRoom(int roomId) {
		chatDao.delChatRoom(roomId);
	}





	  
	//채팅방에서 채팅전송
//	public ChatMessageDTO sendChat(int roomId, String sender, String message) {
//		//ChatRoomDTO chatRoom = findChatRoom(roomId);//데이터를 전송할 채팅방찾음
//		return chatDao.sendChat(new ChatMessageDTO(roomId, sender, message));
//	}

    
	  //채팅 생성
//    public Chat createChat(Long roomId, String sender, String message) {
//        Room room = roomRepository.findById(roomId).orElseThrow();  //방 찾기 -> 없는 방일 경우 여기서 예외처리
//        return chatRepository.save(Chat.createChat(room, sender, message));
//    }

}
