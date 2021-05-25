package org.movieprj.controller;

import org.movieprj.domain.MemberVO;
import org.movieprj.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private MemberService service;

	@PostMapping(value="/join")
	public String join(MemberVO member, RedirectAttributes rttr) {
		log.info("BoardController join >> " + member);
		
		service.insert(member);
		//rttr.addFlashAttribute("result", member.getMemID());
		
		return "redirect:/board/list";
	}
	
	@GetMapping(value="/join")
	public void join() {
		
	}
	
	@GetMapping("/list")
	public void list() {
		
	}
	
}
