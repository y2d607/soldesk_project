package kr.co.softsoldesk.beans;

public class QuoteBean {

	private int quote_history_id;
	private String received_quote;  
	private int pro_id;
	private int user_id; 
	private String user_name;
	private int received_quoteNY;
	private String service_category_id;
	
	
	
	public String getService_category_id() {
		return service_category_id;
	}
	public void setService_category_id(String service_category_id) {
		this.service_category_id = service_category_id;
	}
	public int getReceived_quoteNY() {
		return received_quoteNY;
	}
	public void setReceived_quoteNY(int received_quoteNY) {
		this.received_quoteNY = received_quoteNY;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	} 
	public int getQuote_history_id() {
		return quote_history_id;
	}
	public void setQuote_history_id(int quote_history_id) {
		this.quote_history_id = quote_history_id;
	}
	public String getReceived_quote() {
		return received_quote;
	}  
	public void setReceived_quote(String received_quote) {
		this.received_quote = received_quote;
	}
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	
}
