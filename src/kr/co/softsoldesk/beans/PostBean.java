
package kr.co.softsoldesk.beans;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class PostBean {

	private int board_id;
    private Integer user_id; 
    public Integer getUser_id() {
		return user_id;
	}
	public Integer getPro_id() {
		return pro_id;
	}
	private Integer pro_id; 
    
    @NotBlank
    private String title;
    
    private String photos;  //db에 저장하기 위한 값
    
    private List<MultipartFile> upload_photos;
    
    @NotBlank
    private String content;
    
    private String category;
    private String location;
    private int ReportedPostSt; 
    private Timestamp board_date;
    private String prowriter_name;
    private int viewCnt;
    
    private int commentCnt;
    
    public int getCommentCnt() {
		return commentCnt;
	}
	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}
	private String writer_name;
    
    public List<MultipartFile> getUpload_photos() {
		return upload_photos;
	}
	public void setUpload_photos(List<MultipartFile> upload_photos) {
		this.upload_photos = upload_photos;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	private List<MultipartFile> uploadFiles;
    
    
    public String getProwriter_name() {
		return prowriter_name;
	}
	public void setProwriter_name(String prowriter_name) {
		this.prowriter_name = prowriter_name;
	}
	public List<MultipartFile> getUploadFiles() {
		return uploadFiles;
	}
	public void setUploadFiles(List<MultipartFile> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getReportedPostSt() {
		return ReportedPostSt;
	}
	public void setReportedPostSt(int reportedPostSt) {
		ReportedPostSt = reportedPostSt;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}


	
	
    
    
}