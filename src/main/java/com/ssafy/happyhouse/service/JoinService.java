package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.dto.MemberDto;

public interface JoinService {

	public int join(MemberDto memberDto) throws Exception;
	public int update(MemberDto memberDto) throws Exception;
	
}