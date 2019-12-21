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
public class ClientBoardModifyController {
	@Autowired
	private BoardDao dao;
	
	@RequestMapping(value = "clientBoardModify",method = RequestMethod.GET)
	public ModelAndView clientGetmodifyForm(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("b_num") String b_num,
			@RequestParam("sidebar") String sidebar) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("clientBoardModify");
		modelAndView.addObject("dto", dao.getboardview(b_num));
		modelAndView.addObject("page", page);
		modelAndView.addObject("sidebar", sidebar);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "clientBoardModify",method = RequestMethod.POST)
	public String clientModifyBoard(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("page") int page,
			@RequestParam("sidebar") String sidebar,
			BoardBean bean) {
		
		dao.updateBoard(bean);
		return "redirect:clientBoardView?b_num="+bean.getB_num()+"&page="+page+"&sidebar="+sidebar+"&rpage=1";
	}
}
