package kr.co.softsoldesk.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.PostService;

public class CheckWriterInterceptor implements HandlerInterceptor{

	private UserBean loginUserBean;
	private ProUserBean loginProuserBean;  //user일 때, Prouser일 때 구분..?
	private PostService postService;
	
	public CheckWriterInterceptor(UserBean loginUserBean, PostService postService){
		this.loginUserBean = loginUserBean;
		this.postService = postService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String str1 = request.getParameter("board_id"); //주소에 붙여서 오는 값은 String
		int board_id = Integer.parseInt(str1); //getContentInfo에 필요한 값은 int 형이기에 형 변환 필요
		
		PostBean currentPostBean = postService.getPostInfo(board_id);
		
		if(currentPostBean.getUser_id() != loginUserBean.getUser_id()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/not_writer");
			
			return false;
		}
		return true;
	}
	
	
}