package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.client.MemberDao;

@Controller
public class ModifyClientPwdController {
	@Autowired
	private MemberDao dao;
	
	@RequestMapping(value = "modifyClientPwd" , method = RequestMethod.GET)
	public ModelAndView clientGetModifyPwdForm(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("m_num") String m_num) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientModifyPwd");
		modelAndView.addObject("dto", dao.getClient(m_num));
		return modelAndView;
	}
	
	@RequestMapping(value = "modifyClientPwd" , method = RequestMethod.POST)
	public String clientModifyPwd(
			HttpServletRequest request,
			HttpServletResponse response,
			MemberBean bean) {
		
		dao.updateMemberPwd(bean);
		
		return "redirect:myPage?m_num="+bean.getM_num();
	}
}
