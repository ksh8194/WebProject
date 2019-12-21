package pack.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.admin.MemberManageDao;

@Controller
public class ModifyMemberController {
	@Autowired
	private MemberManageDao dao;
	
	@RequestMapping("modifyMember")
	public String adminModifyMember(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(defaultValue="1",name = "page") int page,
			MemberManageBean bean) {
		
		dao.updateMemberState(bean);
		return "redirect:memberManage?page="+page;
	}
}
