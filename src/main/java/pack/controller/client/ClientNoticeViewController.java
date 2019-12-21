package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.NoticeDao;

@Controller
public class ClientNoticeViewController {
	@Autowired
	private NoticeDao dao;
	
	@RequestMapping("clientNoticeView")
	public ModelAndView clientGetNoticeView(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			@RequestParam("n_num") String n_num,
			@RequestParam("sidebar") String sidebar) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientNoticeView");
		modelAndView.addObject("page", page);
		modelAndView.addObject("sidebar", sidebar);
		modelAndView.addObject("dto", dao.getNoticeView(n_num));
		dao.plusViews(n_num);
		return modelAndView;
	}
}
