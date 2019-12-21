package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.admin.ReplyDaoForAdmin;

@Controller
public class AdminReplyDeleteController {
	@Autowired
	private ReplyDaoForAdmin dao;
	
	@RequestMapping("adminReplyDelete")
	public String adminDeleteReply(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			@RequestParam("b_num") String b_num,
			@RequestParam("sidebar") String sidebar,
			@RequestParam("index") String index,
			@RequestParam(defaultValue="1",name = "rpage") int rpage,
			@RequestParam("r_num") String r_num) {
		
		dao.deleteReplyForAdmin(r_num);
		
		return "redirect:boardView?b_num="+b_num+"&page="+page+"&sidebar="+sidebar+"&rpage="+rpage+"&index="+index;
	}
}
