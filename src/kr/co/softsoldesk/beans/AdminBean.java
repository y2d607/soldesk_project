package kr.co.softsoldesk.beans;

public class AdminBean {
	private String admin_id ;
	private String admin_pwd ;
	private boolean AdminLogin;
	 
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pwd() {
		return admin_pwd;
	}
	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}  
	public AdminBean() {   
		this.AdminLogin = false; 
	}
	public boolean isAdminLogin() {
		return AdminLogin;
	}
	public void setAdminLogin(boolean adminLogin) {
		AdminLogin = adminLogin;
	}
	
	
}
