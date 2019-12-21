package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pack.model.client.MemberDao;

@Controller
public class ClientLoginController {
	@Autowired
	private MemberDao dao;
	
	@RequestMapping(value = "clientLogin", method = RequestMethod.GET)
	public String getClientLoginForm() {
		return "clientLogin";
	}
	
	@RequestMapping(value = "clientLogin",method = RequestMethod.POST)
	public String cLogin(MemberBean bean,HttpServletRequest request) {
		HttpSession session =request.getSession();
		if(dao.cLogin(bean).equals("fail")) {
			return "redirect:main";
		}else {
			session.setAttribute("no", dao.cLogin(bean));
			session.setAttribute("master", "1");
			return "redirect:clientNoticeList";
		}
	}
	
}
