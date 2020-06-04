package com.ssafy.happyhouse.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.JoinDao;
import com.ssafy.happyhouse.dao.JoinDaoImpl;
import com.ssafy.happyhouse.dto.MemberDto;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	JoinDao joinDao;
	
	@Override
	public int join(MemberDto memberDto) throws Exception {
		if (memberDto.getUserid() == "" || memberDto.getUsername() =="") throw new Exception();
		return joinDao.join(memberDto);
	}

	@Override
	public int update(MemberDto memberDto) throws Exception {
		if (memberDto.getUserid() == "" || memberDto.getUsername() =="") throw new Exception();
		return joinDao.update(memberDto);
	}

}