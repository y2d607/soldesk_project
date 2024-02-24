package kr.co.softsoldesk.beans;

import java.sql.Timestamp;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class ReportBean {

	private int report_id;
    private int board_id;
    private int report_state;
    
    private String report_msg;
    
    private Timestamp report_date;
    
    private String title;
    
    private Integer user_id;
    
    private Integer pro_id;
    
	private int user_reportcnt;
    
    private int pro_reportcnt;
    
    private String user_writer_name;
    
    private String pro_writer_name;
    
    private String content;
    
    private String photos;
    
    private int ReportCnt;
    
	public int getReportCnt() {
		return ReportCnt;
	}


	public void setReportCnt(int reportCnt) {
		ReportCnt = reportCnt;
	}


	public String getContent() {
		return content;
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


	public void setContent(String content) {
		this.content = content;
	}
	public String getPhotos() {
		return photos;
	}
	public void setPhotos(String photos) {
		this.photos = photos;
	}
	public String getUser_writer_name() {
		return user_writer_name;
	}
	public void setUser_writer_name(String user_writer_name) {
		this.user_writer_name = user_writer_name;
	}
	public String getPro_writer_name() {
		return pro_writer_name;
	}
	public void setPro_writer_name(String pro_writer_name) {
		this.pro_writer_name = pro_writer_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getUser_reportcnt() {
		return user_reportcnt;
	}
	public void setUser_reportcnt(int user_reportcnt) {
		this.user_reportcnt = user_reportcnt;
	}
	public int getPro_reportcnt() {
		return pro_reportcnt;
	}
	public void setPro_reportcnt(int pro_reportcnt) {
		this.pro_reportcnt = pro_reportcnt;
	}
	public Timestamp getReport_date() {
		return report_date;
	}
	public void setReport_date(Timestamp report_date) {
		this.report_date = report_date;
	}
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getReport_state() {
		return report_state;
	}
	public void setReport_state(int report_state) {
		this.report_state = report_state;
	}
	public String getReport_msg() {
		return report_msg;
	}
	public void setReport_msg(String report_msg) {
		this.report_msg = report_msg;
	}
    
    
	
    
    
	
}