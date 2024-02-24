package kr.co.softsoldesk.beans;


public class MessageBean {
	
    private String text;
    private int senderId;
    private int user_id;
    private int pro_id;
    private int room_id;
    
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getSenderId() {
		return senderId;
	}
	public void setSenderId(int senderId) {
		this.senderId = senderId;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
    
    
}
