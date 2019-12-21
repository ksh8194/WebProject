package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.MemberManageDao;
import pack.utility.Pagination;

@Controller
public class MemberManageController {
	@Autowired
	private Pagination pagination;
	
	@Autowired
	private MemberManageDao dao;
	
	@RequestMapping("memberManage")
	public ModelAndView adminGetMemberManage(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.paginationSetting(page, 10, 10, dao.getMemberCount());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/memberManage");
		modelAndView.addObject("sidebar", "2");
		modelAndView.addObject("list", dao.getMemberList(pagination));
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
	}
}
