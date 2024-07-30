package com.pwl.cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	@RequestMapping(value="/")
	public String index(Model model, HttpServletRequest request) {
		
		//HttpSession session = request.getSession(true);
		//String id = (String) session.getAttribute("id");
		
		return "index";
	}
	
	@RequestMapping(value="/main.do")
	public String main(Model model, HttpServletRequest request) {
		
		return "main";
	}
}
