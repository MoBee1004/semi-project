package com.spring_movie.controller;

import java.util.Locale;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("Main.jsp 로 이동!");	
		return "Main";
	}
	
	
	@RequestMapping(value = "websoketTest")
	public String websoketTest() {
		System.out.println("websoketTest.jsp 로 이동!");	

		
		return "WebsocketTest";
	}
	
}
