package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.client.BoardDao;
import pack.utility.Pagination;

@Controller
public class ClientBoardListController {
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("study")
	public ModelAndView clientGetStudy(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.setB_cno("1");
		pagination.paginationSetting(page, 10, 10, dao.getTotalRows(pagination.getB_cno()));

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientBoardList");
		modelAndView.addObject("list", dao.getBoardList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("sidebar", "2");
		
		return modelAndView;
	}
	
	@RequestMapping("competition")
	public ModelAndView clientGetCompetition(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1") int page) {
		
		pagination.setB_cno("2");
		pagination.paginationSetting(page, 10, 10, dao.getTotalRows(pagination.getB_cno()));

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientBoardList");
		modelAndView.addObject("list", dao.getBoardList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("sidebar", "3");
		
		return modelAndView;
	}
	
	@RequestMapping("amity")
	public ModelAndView clientGetAmity(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1") int page) {
		
		pagination.setB_cno("3");
		pagination.paginationSetting(page, 10, 10, dao.getTotalRows(pagination.getB_cno()));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientBoardList");
		modelAndView.addObject("list", dao.getBoardList(pagination));
		modelAndView.addObject("pagination", pagination);
		modelAndView.addObject("sidebar", "4");
		
		return modelAndView;
	}
}
