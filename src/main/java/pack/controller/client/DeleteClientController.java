package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.client.BoardDao;
import pack.model.client.MemberDao;
import pack.model.client.ReplyDao;

@Controller
public class DeleteClientController {
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private ReplyDao rdao;
	
	@RequestMapping("deleteClient")
	public String clientDelete(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("m_num") String m_num) {
		
		rdao.deleteRepleyForMemberDelete(m_num);
		
		bdao.deleteBoardForMemberDelete(m_num);
		
		dao.deleteMember(m_num);
		return "redirect:main";
	}
	
}
