package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.MemberDao;
import com.ssafy.happyhouse.dao.MemberDaoImpl;
import com.ssafy.happyhouse.dto.MemberDto;

@Service
public class FindMemServiceImpl implements FindMemService {

	@Autowired
	MemberDao memberDao;

	public List<MemberDto> find(String key, String value) throws Exception {
		key = key==null ? "" :key;
		value =value ==null ? "" :value;
		return memberDao.find(key, value);
	}

}