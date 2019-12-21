package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.NoticeDao;

@Controller
public class NoticeViewController {
	@Autowired
	private NoticeDao dao;
	
	@RequestMapping("noticeView")
	public ModelAndView adminGetNoticeView(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("sidebar") String sidebar,
			@RequestParam("n_num") String n_num) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/noticeView");
		modelAndView.addObject("page", page);
		modelAndView.addObject("sidebar",sidebar);
		modelAndView.addObject("dto", dao.getNoticeView(n_num));
		
		return modelAndView;
	}
}
