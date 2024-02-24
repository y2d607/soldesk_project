package kr.co.softsoldesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.softsoldesk.beans.DetailCategoryBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.QuestionBean;
import kr.co.softsoldesk.beans.ReviewBean;
import kr.co.softsoldesk.beans.ServiceCategoryBean;
import kr.co.softsoldesk.service.DetailCategoryService;
import kr.co.softsoldesk.service.PostService;
import kr.co.softsoldesk.service.ReviewService;
import kr.co.softsoldesk.service.ServiceCategoryService;

@Controller
public class MainController {

	@Autowired
	ServiceCategoryService serviceCategoryService;
	
	@Autowired
	DetailCategoryService detailCategoryService;
	
	//@Autowired
	QuestionBean questionBean;
	
	@Autowired
	PostService postService;
	
	@Autowired
	ReviewService reviewService;
	
	@GetMapping("/index")
	public String index(Model model) {

		List<ServiceCategoryBean> categoryList = serviceCategoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		
		List<PostBean> postList = postService.getAllPostList(0);
		model.addAttribute("postList", postList);

		return "/index";
	}  
	
 

		@GetMapping("/detailCategory")
		public String detailCategory(@RequestParam("service_category_id") int service_category_id, Model model) {

			List<ServiceCategoryBean> categoryList = serviceCategoryService.getCategoryList();

			model.addAttribute("categoryList", categoryList);
			model.addAttribute("service_category_id", service_category_id);
			
			//서비스 카테고리의 이름 가져오기
			String serviceCategoryname = detailCategoryService.getServiceCategoryName(service_category_id);
			model.addAttribute("serviceCategoryname", serviceCategoryname);
			System.out.println("serviceCategoryname"+serviceCategoryname);
			
			//상세 카테고리 정보들
			List<DetailCategoryBean> detailCategoryList = detailCategoryService.getDetailCategoryList(service_category_id);
			model.addAttribute("detailCategoryList", detailCategoryList); 
			System.out.println("detailCategoryList"+detailCategoryList);
			
			//리뷰 
			List<ReviewBean> getReviewList = reviewService.getReviwList(service_category_id);
			model.addAttribute("getReviewList", getReviewList);
			
			// 리뷰 정보 출력
		    System.out.println("Review Information:");
		    for (ReviewBean review : getReviewList) {
		        System.out.println("Review ID: " + review.getReview_id());
		        System.out.println("User ID: " + review.getUser_name());
		        System.out.println("Review Contents: " + review.getReview_contents());
		        System.out.println("Rating: " + review.getRating());
		        System.out.println("Photos: " + review.getPhotos());
		        System.out.println("pro: " + review.getPro_id());
		        System.out.println("service_id : " + review.getService_category_id());
		        // 필요한 다른 리뷰 정보들도 출력
		        System.out.println("-----------------------------------");
		    }
			
			return "/detailCategory"; 
		
	}
	
	@GetMapping("/Questions")
	public String Questions(Model model,@RequestParam("service_category_id") int service_category_id) {
		
		model.addAttribute("자격증시험", questionBean.getCertifaction_exam());
		model.addAttribute("인테리어", questionBean.getInterior()); 
		model.addAttribute("가전제품", questionBean.getAppliance()); 
		model.addAttribute("청소", questionBean.getCleaning()); 
		model.addAttribute("번역", questionBean.getTranslation()); 
		model.addAttribute("문서", questionBean.getDevelopment()); 
		model.addAttribute("개발외주", questionBean.getDocument()); 
		model.addAttribute("반려동물", questionBean.getPet()); 
		
		model.addAttribute("service_category_id", service_category_id);
		//System.out.println("서비스카테고리번호:"+service_category_id);
		String serviceCategoryname = detailCategoryService.getServiceCategoryName(service_category_id);
		model.addAttribute("serviceCategoryname", serviceCategoryname);
		  
		return "/Questions";
	} 


}