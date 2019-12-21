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
public class NoticeCreateController {
	@Autowired
	private NoticeDao dao;
	
	@RequestMapping(value = "noticeCreate",method = RequestMethod.GET)
	public ModelAndView adminGetNoticeCreateForm(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("sidebar") String sidebar) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/noticeCreate");
		modelAndView.addObject("sidebar", sidebar);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "noticeCreate", method = RequestMethod.POST)
	public String adminInsertNotice(
			HttpServletRequest request,
			HttpServletResponse response,
			NoticeBean bean) {
			
		dao.insertNotice(bean);

		return "redirect:noticeList";
	}
}
