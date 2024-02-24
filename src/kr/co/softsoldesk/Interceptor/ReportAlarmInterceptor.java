package kr.co.softsoldesk.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.softsoldesk.beans.ReportBean;
import kr.co.softsoldesk.service.AdminService;

public class ReportAlarmInterceptor implements HandlerInterceptor {

	private ReportBean alarmReportBean;
	private AdminService adminService;
	
	public ReportAlarmInterceptor(ReportBean alarmReportBean, AdminService adminService) {
		this.alarmReportBean = alarmReportBean;
		this.adminService = adminService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		int CntReport = adminService.getCntReport();
		
		alarmReportBean.setReportCnt(CntReport);
		request.setAttribute("alarmReportBean", alarmReportBean);
		request.setAttribute("adminService", adminService);
		
		request.setAttribute("CntReport", CntReport);
		
		return true;
	}
	
	
}
