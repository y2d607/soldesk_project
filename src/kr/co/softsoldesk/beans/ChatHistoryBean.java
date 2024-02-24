package kr.co.softsoldesk.beans;

import java.time.LocalDateTime;

public class ChatHistoryBean {
	
	private int chat_id; // ID는 시퀀스를 통해 자동 할당됩니다.
    private int room_id; 
    private String content;
    private LocalDateTime chattime;
    private int senderId;
    private int pro_id;
    
	public int getChat_id() {
		return chat_id;
	}
	public void setChat_id(int chat_id) {
		this.chat_id = chat_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getChattime() {
		return chattime;
	}
	public void setChattime(LocalDateTime chattime) {
		this.chattime = chattime;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
    
}