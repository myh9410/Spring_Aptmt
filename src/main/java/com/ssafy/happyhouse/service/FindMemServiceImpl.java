package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dao.MemberDao;
import com.ssafy.happyhouse.dao.MemberDaoImpl;
import com.ssafy.happyhouse.dto.MemberDto;

public class FindMemServiceImpl implements FindMemService {

	private MemberDao memberDao;
	
	public FindMemServiceImpl() {
		memberDao = new MemberDaoImpl();
	}

	public List<MemberDto> find(String key, String value) throws Exception {
		return memberDao.find(key, value);
	}

}