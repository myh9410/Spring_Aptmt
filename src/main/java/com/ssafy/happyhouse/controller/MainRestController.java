package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseLoc;
import com.ssafy.happyhouse.service.HouseLocService;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.util.PageNavigation;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.FindMemService;
import com.ssafy.happyhouse.service.JoinService;
import com.ssafy.happyhouse.service.LoginService;

@RestController
public class MainRestController {
	
	@Autowired
	HouseService houseService;
	@Autowired
	HouseLocService houseLocService;
	@Autowired
	FindMemService findMemService;
	@Autowired
	LoginService loginService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam String userid, @RequestParam String userpwd, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberDto m = loginService.login(userid, userpwd);
		System.out.println(m.toString());
		session.setAttribute("userinfo", m);
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return new ModelAndView("index");
	}
	
	@RequestMapping(value = "/aptlist", method=RequestMethod.GET)
	public ModelAndView getUserInfo(@RequestParam String pg, @RequestParam String key, @RequestParam String word,Model model) throws Exception {
		int currentPage = Integer.parseInt(pg);
		List<HouseDeal> list = houseService.listAptmt(currentPage, 10, key, word);
		PageNavigation pageNavigation = houseService.makePageNavigation(currentPage, 10, key, word);
		List<HouseLoc> loclist = houseLocService.listLoc(key,word);
		System.out.println(loclist.size());
		model.addAttribute("list", list);
		model.addAttribute("navigation", pageNavigation);
		model.addAttribute("loclist", loclist);
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
		model.addAttribute("users", list);
		ModelAndView mav = new ModelAndView("user/searchmember");
		return mav;
	} 

	@DeleteMapping("/{userpwd}")
	public String deleteInfo(@PathVariable("userpwd") String userpwd) throws Exception {
		if(loginService.deleteInfo(userpwd)==1)return "success";
		else return "fail";	
	}
}