package org.zerock.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/*")
public class UserTestController {

	private static final Logger logger = LoggerFactory.getLogger(UserTestController.class);
	
	@RequestMapping(value = "/doA", method=RequestMethod.GET)
	public String doA(Locale locale, Model model) {
		System.out.println("doA..........");
		return "/user/doA";
	}
	
	@RequestMapping(value = "/doB", method=RequestMethod.GET)
	public String doB(Locale locale, Model model) {
		System.out.println("doB..........");
		
		model.addAttribute("result", "DOB RESULT");
		return "/user/doA";
	}
}
