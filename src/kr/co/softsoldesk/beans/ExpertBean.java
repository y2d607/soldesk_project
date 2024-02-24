package kr.co.softsoldesk.beans;

import org.springframework.web.multipart.MultipartFile;

public class ExpertBean {

	
	private int pro_profile_id;
    private int pro_id;
    private String pro_profile_image;
    private int profile_completion;
    private int review_rating;
    private String activity_region;
    private int movable_distance;
    private String certification_documents_images;
    private String pro_detailed_introduction;
    private String price;
    private MultipartFile upload_file;
  //일류 찾기..
    private String pro_name;
    private int review_cnt;
    private int career_sum;
    
    
    public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getReview_cnt() {
		return review_cnt;
	}

	public void setReview_cnt(int review_cnt) {
		this.review_cnt = review_cnt;
	}

	public int getCareer_sum() {
		return career_sum;
	}

	public void setCareer_sum(int career_sum) {
		this.career_sum = career_sum;
	}

	public MultipartFile getUpload_file() {
       return upload_file;
    }

    public void setUpload_file(MultipartFile upload_file) {
       this.upload_file = upload_file;
    }
    
	public int getPro_profile_id() {
		return pro_profile_id;
	}
	public void setPro_profile_id(int pro_profile_id) {
		this.pro_profile_id = pro_profile_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public String getPro_profile_image() {
		return pro_profile_image;
	}
	public void setPro_profile_image(String pro_profile_image) {
		this.pro_profile_image = pro_profile_image;
	}
	public int getProfile_completion() {
		return profile_completion;
	}
	public void setProfile_completion(int profile_completion) {
		this.profile_completion = profile_completion;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public String getActivity_region() {
		return activity_region;
	}
	public void setActivity_region(String activity_region) {
		this.activity_region = activity_region;
	}
	public int getMovable_distance() {
		return movable_distance;
	}
	public void setMovable_distance(int movable_distance) {
		this.movable_distance = movable_distance;
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
    
    
}