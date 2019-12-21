package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.client.ReplyDao;

@Controller
public class ReplyModifyController {
	@Autowired
	private ReplyDao dao;
	
	@RequestMapping("replyModify")
	public String clientGetReplyModifyForm(
			HttpServletRequest request,
			HttpServletResponse response,
			ReplyBean bean,
			@RequestParam("page") String page,
			@RequestParam("sidebar") String sidebar,
			@RequestParam("rpage") int rpage) {
		
		dao.updateReply(bean);
		
		return "redirect:clientBoardView?b_num="+bean.getR_bno()+"&page="+page+"&sidebar="+sidebar+"&rpage="+rpage;
	}
}
