package pack.controller.client;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.model.client.MemberDao;

@Controller
public class SignupController {
	@Autowired
	private MemberDao dao;
	
	@RequestMapping(value = "signup",method = RequestMethod.GET)
	public String getSignupForm() {
		return "signup";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String insertMember(MemberBean bean) {
		dao.insertMember(bean);
		return "redirect:main";
	}
	
	@RequestMapping(value = "emailChk",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> abc(@RequestBody MemberBean bean) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",dao.emailChk(bean.getM_email()));
		return map;
	}
}
