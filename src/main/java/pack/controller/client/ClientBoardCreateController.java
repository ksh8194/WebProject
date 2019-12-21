package pack.controller.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.client.BoardDao;

@Controller
public class ClientBoardCreateController {
	@Autowired
	private BoardDao dao;
	
	@RequestMapping(value = "clientBoardCreate",method = RequestMethod.GET)
	public ModelAndView clientGetBoardCreateForm(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("sidebar") String sidebar) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientBoardCreate");
		modelAndView.addObject("sidebar", sidebar);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "clientBoardCreate", method = RequestMethod.POST)
	public String clientInsertBoard(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("sidebar") String sidebar,
			BoardBean bean) {
		
		dao.insertBoard(bean);
		
		if(sidebar.equals("2")) {
			return "redirect:study";
		}else if(sidebar.equals("3")) {
			return "redirect:competition";
		}else if(sidebar.equals("4")) {
			return "redirect:amity";
		}else {
			return "redirect:clientNoticeList";
		}
	}
}
