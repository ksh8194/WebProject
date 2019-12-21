package pack.controller.admin;

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
public class NoticeListController {
	@Autowired
	private NoticeDao dao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("noticeList")
	public ModelAndView adminGetNoticeList(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page){
		
		pagination.paginationSetting(page, 10, 10, dao.getTotalRows());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/noticeList");
		modelAndView.addObject("sidebar", "1");
		modelAndView.addObject("list", dao.getNoticeList(pagination));
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
	}
}
