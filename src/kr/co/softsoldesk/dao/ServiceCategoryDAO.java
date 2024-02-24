package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.mapper.ServiceCategoryMapper;

@Repository
public class ServiceCategoryDAO {

	@Autowired
	private ServiceCategoryMapper ServiceCategoryMapper;
	
	public List<ServiceCategoryBean> getCategoryList() {
		
		List<ServiceCategoryBean> categoryList = ServiceCategoryMapper.getCategoryList();
        
		
		return categoryList;
	}
	
	
}
