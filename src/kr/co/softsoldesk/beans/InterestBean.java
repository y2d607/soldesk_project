package kr.co.softsoldesk.beans;

public class InterestBean {
	
	private int interest_id;
    private int user_id;
    private int pro_id;
    
    //일류 이름, 프로필, 상세소개
    private String pro_name;
    private String certification_documents_images;
    private String pro_detailed_introduction;
    
    //경력
    private int total_experience_sum;
    
    //리뷰
    private int review_count;
    
    
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getCertification_documents_images() {
		return certification_documents_images;
	}
	public void setCertification_documents_images(String certification_documents_images) {
		this.certification_documents_images = certification_documents_images;
	}
	public String getPro_detailed_introduction() {
		return pro_detailed_introduction;
	}
	public void setPro_detailed_introduction(String pro_detailed_introduction) {
		this.pro_detailed_introduction = pro_detailed_introduction;
	}
	public int getTotal_experience_sum() {
		return total_experience_sum;
	}
	public void setTotal_experience_sum(int total_experience_sum) {
		this.total_experience_sum = total_experience_sum;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getInterest_id() {
		return interest_id;
	}
	public void setInterest_id(int interest_id) {
		this.interest_id = interest_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	
    
    
}