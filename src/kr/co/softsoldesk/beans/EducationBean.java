package kr.co.softsoldesk.beans;

import java.util.Calendar;
import java.util.Date;

public class EducationBean {

	private int education_id;
    private int pro_id;
    private String school_name;
    private String major_name;
    private String evidence_image;
    
    
    public int getEducation_id() {
		return education_id;
	}
    
	public void setEducation_id(int education_id) {
		this.education_id = education_id;
	}
	
	public int getPro_id() {
		return pro_id;
	}
	
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	
	public String getSchool_name() {
		return school_name;
	}
	
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	
	public String getMajor_name() {
		return major_name;
	}
	
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	
	public String getEvidence_image() {
		return evidence_image;
	}
	
	public void setEvidence_image(String evidence_image) {
		this.evidence_image = evidence_image;
	}
	
	private Integer admissionYear;
	private Integer admissionMonth;
	private Date admission_date;

	private Integer graduationYear;
	private Integer graduationMonth;
	private Date graduation_date;


	public Integer getAdmissionYear() {
		return admissionYear;
	}
	
	public void setAdmissionYear(Integer admissionYear) {
		this.admissionYear = admissionYear;
	}
	
	public Integer getAdmissionMonth() {
		return admissionMonth;
	}
	
	public void setAdmissionMonth(Integer admissionMonth) {
		this.admissionMonth = admissionMonth;
	}
	
	public Date getAdmission_date() {
		return admission_date;
	}
	
	public void setAdmission_date(Date admission_date) {
		this.admission_date = admission_date;
	}
	
	public Integer getGraduationYear() {
		return graduationYear;
	}
	
	public void setGraduationYear(Integer graduationYear) {
		this.graduationYear = graduationYear;
	}
	
	public Integer getGraduationMonth() {
		return graduationMonth;
	}
	
	public void setGraduationMonth(Integer graduationMonth) {
		this.graduationMonth = graduationMonth;
	}
	
	public Date getGraduation_date() {
		return graduation_date;
	}
	
	public void setGraduation_date(Date graduation_date) {
		this.graduation_date = graduation_date;
	}
	
	public void updateAdmissionDate() {
        // 연도와 월 정보를 이용하여 Date 객체 생성
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, admissionYear);
        calendar.set(Calendar.MONTH, admissionMonth - 1); // Calendar의 월은 0부터 시작하므로 -1 처리
        this.admission_date = calendar.getTime();
    }
	
	public void updateGraduationDate() {
        // 연도와 월 정보를 이용하여 Date 객체 생성
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, graduationYear);
        calendar.set(Calendar.MONTH, graduationMonth - 1); // Calendar의 월은 0부터 시작하므로 -1 처리
        this.graduation_date = calendar.getTime();
    }
	
	

}