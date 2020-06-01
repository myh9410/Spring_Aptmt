package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.dao.JoinDao;
import com.ssafy.happyhouse.dao.JoinDaoImpl;
import com.ssafy.happyhouse.dto.MemberDto;

public class JoinServiceImpl implements JoinService {

	JoinDao joinDao;
	
	public JoinServiceImpl() {
		joinDao = new JoinDaoImpl();
	}
	
	@Override
	public int join(MemberDto memberDto) throws Exception {
		if (memberDto.getUserid() == "" || memberDto.getUsername() =="") throw new Exception();
		return joinDao.join(memberDto);
	}

	@Override
	public int update(MemberDto memberDto, String originalid) throws Exception {
		if (memberDto.getUserid() == "" || memberDto.getUsername() =="") throw new Exception();
		return joinDao.update(memberDto,originalid);
	}

}
