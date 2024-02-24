package kr.co.softsoldesk.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

//import kr.co.softsoldesk.beans.UserBean;

@Controller
public class HomeController {
	
	@Resource(name = "loginUserBean")
	private UserBean loginUserBean; // UserBean이 객체로 만들어지고 초기값 가져옴
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;

	@Resource(name = "AdminloginBean")
	private AdminBean AdminloginBean;
	 
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home() {
		
		System.out.println("HomeController 회원 로그인 로그인상태(false:로그아웃,true:로그인) : "+loginUserBean.isUserLogin());
		System.out.println("HomeController 일류 로그인상태(false:로그아웃,true:로그인) : "+loginProuserBean.isProuserLogin());
		System.out.println("HomeController 관리자 로그인상태(false:로그아웃,true:로그인) : "+AdminloginBean.isAdminLogin());
	
		return "redirect:/index";
	}
}
