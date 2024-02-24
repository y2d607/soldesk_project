package kr.co.softsoldesk.beans;

public class PageBean {

	private int min;

	private int max;

	private int prevPage;

	private int nextPage;

	private int pageCnt;

	private int currentPage;
	
	private String SearchType;
	private String SearchText;
	private String category;
	private String location;
	
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearchType() {
		return SearchType;
	}

	public void setSearchType(String searchType) {
		SearchType = searchType;
	}

	public String getSearchText() {
		return SearchText;
	}

	public void setSearchText(String searchText) {
		SearchText = searchText;
	}

	public PageBean(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
		
		this.currentPage = currentPage;
		
	pageCnt = contentCnt / contentPageCnt;
		//533/10=53 �̹Ƿ� 1page�� �ʿ�
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}

		
		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationCnt - 1; //1+10=11�̹Ƿ� 1�� ����

		if(max > pageCnt) {
			max = pageCnt;
		}
		
		prevPage = min - 1;
		nextPage = max + 1;
		//�������������� �Ѿ�� �ʵ���
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}
	}
	
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	
	
}