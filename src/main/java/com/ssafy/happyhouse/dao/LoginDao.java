package com.ssafy.happyhouse.dao;

import java.sql.SQLException;

import com.ssafy.happyhouse.dto.MemberDto;


public interface LoginDao {

	public int login(String userid, String userpwd) throws SQLException;

	public MemberDto findpwd(String userid, String username, String email) throws SQLException;

	public int deleteInfo(String userpwd) throws SQLException;
	
}
