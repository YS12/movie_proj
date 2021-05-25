package org.movieprj.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.movieprj.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Log4j
@RequestMapping("/*")
@AllArgsConstructor
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	private MemberService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/home";
	}
	
	@PostMapping(value="/")
	public String home(@RequestParam("id") String id, @RequestParam("pw") String pw) {
		log.info("test id : " + id + ", pw : " + pw);
		return "redirect:/board/list";
	}
}
