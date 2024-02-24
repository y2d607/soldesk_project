package kr.co.softsoldesk.beans;

public class UserBean {
	private int user_id;
	private String user_name;
	private String user_email;
	private String user_pwd;  
	private String confirmPassword;
	private boolean userEmailExist;
	private boolean userLogin;
	private int reportCnt; 
	private int postCount;  
	
	
	
	public int getPostCount() {
		return postCount;
	}
	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}
	public int getReportCnt() {
		return reportCnt;
	}
	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}
	public UserBean() { 
		this.userEmailExist = false; // 초기값 false
		// 초기화, 처음에는 중복검사를 하지 않으므로 디폴트 값을 false로 주입
		this.userLogin = false;
		// 초기화, 로그아웃 상태
	}
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
 
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	} 
	public String getUser_email() {
		return user_email;
	}
 
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	} 
	public String getUser_pwd() {
		return user_pwd;
	} 
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	} 

 
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
 

	public boolean isUserEmailExist() {
		return userEmailExist;
	}

	public void setUserEmailExist(boolean userEmailExist) {
		this.userEmailExist = userEmailExist;
	} 
	public boolean isUserLogin() {
		return userLogin;
	} 
	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}



	
}
