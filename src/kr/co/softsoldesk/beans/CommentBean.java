package kr.co.softsoldesk.beans;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;

public class CommentBean {
	private int comment_id;
	private int board_id;
	private Integer user_id;
	private Integer pro_id;
	
	@NotBlank
	private String comment_content;
	private Timestamp comment_date;
	
	private String comment_writer_name;
	private String comment_prowriter_name;
	
	private int commentCnt; 
	
	private String certification_documents_images;
	
	
	public String getCertification_documents_images() {
		return certification_documents_images;
	}

	public void setCertification_documents_images(String certification_documents_images) {
		this.certification_documents_images = certification_documents_images;
	}

	public int getCommentCnt() {
		return commentCnt;
	}

	public void setCommentCnt(int commentCnt) {
		this.commentCnt = commentCnt;
	}

	public String getComment_prowriter_name() {
		return comment_prowriter_name;
	}

	public void setComment_prowriter_name(String comment_prowriter_name) {
		this.comment_prowriter_name = comment_prowriter_name;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public int getBoard_id() {
		return board_id;
	}

	public void setBoard_id(int board_id) {
		this.board_id = board_id;
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

	public void setPro_id(Integer pro_id) {
		this.pro_id = pro_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Timestamp getComment_date() {
		return comment_date;
	}

	public void setComment_date(Timestamp comment_date) {
		this.comment_date = comment_date;
	}

	public String getComment_writer_name() {
		return comment_writer_name;
	}

	public void setComment_writer_name(String comment_writer_name) {
		this.comment_writer_name = comment_writer_name;
	}
	 
	
}