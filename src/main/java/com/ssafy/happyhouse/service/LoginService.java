package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.dto.MemberDto;

public interface LoginService {

	public MemberDto login(String userid, String userpwd) throws Exception;
	public MemberDto findpwd(MemberDto memberDto) throws Exception;
	public int deleteInfo(String userpwd) throws Exception;

}