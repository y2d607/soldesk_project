package kr.co.softsoldesk.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softsoldesk.beans.CareerBean;
import kr.co.softsoldesk.mapper.CareerMapper;

@Repository
public class CareerDAO {
	
	@Autowired
	private CareerMapper careerMapper;

	public void addCareerInfo(CareerBean careerBean) {
		
		careerMapper.addCareerInfo(careerBean);
	}
	
	public List<CareerBean> getCareerList(int pro_id) {
		
		return careerMapper.getCareerList(pro_id);
	}
	
	public CareerBean getCareerInfo(int career_id) {
		
		return careerMapper.getCareerInfo(career_id);
	}
	
	public void modifyCareer(CareerBean careerContentModifyBean) {
		
		careerMapper.modifyCareer(careerContentModifyBean);
	}
	
	public void deleteCareer(int career_id) {
		
		careerMapper.deleteCareer(career_id);
	}
	
}