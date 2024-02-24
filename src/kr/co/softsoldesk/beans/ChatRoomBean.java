package kr.co.softsoldesk.beans;

import java.time.LocalDateTime;

public class ChatRoomBean {

    private int room_id;  // ID는 시퀀스를 통해 자동 할당됩니다.
    private int user_id;
    private int pro_id;
    private LocalDateTime createdate;
    private String pro_name; // 전문가 이름
    
    
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
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
	public LocalDateTime getCreatedate() {
		return createdate;
	}
	public void setCreatedate(LocalDateTime createdate) {
		this.createdate = createdate;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	
    

    
}
