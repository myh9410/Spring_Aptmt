package com.ssafy.happyhouse.dao;

import java.sql.SQLException;

import com.ssafy.happyhouse.dto.MemberDto;


public interface LoginDao {

	public MemberDto login(String userid, String userpwd) throws SQLException;

	public MemberDto findpwd(MemberDto memberDto) throws SQLException;

	public int deleteInfo(String userpwd) throws SQLException;
	
}