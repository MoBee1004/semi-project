package com.spring_movie.websocketTest;

import java.util.ArrayList;
import java.util.Map;




import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

public class WebsocketTest extends TextWebSocketHandler {

	private ArrayList<WebSocketSession> sessionList= new ArrayList<WebSocketSession>();
	

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//WebSocketSession의 session이나 HttpSession의 session은 같은 세션이지만 사용방법이 다르다. Object 모든 종류의 타입을 말한다. java의 모든 클래스는 Object를 상속받는다.
		System.out.println("afterConnectionEstablished() 호출");
		//접속때
		System.out.println("session.getId()"+session.getId());//session.getId()로 받은 고유아이디 값을 가지고 채팅기능을 만들것이다.
		sessionList.add(session); //로그인된 사람이 웹소켓페이지에 접속하면 session 안에는 그 사람의 로그인 아이디 attribute가 존재하게 된다. 
		                          //비로그인된 사람의 session에는 위 attribute가 존재하지 않는다. 
		System.out.println("sessionList.size():"+sessionList.size());
				
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed() 호출");
		//접속해제때
		System.out.println("session.getId()"+session.getId());
		sessionList.remove(session);
		System.out.println("sessionList.size():"+sessionList.size());
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메세지
		System.out.println("session.getId() :"+session.getId()); //보낸이의 세션객체의 아이디를 추출
		System.out.println("handleTextMessage() 호출");
		System.out.println("message.getPayload() : " + message.getPayload()); //보낸이의 메세지 객체에서 내용
		Gson gson = new Gson(); /*받아온 json을 java객체형식으로 바꿔줌*/
		
		
		WebsocketTestDto wdto = gson.fromJson(message.getPayload(), WebsocketTestDto.class); //보낸이의 메세지 객체를 Dto객체안의 각각의 필드값에 저장(msgUserId)
		
		
		System.out.println("wdto : "+wdto.getMsgComment()+" / "+wdto.getMsgUserId());
		//map::key:value 형태의 json형태의 데이터클래스(비슷한 예)int,String,List,Dto...)
		
		
		Map<String, Object> sessionMap1 =session.getAttributes();
		
		
		System.out.println("sessionMap1:"+sessionMap1);
		
		
		
		
		for(int i =0; i < sessionList.size(); i++) {
			
			if(!sessionList.get(i).getId().equals(session.getId())) {//세션리스트와 보낸이의 세션객체의 아이디를 꺼내 비교하여 같지 않을때 실행
				//sessionList에 session을 꺼내 그 안의 Attribute들을 String(키)와 Object(키안의 내용의 데이터 속성 :모든 타입)라는 속성의 데이터들로 정렬하여 
				//sessionMap안에 Map<K,V>라는 객체에 입력하겠다는 뜻. 
				Map<String, Object> sessionMap = sessionList.get(i).getAttributes();//세션들의 각종 세션정보(현재는 세션랜덤생성아이디와 세션로그인 아이디) 값을 java객체로 만듦.
				
				String loginId = wdto.getMsgUserId();
				System.out.println("보낸사람의 loginId : "+loginId);
				
				if(loginId.length()==0) {
					loginId="비로그인:"+session.getId();
					wdto.setMsgUserId(loginId);
				}else {
					wdto.setMsgUserId(loginId+":"+session.getId());
				}
				
				
				sessionList.get(i).sendMessage(new TextMessage(gson.toJson(wdto)));
				
				
			}
		}
	}
}
