package com.ssafy.happyhouse.dao;

import com.ssafy.happyhouse.dto.MemberDto;


public interface JoinDao {

	public int join(MemberDto memberDto) throws Exception;
	public int update(MemberDto memberDto) throws Exception;
	
}