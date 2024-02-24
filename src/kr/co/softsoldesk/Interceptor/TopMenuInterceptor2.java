package kr.co.softsoldesk.Interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.QuoteBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.ChatService;

public class TopMenuInterceptor2 implements HandlerInterceptor{
 
	@Resource(name="loginProuserBean")
	private ProUserBean loginProuserBean;
 
	private ChatService chatservice;
	
	public TopMenuInterceptor2(ProUserBean loginProuserBean, ChatService chatservice) {
		this.loginProuserBean = loginProuserBean;
		this.chatservice=chatservice;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		List<QuoteBean> quoteBean=chatservice.receviedQuote();
		 
		String[] sendQuetes = new String[quoteBean.size()]; // 루프 외부에서 사용되는 변수를 먼저 정의합니다.
	    int i = 0;
	    for(QuoteBean quote:quoteBean) {
	        sendQuetes[i++]=chatservice.getSendQuoteUsername(quote.getQuote_history_id());
	    }
		
		request.setAttribute("sendQuetes", sendQuetes);
		request.setAttribute("quoteBean", quoteBean);
		request.setAttribute("loginProuserBean", loginProuserBean); 
		return true;
	}
	
	
}
