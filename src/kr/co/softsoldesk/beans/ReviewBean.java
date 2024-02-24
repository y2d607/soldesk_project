package kr.co.softsoldesk.beans;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class ReviewBean {

    private int review_id;
    private Integer pro_id;
    private Integer user_id; 
   
	@NotBlank
    @Size(min = 10, max = 100)
    private String review_contents;
    private int rating;
    private String photos;
    
    private String review_date;
    
    private String writer_name;
    
    private String category;
    
    private String user_name;
    private String pro_name;
    private int service_category_id;
    
    
    
    
	public int getService_category_id() {
		return service_category_id;
	}
	public void setService_category_id(int service_category_id) {
		this.service_category_id = service_category_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getPro_id() {
		return pro_id;
	}
    
    
}