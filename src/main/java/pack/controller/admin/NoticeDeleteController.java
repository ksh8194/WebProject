package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.admin.NoticeDao;

@Controller
public class NoticeDeleteController {
	@Autowired
	private NoticeDao dao;
	
	@RequestMapping("noticeDelete")
	public String adminDeleteNotice(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("n_num") String n_num) {
		
		dao.deleteNotice(n_num);
		
		return "redirect:noticeList?page="+page;
	}
}
