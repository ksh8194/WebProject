package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.admin.AdminDao;
import pack.model.admin.NoticeDao;

@Controller
public class DeleteAdminController {
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private NoticeDao ndao;
	
	@RequestMapping("deleteAdmin")
	public String adminDeleteAdmin(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") String page,
			@RequestParam("a_num") String a_num) {
		
		ndao.deleteNoticeForAdminDelete(a_num);
		dao.deleteAdmin(a_num);
		
		return "redirect:adminManage?page="+page;
	}
}
