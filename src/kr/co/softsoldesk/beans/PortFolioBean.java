package kr.co.softsoldesk.beans;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PortFolioBean {
	
	 	private int portfolio_id; //포트폴리오 ID
	 	private int pro_id; //pro_user ID (외래키)
	 	private String service_type; //서비스 종류
	 	private String portfolio_title;// 포트폴리오 제목 
	 	private String detailed_images;// 상세 이미지
	 	private String location_info; // 지역 정보
	 	private int final_amount; //최종 금액
	 	private String work_year; //작업 연도
	 	private String work_period; // 작업 소요 기간
	 	private String detailed_introduction; // 상세 설명
	 	private int inspectionNY;
	 	private int PortfolioCnt; 
	 	
	 	public int getPortfolioCnt() {
			return PortfolioCnt;
		}
		public void setPortfolioCnt(int portfolioCnt) {
			PortfolioCnt = portfolioCnt;
		}
		public int getInspectionNY() {
			return inspectionNY;
		}
		public void setInspectionNY(int inspectionNY) {
			this.inspectionNY = inspectionNY;
		}
		private List<MultipartFile> upload_photos;
	 	
	 	private String test;
	 	
	 	
	 	
		public String getTest() {
			return test;
		}
		public void setTest(String test) {
			this.test = test;
		}
		public List<MultipartFile> getUpload_photos() {
			return upload_photos;
		}
		public void setUpload_photos(List<MultipartFile> upload_photos) {
			this.upload_photos = upload_photos;
		}
		public int getPortfolio_id() {
			return portfolio_id;
		}
		public void setPortfolio_id(int portfolio_id) {
			this.portfolio_id = portfolio_id;
		}
		public int getPro_id() {
			return pro_id;
		}
		public void setPro_id(int pro_id) {
			this.pro_id = pro_id;
		}
		public String getService_type() {
			return service_type;
		}
		public void setService_type(String service_type) {
			this.service_type = service_type;
		}
		public String getPortfolio_title() {
			return portfolio_title;
		}
		public void setPortfolio_title(String portfolio_title) {
			this.portfolio_title = portfolio_title;
		} 
		public String getDetailed_images() {
			return detailed_images;
		}
		public void setDetailed_images(String detailed_images) {
			this.detailed_images = detailed_images;
		}
		public String getLocation_info() {
			return location_info;
		}
		public void setLocation_info(String location_info) {
			this.location_info = location_info;
		}
		public int getFinal_amount() {
			return final_amount;
		}
		public void setFinal_amount(int final_amount) {
			this.final_amount = final_amount;
		}
		public String getWork_year() {
			return work_year;
		}
		public void setWork_year(String work_year) {
			this.work_year = work_year;
		}
		public String getWork_period() {
			return work_period;
		}
		public void setWork_period(String work_period) {
			this.work_period = work_period;
		}
		public String getDetailed_introduction() {
			return detailed_introduction;
		}
		public void setDetailed_introduction(String detailed_introduction) {
			this.detailed_introduction = detailed_introduction;
		}
	 	
	 	
}
