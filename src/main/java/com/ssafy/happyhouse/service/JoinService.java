package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.dto.MemberDto;

public interface JoinService {

	public MemberDto join(MemberDto memberDto) throws Exception;
	public MemberDto update(MemberDto memberDto, String originalid) throws Exception;
	
}
