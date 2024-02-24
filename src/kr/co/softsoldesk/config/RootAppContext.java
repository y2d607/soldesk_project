package kr.co.softsoldesk.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ReportBean;
import kr.co.softsoldesk.beans.UserBean;

//import kr.co.softsoldesk.beans.UserBean;

@Configuration
public class RootAppContext {
	
	//유저 로그인 
	@Bean("loginUserBean") 
	@SessionScope
	public UserBean loginUserBean() {
		return new UserBean();
	}
	
	//일류로그인
	@Bean("loginProuserBean") 
	@SessionScope
	public ProUserBean ProUserBean() { 
		return new ProUserBean();
	}

	//일류로그인
	@Bean("AdminloginBean") 
	@SessionScope
	public AdminBean adminBean() { 
		return new AdminBean();
	}
	
	@Bean("AdminAlarm")  
	@SessionScope
	public PortFolioBean portFolioBean() {
		return new PortFolioBean();
	}
	
	@Bean("alarmReportBean")  
	@SessionScope
	public ReportBean alarmReportBean() {
		return new ReportBean();
	}
}
