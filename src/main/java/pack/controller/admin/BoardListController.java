package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.BoardDaoForAdmin;
import pack.utility.Pagination;

@Controller
public class BoardListController {
	@Autowired
	private BoardDaoForAdmin dao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("boardList")
	public ModelAndView adminGetBoardList(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.paginationSetting(page, 10, 10, dao.getAllBoardCount());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/boardList");
		modelAndView.addObject("sidebar", "3");
		modelAndView.addObject("list", dao.getAllBoardList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("index", "1");
		
		return modelAndView;
	}
	
	@RequestMapping("adminStudy")
	public ModelAndView adminGetStudyList(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.setB_cno("1");
		pagination.paginationSetting(page, 10, 10, dao.getCategoryListCount("1"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/boardList");
		modelAndView.addObject("sidebar", "3");
		modelAndView.addObject("list", dao.getCategoryList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("index", "2");
		
		return modelAndView;
	}
	
	@RequestMapping("adminCompetition")
	public ModelAndView adminGetCompetitionList(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.setB_cno("2");
		pagination.paginationSetting(page, 10, 10, dao.getCategoryListCount("2"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/boardList");
		modelAndView.addObject("sidebar", "3");
		modelAndView.addObject("list", dao.getCategoryList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("index", "3");
		
		return modelAndView;
	}
	
	@RequestMapping("adminAmity")
	public ModelAndView adminGetAmityList(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.setB_cno("3");
		pagination.paginationSetting(page, 10, 10, dao.getCategoryListCount("3"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/boardList");
		modelAndView.addObject("sidebar", "3");
		modelAndView.addObject("list", dao.getCategoryList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("index", "4");
		
		return modelAndView;
	}
}
