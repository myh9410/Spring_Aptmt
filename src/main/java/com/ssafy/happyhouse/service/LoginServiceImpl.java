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
	
	public LoginServiceImpl() {
		loginDao = new LoginDaoImpl();
	}
	
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception {
		if (userid == null || userpwd == null)
			throw new Exception();
		return loginDao.login(userid, userpwd);
	}

	@Override
	public MemberDto findpwd(String userid, String username, String email) throws Exception {
		if (userid == null || username == null || email == null) throw new Exception();
		return loginDao.findpwd(userid,username,email);
	}
	
	@Override
	public int deleteInfo(String userpwd) throws Exception {
		return loginDao.deleteInfo(userpwd);
	}
	
}