package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.admin.AdminDao;

@Controller
public class AdminModifyController {
	@Autowired
	private AdminDao dao;
	
	@RequestMapping(value = "adminModify",method = RequestMethod.GET)
	public ModelAndView adminGetAdminModifyForm(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			@RequestParam("a_num") String a_num) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("admin/adminModify");
		modelAndView.addObject("dto", dao.detailAdmin(a_num));
		modelAndView.addObject("page", page);
		return modelAndView;
	}
	
	@RequestMapping(value = "adminModify", method = RequestMethod.POST)
	public String adminModify(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			AdminBean bean) {
		
		dao.updateAdmin(bean);
		return "redirect:adminManage?page="+page;
	}
	
}
