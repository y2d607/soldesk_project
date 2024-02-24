package kr.co.softsoldesk.beans;

import java.util.Calendar;
import java.util.Date;

public class CareerBean {

	private int career_id;
	private int pro_id;
	private int total_experience_period;
	private String career_title;
	private String detailed_introduction;
	
	public int getCareer_id() {
		return career_id;
	}

	public void setCareer_id(int career_id) {
		this.career_id = career_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}



	public int getTotal_experience_period() {
		return total_experience_period;
	}

	public void setTotal_experience_period(int total_experience_period) {
		this.total_experience_period = total_experience_period;
	}

	public String getCareer_title() {
		return career_title;
	}

	public void setCareer_title(String career_title) {
		this.career_title = career_title;
	}

	public String getDetailed_introduction() {
		return detailed_introduction;
	}

	public void setDetailed_introduction(String detailed_introduction) {
		this.detailed_introduction = detailed_introduction;
	}
	

	private Integer startYear;
	private Integer startMonth;
	private Date start_date;

	private Integer endYear;
	private Integer endMonth;
	private Date end_date;

	public Integer getStartYear() {
		return startYear;
	}

	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}

	public Integer getStartMonth() {
		return startMonth;
	}

	public void setStartMonth(Integer startMonth) {
		this.startMonth = startMonth;
	}

	public Date getStart_date() {
		return start_date;
	}

	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	
	public void updateStartDate() {
        // 연도와 월 정보를 이용하여 Date 객체 생성
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, startYear);
        calendar.set(Calendar.MONTH, startMonth - 1); // Calendar의 월은 0부터 시작하므로 -1 처리
        this.start_date = calendar.getTime();
    }

	public Integer getEndYear() {
		return endYear;
	}

	public void setEndYear(Integer endYear) {
		this.endYear = endYear;
	}

	public Integer getEndMonth() {
		return endMonth;
	}

	public void setEndMonth(Integer endMonth) {
		this.endMonth = endMonth;
	}

	public Date getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	
	public void updateEndDate() {
	    if (endYear != null && endMonth != null) {
	        Calendar calendar = Calendar.getInstance();
	        calendar.set(Calendar.YEAR, endYear);
	        calendar.set(Calendar.MONTH, endMonth - 1);
	        this.end_date = calendar.getTime();
	    } else {
	        // 값이 설정되지 않은 경우 예외 처리 또는 로깅 등을 수행
	        throw new IllegalArgumentException("endYear 또는 endMonth가 설정되지 않았습니다.");
	    }
	}
 

}