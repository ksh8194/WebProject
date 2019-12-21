package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.NoticeDao;

@Controller
public class NoticeModifyController {
	@Autowired
	private NoticeDao dao;
	
	@RequestMapping(value = "noticeModify",method = RequestMethod.GET)
	public ModelAndView adminGetmodifyForm(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("n_num") String n_num,
			@RequestParam("sidebar") String sidebar) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/noticeModify");
		modelAndView.addObject("dto", dao.getNoticeView(n_num));
		modelAndView.addObject("page", page);
		modelAndView.addObject("sidebar", sidebar);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "noticeModify",method = RequestMethod.POST)
	public String adminModifyNotice(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("sidebar") String sidebar,
			NoticeBean bean) {
		
		dao.updateNotice(bean);
		return "redirect:noticeView?n_num="+bean.getN_num()+"&page="+page+"&sidebar="+sidebar;
	}
	
	
}
