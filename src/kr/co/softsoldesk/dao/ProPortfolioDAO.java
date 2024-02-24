package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.PortFolioBean;
import kr.co.softsoldesk.mapper.PortFolioMapper; 

@Repository
public class ProPortfolioDAO { 
	
	@Autowired
	PortFolioMapper portfoliMapper;
	 
	public void addProPortfolioInfo(PortFolioBean ProPortfolio){
		
		portfoliMapper.addProPortfolioInfo(ProPortfolio);
	}
	
	public List<PortFolioBean> getPortfolioList(int pro_id){
		List<PortFolioBean> PortfolioList = portfoliMapper.getPortfolioList(pro_id);
		
		return PortfolioList;
	}
	

	public PortFolioBean getPortfolioIdList(int portfolio_id){
		  
		return portfoliMapper.getPortfolioIdList(portfolio_id);
		 
	} 
	
	public void modifyPortfolioInfo(PortFolioBean ProPortfoliomodify) {
		portfoliMapper.modifyPortfolioInfo(ProPortfoliomodify);
	}
}
