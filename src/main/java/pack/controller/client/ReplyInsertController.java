package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.client.ReplyDao;

@Controller
public class ReplyInsertController {
	@Autowired
	private ReplyDao dao;
	
	@RequestMapping("replyInsert")
	public String clientReplyInsert(
			HttpServletRequest request,
			HttpServletResponse response,
			ReplyBean bean,
			@RequestParam("page") String page,
			@RequestParam("sidebar") String sidebar) {
		
		dao.insertReply(bean);
		
		return "redirect:clientBoardView?b_num="+bean.getR_bno()+"&page="+page+"&sidebar="+sidebar+"&rpage=1";
		
	}
}
