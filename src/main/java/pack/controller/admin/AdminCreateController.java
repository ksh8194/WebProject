package pack.controller.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import pack.model.admin.AdminDao;

@Controller
public class AdminCreateController {
	@Autowired
	private AdminDao dao;
	
	@RequestMapping(value = "emailChkForAdmin",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> abc(@RequestBody AdminBean bean) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",dao.emailChkForAdmin(bean.getA_email()));
		return map;
	}
	
	@RequestMapping("adminCreate")
	public String adminCreateAdmin(
			HttpServletRequest request,
			HttpServletResponse response,
			AdminBean bean) {
		
		dao.insertAdmin(bean);
		return "redirect:adminManage";
	}
}
