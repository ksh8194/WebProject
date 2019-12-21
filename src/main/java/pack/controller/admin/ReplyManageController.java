package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.ReplyDaoForAdmin;
import pack.utility.Pagination;

@Controller
public class ReplyManageController {
	@Autowired
	private ReplyDaoForAdmin dao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("replyManage")
	public ModelAndView adminGetReplyManage(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.paginationSetting(page, 10, 10, dao.getReplyCountForAdmin());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/replyManage");
		modelAndView.addObject("sidebar", "4");
		modelAndView.addObject("list", dao.getAllReply(pagination));
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
	}
}
