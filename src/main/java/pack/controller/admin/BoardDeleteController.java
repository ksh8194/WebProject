package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.admin.BoardDaoForAdmin;
import pack.model.admin.ReplyDaoForAdmin;

@Controller
public class BoardDeleteController {
	@Autowired
	private BoardDaoForAdmin dao;
	
	@Autowired
	private ReplyDaoForAdmin rdao;
	
	@RequestMapping("boardDelete")
	public String adminDeleteBoard(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			@RequestParam("b_num") String b_num,
			@RequestParam("index") String index) {
		
		rdao.deleteForBoardDeleteForAdmin(b_num);
		dao.deleteBoard(b_num);
		
		if(index.equals("1")) {
			return "redirect:boardList?page="+page;
		}else if(index.equals("2")) {
			return "redirect:adminStudy?page="+page;
		}else if(index.equals("3")) {
			return "redirect:adminCompetition?page="+page;
		}else if(index.equals("4")) {
			return "redirect:adminAmity?page="+page;
		}else {
			return "redirect:boardList?page="+page;
		}
	}
}
