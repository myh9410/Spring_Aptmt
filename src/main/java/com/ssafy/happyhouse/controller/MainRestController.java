package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.MemberDto;
import com.ssafy.happyhouse.service.FindMemService;
import com.ssafy.happyhouse.service.JoinService;
import com.ssafy.happyhouse.service.LoginService;

@RestController
public class MainRestController {
	
	@Autowired
	LoginService loginService;
	JoinService joinService;
	FindMemService findMemService;
	
	@GetMapping("/all")
	public List<MemberDto> list(String userid, String userpwd) throws Exception{
		return findMemService.find(userid, userpwd);
	} // 전체 회원 조회
	
	@PutMapping("/")
	public String modify(@RequestBody MemberDto memberdto, String originalid) throws Exception {
		if(joinService.update(memberdto, originalid)==1) return "success";
		else return "fail";
	}
	
	@DeleteMapping("/{userpwd}")
	public String deleteInfo(@PathVariable("userpwd") String userpwd) throws Exception {
		if(loginService.deleteInfo(userpwd)==1)return "success";
		else return "fail";	
	}


}