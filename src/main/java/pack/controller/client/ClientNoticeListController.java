package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.NoticeDao;
import pack.utility.Pagination;

@Controller
public class ClientNoticeListController {
	@Autowired
	private Pagination pagination;
	
	@Autowired
	private NoticeDao dao;
	
	@RequestMapping("clientNoticeList")
	public ModelAndView clientGetNoticeList(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.paginationSetting(page, 10, 10, dao.getTotalRows());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientNoticeList");
		modelAndView.addObject("sidebar", "1");
		modelAndView.addObject("list", dao.getNoticeList(pagination));
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
	}
}
