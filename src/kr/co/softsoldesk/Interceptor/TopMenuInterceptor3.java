package kr.co.softsoldesk.Interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.AdminBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;

public class TopMenuInterceptor3 implements HandlerInterceptor{
 
	@Resource(name="AdminloginBean")
	private AdminBean AdminloginBean;
	
	
	public TopMenuInterceptor3(AdminBean AdminloginBean) {
		this.AdminloginBean = AdminloginBean;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
 
		request.setAttribute("AdminloginBean", AdminloginBean); 
		return true;
	}
	
	
}
