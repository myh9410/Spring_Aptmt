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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseLoc;
import com.ssafy.happyhouse.service.HouseLocService;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.util.PageNavigation;

@RestController
public class MainRestController {
	
	@Autowired
	HouseService houseService;
	@Autowired
	HouseLocService houseLocService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
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
	
}
