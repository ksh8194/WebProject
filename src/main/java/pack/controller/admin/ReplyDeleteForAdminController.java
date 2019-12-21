package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.admin.ReplyDaoForAdmin;

@Controller
public class ReplyDeleteForAdminController {
	@Autowired
	private ReplyDaoForAdmin dao;
	
	@RequestMapping("adminReplyDeleteInManage")
	public String adminDeleteReply(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			@RequestParam("r_num") String r_num) {
		
		dao.deleteReplyForAdmin(r_num);
		return "redirect:replyManage?page="+page;
	}
}
