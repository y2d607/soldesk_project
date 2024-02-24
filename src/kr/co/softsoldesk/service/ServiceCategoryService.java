package kr.co.softsoldesk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.dao.ServiceCategoryDAO;

@Service
public class ServiceCategoryService {

	@Autowired
	private ServiceCategoryDAO serviceCategoryDAO;
	
	public List<ServiceCategoryBean> getCategoryList() {
		
		List<ServiceCategoryBean> categoryList = serviceCategoryDAO.getCategoryList();
 
		return categoryList;
	}
}
