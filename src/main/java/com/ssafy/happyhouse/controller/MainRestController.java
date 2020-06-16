package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.util.PageNavigation;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.FindMemService;
import com.ssafy.happyhouse.service.JoinService;
import com.ssafy.happyhouse.service.LoginService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RestController
public class MainRestController {
	
	@Autowired
	HouseService houseService;
	@Autowired
	FindMemService findMemService;
	@Autowired
	LoginService loginService;
	@Autowired
	JoinService joinService;

	@RequestMapping(value = "/join", method=RequestMethod.POST)
	public ResponseEntity<MemberDto> join(@RequestBody MemberDto dto) throws Exception{
		int result = joinService.join(dto);
		if (result == 1) {
			return new ResponseEntity<MemberDto>(HttpStatus.OK);			
		} else {
			return new ResponseEntity<MemberDto>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/findpwd", method = RequestMethod.POST)
	public ResponseEntity<MemberDto> findpwd(@RequestBody MemberDto memberDto, HttpServletRequest request) throws Exception {
		MemberDto m = loginService.findpwd(memberDto);
		if (m != null) {
			HttpSession session = request.getSession();
			session.setAttribute("reqpassword", m.getUserpwd());
			return new ResponseEntity<MemberDto>(HttpStatus.OK);
		} else {
			return new ResponseEntity<MemberDto>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/deleteInfo/{pwd}", method=RequestMethod.POST)
	public ResponseEntity<String> deleteInfo(@PathVariable("pwd") String pwd,HttpServletRequest request) throws Exception{
		if (loginService.deleteInfo(pwd)==1) {
			HttpSession session = request.getSession();
			session.removeAttribute("userinfo");
			return new ResponseEntity<String>(HttpStatus.OK);			
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
	} 

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ResponseEntity<String> login(@RequestParam String userid, @RequestParam String userpwd, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberDto m = loginService.login(userid, userpwd);
		if (m != null) {
			session.setAttribute("userinfo", m);
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/aptlist", method=RequestMethod.GET)
	public ModelAndView getUserInfo(@RequestParam String pg, @RequestParam String key, @RequestParam String word,Model model) throws Exception {
		int currentPage = Integer.parseInt(pg);
		List<HouseDeal> list = houseService.listAptmt(currentPage, 10, key, word);
		PageNavigation pageNavigation = houseService.makePageNavigation(currentPage, 10, key, word);
		model.addAttribute("list", list);
		model.addAttribute("key", key);
		model.addAttribute("word", word);
		model.addAttribute("navigation", pageNavigation);
		ModelAndView mav = new ModelAndView("apt/list");
		return mav;	
	}
	
	@GetMapping("/all")
	public List<MemberDto> list(String userid, String userpwd) throws Exception{
		return findMemService.find(userid, userpwd);
	} // 전체 회원 조회
	
	@RequestMapping(value = "/find", method=RequestMethod.GET)
	public ModelAndView searchMember(@RequestParam String key, @RequestParam String value, Model model) throws Exception{
		List<MemberDto> list = findMemService.find(key, value);
		for (MemberDto memberDto : list) {
			System.out.println(memberDto);
		}
		model.addAttribute("users", list);
		ModelAndView mav = new ModelAndView("user/searchmember");
		return mav;
	} 
	
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	public ResponseEntity<MemberDto> modify(@RequestBody MemberDto dto,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		MemberDto tmp = (MemberDto) session.getAttribute("userinfo");
		dto.setUserid(tmp.getUserid());
		String userid = request.getParameter("userid");
		String originalid = tmp.getUserid();
		MemberDto m = loginService.login(tmp.getUserid(), tmp.getUserpwd());
		session.setAttribute("userinfo", m);
		int result = joinService.update(dto);
		if (result == 1) {
			return new ResponseEntity<MemberDto>(HttpStatus.OK);
		} else {
			return new ResponseEntity<MemberDto>(HttpStatus.BAD_REQUEST);
		}
	} 
	
	@DeleteMapping("/{userpwd}")
	public String deleteInfo(@PathVariable("userpwd") String userpwd) throws Exception {
		if(loginService.deleteInfo(userpwd)==1) return "success";
		else return "fail";	
	}
}