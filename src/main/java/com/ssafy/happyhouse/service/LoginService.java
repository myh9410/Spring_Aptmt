package com.ssafy.happyhouse.service;

import com.ssafy.happyhouse.dto.MemberDto;

public interface LoginService {

	public MemberDto login(String userid, String userpwd) throws Exception;
	public String findpwd(String userid,String username,String email) throws Exception;
	public MemberDto deleteInfo(String userpwd) throws Exception;

}
