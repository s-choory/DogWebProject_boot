package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.Message;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dto.ChatMessageDTO;
import com.example.dto.ChatRoomDTO;
import com.example.service.ChatService;


@Controller
public class ChatController {
	@Autowired
	ChatService chatService;
	private SimpMessagingTemplate messagingTemplate;
	
	//채팅방리스트 조회화면
    @GetMapping("/roomList")
    public String roomList(Model model) {
        List<ChatRoomDTO> roomList = chatService.findAllRoom();
        model.addAttribute("roomList", roomList);
        return "chatting/roomList";
    }
    
    //채팅방 생성화면
    @GetMapping("/roomAdd")
    public String roomAdd() {
    	return "chatting/roomAdd";
    }
    
    //채팅방 등록
    @PostMapping("/roomAdd")
    public String doRoomAdd(ChatRoomDTO chatRoomDTO) {
    	chatService.createChatRoom(chatRoomDTO);
    	return "redirect:/roomList";
    }
    
    //채팅방 입장
    @GetMapping("/chatRoom/{roomId}")
    public String joinRoom(@PathVariable(required = false)int roomId, Model model) {
    	//채팅방 채팅내용 불러오기
    	List<ChatMessageDTO> chatList = chatService.findAllChatMessage(roomId);
    	model.addAttribute("roomId", roomId);
    	model.addAttribute("chatList", chatList);
    	return "chatting/chatRoom";
    }
    
    //비공개채팅방 입장시 암호확인
    @ResponseBody
    @PostMapping("/chatRoom/confirmPwd/{roomId}")
    public int confirmPwd(@PathVariable int roomId, @RequestParam String roomPwd) {
    	//System.out.println("roomId : "+roomId + "roomPwd : "+roomPwd);
    	ChatRoomDTO dto = new ChatRoomDTO(roomId, roomPwd);
    	int result = chatService.roomPwdCh(dto);
    	//System.out.println(result);
    	return result;
    }
    
    //대화방입장 시  인원에 따른 입장가능 여부
    @ResponseBody
    @GetMapping("/chatRoom/chkUserCnt/{roomId}")
    public boolean chkUserCnt(@PathVariable int roomId) {
    	ChatRoomDTO dto = chatService.chkUserCnt(roomId);
    	//인원이 추가될 시 총원보다 크거나 같을경우
    	if(dto.getUserCnt()+1 > dto.getMaxUserCnt()) {
    		return false;
    	}
    	return true;
    }
    
    //대화방 인원증가
    public void plusUserCnt(int roomId){
    	ChatRoomDTO dto = chatService.chkUserCnt(roomId);
    	int userCnt = dto.getUserCnt();
    	int maxUserCnt = dto.getMaxUserCnt();
    	if(userCnt > maxUserCnt) {
    		userCnt = maxUserCnt;
    	}
    	dto.setUserCnt(userCnt+1);
    }

    //대화방 인원감소
    public void minusUserCnt(int roomId){
    	ChatRoomDTO dto = chatService.chkUserCnt(roomId);
    	int userCnt = dto.getUserCnt();
    	if(userCnt < 0) {
    		userCnt = 0;
    	}
    	dto.setUserCnt((userCnt-1));
    }    
    
    //대화방 제거
    @GetMapping("chatRoom/delRoom/{roomId}")
    public String delChatRoom(@PathVariable int roomId){
    	chatService.delChatRoom(roomId);
        return "redirect:/roomList";
    }
    
    
    //채팅방에서 채팅전송
	@MessageMapping("/{roomId}") // 여기로 전송되면 메서드 호출 -> WebSocketConfig prefixes 에서 적용한건 앞에 생략
	@SendTo("/room/{roomId}") // 구독하고 있는 장소로 메시지 전송 (목적지) -> WebSocketConfig Broker 에서 적용한건 앞에 붙어줘야됨
	public ChatMessageDTO sendChat(@DestinationVariable int roomId, ChatMessageDTO messageDto) {
		ChatMessageDTO chatMessage = new ChatMessageDTO(roomId, messageDto.getSender(), messageDto.getMessage());
		chatService.sendChat(chatMessage);
		return chatMessage;
	}
    

	@RequestMapping("/chat")
	public String chat() {
		return "chat";
	}
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	
	
    @MessageMapping("/chat")
    public void draw(Message<Object> message, String data){
        messagingTemplate.convertAndSend("/topic/chat", data);
    }
    
	
    @MessageMapping("/stomp")
    @SendTo("/topic/stomp")
    public ResponseEntity<String> stomp(String request) {
        return new ResponseEntity<String>(request, HttpStatus.OK);
    }
    
//	@MessageMapping("/hello")
//	@SendTo("/topic/greetings") // topic의 greetings 라는 방
//	public Greeting greeting(HelloMessage message) throws Exception {
//		Thread.sleep(500); // simulated delay
//		return new Greeting("Hello, " + message.getName() + "!");
//	}
    
	
}