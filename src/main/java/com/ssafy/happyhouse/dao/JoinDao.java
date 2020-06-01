package com.ssafy.happyhouse.dao;

import com.ssafy.happyhouse.dto.MemberDto;


public interface JoinDao {

	public MemberDto join(MemberDto memberDto) throws Exception;
	public MemberDto update(MemberDto memberDto, String originalid) throws Exception;
	
}
