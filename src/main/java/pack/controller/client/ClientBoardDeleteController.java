package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.client.BoardDao;
import pack.model.client.ReplyDao;

@Controller
public class ClientBoardDeleteController {
	@Autowired
	private BoardDao dao;
	
	@Autowired
	private ReplyDao rdao;
	
	@RequestMapping("clientBoardDelete")
	public String clientDeleteBoard(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("sidebar") String sidebar,
			@RequestParam("b_num") String b_num) {
		
		rdao.deleteForBoardDelete(b_num);
		dao.deleteBoard(b_num);
		
		if(sidebar.equals("2")) {
			return "redirect:study?page="+page;
		}else if(sidebar.equals("3")) {
			return "redirect:competition?page="+page;
		}else if(sidebar.equals("4")) {
			return "redirect:amity?page="+page;
		}else {
			return "redirect:clientNoticeList";
		}
		
	}
}
