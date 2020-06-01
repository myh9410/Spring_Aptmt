package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.dto.MemberDto;

public interface LoginService {

	public MemberDto login(String userid, String userpwd) throws Exception;
	public MemberDto findpwd(String userid,String username,String email) throws Exception;
	public int deleteInfo(String userpwd) throws Exception;

}