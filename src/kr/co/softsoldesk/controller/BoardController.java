package kr.co.softsoldesk.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.softsoldesk.beans.CommentBean;
import kr.co.softsoldesk.beans.PageBean;
import kr.co.softsoldesk.beans.PostBean;
import kr.co.softsoldesk.beans.ProUserBean;
import kr.co.softsoldesk.beans.ReportBean;
import kr.co.softsoldesk.beans.UserBean;
import kr.co.softsoldesk.service.PostService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	PostService postService;
	
	@Resource(name="loginUserBean")
	private UserBean loginUserBean;
	
	@Resource(name = "loginProuserBean")
	private ProUserBean loginProuserBean;

	@GetMapping("/community")
	public String community(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
            @RequestParam(value = "searchText", defaultValue = "") String searchText,
            @RequestParam(value = "category", defaultValue = "") String category,
            @RequestParam(value = "location", defaultValue = "") String location) { 
		
		List<PostBean> postList;
        PageBean pageBean;

        if (!searchType.isEmpty() && !searchText.isEmpty()) {
            postList = postService.getSearchedPostList(page, searchType, searchText);
            pageBean = postService.getSearchedPostPage(page, searchType, searchText);
        } else {
            postList = postService.getAllPostList(page);
            pageBean = postService.getPost(page);
        }

        model.addAttribute("postList", postList);
        model.addAttribute("pageBean", pageBean);
		
		return "board/community";
	}
	
	@GetMapping("/post") // /board/main 글 작성
	public String write(@ModelAttribute("boardPostBean") PostBean boardPostBean, Model model) {
		
		model.addAttribute("boardPostBean", boardPostBean);
		
		
		return "board/post";
	}
	
	@PostMapping("/post_pro")
	public String write_pro(@Valid @ModelAttribute("boardPostBean") PostBean boardPostBean, 
							BindingResult result,
							@RequestParam("uploadFiles") List<MultipartFile> uploadFiles) {
		
		
		if(result.hasErrors()) {
			return "board/post";
		}
		
		try {
			if (loginUserBean.isUserLogin() == true) { 
				postService.addBoardPostInfo(boardPostBean, uploadFiles);
		       }
			else if(loginProuserBean.isProuserLogin() == true){ 
				postService.addBoardPostInfo(boardPostBean, uploadFiles);
		       } 
		       //System.out.println("유저: " + loginUserBean.isUserLogin());
		       //System.out.println("프로: " + loginProuserBean.isProuserLogin());
		       //System.out.println("user: " + boardPostBean.getUser_id());
		       //System.out.println("pro: " + boardPostBean.getPro_id());
 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "board/post_success";
	}
	
	@GetMapping("/detailCommunity")
	public String detailCommunity(@RequestParam("board_id") int board_id, Model model,
			@ModelAttribute("writeCommentBean") CommentBean writeCommentBean,
			@ModelAttribute("writeReportBean") ReportBean writeReportBean) {
		//1. 조회수 증가 +1
		postService.plusCnt(board_id);
		//2. 해당 게시글 정보 부르기 
		
		 PostBean readPostBean = postService.getPostInfo(board_id);
		 //System.out.println("다중 이미지: " + readPostBean.getPhotos());
		 
		 
			model.addAttribute("board_id", board_id);
			
			model.addAttribute("readPostBean", readPostBean);
			model.addAttribute("writeReportBean", writeReportBean);
			model.addAttribute("writeCommentBean", writeCommentBean);
			
			 model.addAttribute("loginUserBean", loginUserBean);
			 model.addAttribute("loginProuserBean", loginProuserBean);

		
			//댓글 추가
			List<CommentBean> comments = postService.getAllComments(board_id);
			model.addAttribute("comments", comments);
		
		return "board/detailCommunity";
	}
	
	@PostMapping("/detail_reportPro")
	public String detail_reportPro(@ModelAttribute("writeReportBean") ReportBean writeReportBean) {
		
		System.out.println("dddddd"+writeReportBean.getReport_msg());
		
		postService.addReportInfo(writeReportBean);
		
		return "board/detail_reportPro_success";
	}
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "board/not_writer";
	}
	
	
	@GetMapping("/modifyPost")
	public String modifyPost(@RequestParam("board_id") int board_id, @ModelAttribute("modifyPostBean") PostBean modifyPostBean,
							Model model) {
		
		PostBean tempPostBean = postService.getPostInfo(board_id);
		
		String contentWithPtags = tempPostBean.getContent();
		String contentWithoutPtags = Jsoup.parse(contentWithPtags).text();
		
		modifyPostBean.setTitle(tempPostBean.getTitle());
		modifyPostBean.setContent(contentWithoutPtags);
		modifyPostBean.setCategory(tempPostBean.getCategory());
		modifyPostBean.setLocation(tempPostBean.getLocation());
		modifyPostBean.setPhotos(tempPostBean.getPhotos());
		modifyPostBean.setBoard_id(tempPostBean.getBoard_id());
		modifyPostBean.setPhotos(tempPostBean.getPhotos());
		
		System.out.println("글 수정 p태그: " + modifyPostBean.getContent());
		
		model.addAttribute("board_id", board_id);
		model.addAttribute("locBtnText", tempPostBean.getLocation());
		model.addAttribute("ctgBtnText", tempPostBean.getCategory());
		model.addAttribute("photos", tempPostBean.getPhotos());
		
		return "board/modifyPost";
		
	}
	
	@PostMapping("/modifyPost_pro")
	public String modifyPost_pro(@Valid @ModelAttribute("modifyPostBean") PostBean modifyPostBean,
								@RequestParam("uploadFiles") List<MultipartFile> uploadFiles,
								 BindingResult result) {
		
		if(result.hasErrors()) {
			return "board/modifyPost";
		}
		
		try {
			postService.modifyPostInfo(modifyPostBean, uploadFiles);
		}catch (Exception e) {
			e.printStackTrace();
		}
	
		
		return "board/modifyPost_success";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("board_id") int board_id) {
		postService.deletePostInfo(board_id);
		
		return "board/delete";
	}
	

}