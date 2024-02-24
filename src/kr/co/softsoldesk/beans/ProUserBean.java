package kr.co.softsoldesk.beans;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
 
import javax.validation.constraints.Size;

public class ProUserBean {
	private int pro_id; 
	private String pro_email;
	private int reportCnt;
	@Size(min = 2, max = 8)
	private String pro_name;
	
	private String active_location;
	
	private String[] active_detailcategory = new String[3];
	private String active_detailcategory1;
	private String active_detailcategory2;
	private String active_detailcategory3;
	
	@Size(min = 4, max = 20)
	private String pro_pwd;
	@Size(min = 4, max = 20) 
	private String confirmPassword;
	private String pro_gender;
	private boolean prouserEmailExist;
	private boolean prouserLogin;  
	private int postCount;   
	private String certification_documents_images;
	
	
	public String getCertification_documents_images() {
		return certification_documents_images;
	}
	public void setCertification_documents_images(String certification_documents_images) {
		this.certification_documents_images = certification_documents_images;
	}

	private int quote_history_id;
	private String received_quote;   
	  
	
	
	public int getQuote_history_id() {
		return quote_history_id;
	}
	public void setQuote_history_id(int quote_history_id) {
		this.quote_history_id = quote_history_id;
	}
	public String getReceived_quote() {
		return received_quote;
	}
	public void setReceived_quote(String received_quote) {
		this.received_quote = received_quote;
	}
	public ProUserBean() { 
		this.prouserEmailExist = false; // 초기값 false
		// 초기화, 처음에는 중복검사를 하지 않으므로 디폴트 값을 false로 주입
		this.prouserLogin = false;
		// 초기화, 로그아웃 상태
	}
	public int getPostCount() { //!!! 게시글 카운트 !!!
		return postCount;
	}

	public void setPostCount(int postCount) { ///!!! 게시글 카운트 !!!
		this.postCount = postCount;
	}

	public int getReportCnt() {
		return reportCnt;
	}



	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}



	public String getPro_gender() {
		return pro_gender;
	}



	public void setPro_gender(String pro_gender) {
		this.pro_gender = pro_gender;
	}

 



	public boolean isProuserEmailExist() {
		return prouserEmailExist;
	}

	public void setProuserEmailExist(boolean prouserEmailExist) {
		this.prouserEmailExist = prouserEmailExist;
	}

	public boolean isProuserLogin() {
		return prouserLogin;
	}

	public void setProuserLogin(boolean prouserLogin) {
		this.prouserLogin = prouserLogin;
	}

	public String getPro_email() {
		return pro_email;
	}

	public void setPro_email(String pro_email) {
		this.pro_email = pro_email;
	}

	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	 
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getActive_location() {
		return active_location;
	}
	public void setActive_location(String active_location) {
		this.active_location = active_location;
	}

	 
	public String[] getActive_detailcategory() {
        return active_detailcategory;
    }

    public void setActive_detailcategory(String[] active_detailcategory) {
    	 
            // 배열의 길이에 따라 각 변수에 값을 할당
            if (active_detailcategory[0]==null) {
            	 active_detailcategory1 = null;
            }
            active_detailcategory1 = active_detailcategory[0];
	             
            if (active_detailcategory[1]==null) {
            	 active_detailcategory2 = null;
            }
            active_detailcategory2 = active_detailcategory[1];
            
            if (active_detailcategory[2]==null) {
            	 active_detailcategory3 = null;
            }
            active_detailcategory3 = active_detailcategory[2]; 
    	}
	  
	public String getActive_detailcategory1() {
			return active_detailcategory1;
		}

		public void setActive_detailcategory1(String active_detailcategory1) {
			this.active_detailcategory1 =  active_detailcategory[0]; 
		}

		public String getActive_detailcategory2() {
			return active_detailcategory2;
		}

		public void setActive_detailcategory2(String active_detailcategory2) {
			this.active_detailcategory2 = active_detailcategory[1];
		}

		public String getActive_detailcategory3() {
			return active_detailcategory3;
		}

		public void setActive_detailcategory3(String active_detailcategory3) {
			this.active_detailcategory3 =  active_detailcategory[2];
		}

	public String getPro_pwd() {
		return pro_pwd;
	}

	public void setPro_pwd(String pro_pwd) {
		this.pro_pwd = pro_pwd;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	} 
	
}
