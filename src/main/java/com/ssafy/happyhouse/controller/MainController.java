package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@Controller
public class MainController {

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/mvqna")
	public String homepage() {
		return "qna";
	}
	
	@RequestMapping(value = "/mvjoin")
	public String mvjoin() {
		return "user/join";
	}
	
	@RequestMapping(value = "/mvfindpwd")
	public String mvfindpwd() {
		return "user/findpwd";
	}
	
	@RequestMapping(value = "/findpwdsuccess")
	public String mvfindpwdsuccess() {
		return "user/findpwdsuccess";
	}
	
	@RequestMapping(value = "/mvdeleteInfo")
	public String mvdeleteInfo() {
		return "user/deleteInfo";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String mvupdate() throws Exception{
		return "user/modify";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("/mypage")
	public String mypage() {
		return "user/mypage";
	}
}
