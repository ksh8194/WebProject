package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.client.BoardDao;
import pack.model.client.MemberDao;
import pack.model.client.ReplyDao;
import pack.utility.Pagination;

@Controller
public class MyPageController {
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private ReplyDao rdao;
	
	@Autowired
	private Pagination pagination;
	
	@RequestMapping("myPage")
	public ModelAndView clientGetMyPage(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("m_num") String m_num,
			@RequestParam(defaultValue="1",name = "show") int show,
			@RequestParam(defaultValue="1", name ="page") int page) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("myPage");
		modelAndView.addObject("dto", dao.getClient(m_num));
		
		pagination.setM_num(m_num);
		
		if(show == 1) {
			pagination.paginationSetting(page, 5, 10, bdao.getClientBoardCount(m_num));
			modelAndView.addObject("boardlist",bdao.getClientBoardList(pagination));
		}else if (show == 2) {
			pagination.paginationSetting(page, 5, 10, rdao.getClientReplyCount(m_num));
			modelAndView.addObject("replylist", rdao.getClientReply(pagination));
		}
		modelAndView.addObject("pagination", pagination);
		
		return modelAndView;
		
	}
}
