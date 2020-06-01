package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.FindMemService;
import com.ssafy.happyhouse.service.JoinService;
import com.ssafy.happyhouse.service.LoginService;


@Controller
public class MainController {

	@Autowired
	LoginService loginService;
	JoinService joinService;
	FindMemService findMemService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET) //입력폼보기	
	public String form() {
	  return "user/login";	
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST) //DB입력
	public String formInsert(String userid, String userpwd) throws Exception {
		loginService.login(userid,userpwd);
		return "redirect:/list";	
	}
	
	
	@RequestMapping("/memberlist")
	public String list(String userid, String userpwd, Model model) throws Exception {		
		model.addAttribute("list",findMemService.find(userid, userpwd));//뷰와 공유할 데이터를 영역에 저장	
		return "user/searchmember";//JSP페이지 포워딩
	}
	
	@RequestMapping(value = "/memberupdate" , method = RequestMethod.GET)//수정폼 보이기
	public String upform(MemberDto memberDto, String originalid, Model m) throws Exception {
		m.addAttribute("person",joinService.update(memberDto, originalid));
		return "user/modify";
	}
	
	@RequestMapping(value = "/memberupdate" , method = RequestMethod.POST)//DB수정하기
	public String update(MemberDto memberDto, String originalid) throws Exception {
		joinService.update(memberDto, originalid);		
		return "redirect:/list";
	}
	
	@RequestMapping("/memberdelete")//DB삭제하기
	public String delete(String userpwd) throws Exception {
		loginService.deleteInfo(userpwd);
		return "redirect:/list";
	}
	
}