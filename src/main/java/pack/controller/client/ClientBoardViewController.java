package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.client.BoardDao;
import pack.model.client.ReplyDao;
import pack.utility.Pagination;

@Controller
public class ClientBoardViewController {
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private ReplyDao rdao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("clientBoardView")
	public ModelAndView clientGetClientBoardView(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("sidebar") String sidebar,
			@RequestParam("b_num") String b_num,
			@RequestParam("rpage") int rpage) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientBoardView");
		modelAndView.addObject("page", page);
		modelAndView.addObject("sidebar",sidebar);
		modelAndView.addObject("dto", dao.getboardview(b_num));
		dao.plusViews(b_num);
		
		pagination.setB_num(b_num);
		pagination.paginationSetting(rpage, 5, 10, rdao.getBoardReplyCount(b_num));
		modelAndView.addObject("list", rdao.getBoardReply(pagination));
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
	}
}
