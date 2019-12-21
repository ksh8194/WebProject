package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.AdminDao;
import pack.utility.Pagination;

@Controller
public class AdminManageController {
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("adminManage")
	public ModelAndView adminGetAdminManage(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page) {
		
		pagination.paginationSetting(page, 10, 10, dao.getAdminCount());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/adminManage");
		modelAndView.addObject("sidebar", "5");
		modelAndView.addObject("list", dao.getAdminList(pagination));
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
		
	}
}
