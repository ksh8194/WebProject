package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.client.ReplyDao;

@Controller
public class ReplyDeleteController {
	@Autowired
	private ReplyDao dao;
	
	@RequestMapping("replyDelete")
	public String clientdeleteReply(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("b_num") String b_num,
			@RequestParam("r_num") String r_num,
			@RequestParam("page") String page,
			@RequestParam("sidebar") String sidebar,
			@RequestParam("rpage") int rpage) {
		
		dao.deleteReply(r_num);
		
		return "redirect:clientBoardView?b_num="+b_num+"&page="+page+"&sidebar="+sidebar+"&rpage="+rpage;
		
	}
}
