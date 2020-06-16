package com.ssafy.happyhouse.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.LoginDao;
import com.ssafy.happyhouse.dao.LoginDaoImpl;
import com.ssafy.happyhouse.dto.MemberDto;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginDao loginDao;
	
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception {
		if (userid == null || userpwd == null)
			throw new Exception();
		return loginDao.login(userid, userpwd);
	}

	@Override
	public MemberDto findpwd(MemberDto memberDto) throws Exception {
		if (memberDto.getUserid() == null || memberDto.getUsername() == null || memberDto.getEmail() == null) throw new Exception();
		return loginDao.findpwd(memberDto);
	}
	
	@Override
	public int deleteInfo(String userpwd) throws Exception {
		return loginDao.deleteInfo(userpwd);
	}
	
}