package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.MemberDto;

public interface MemberDao {
	public List<MemberDto> find(String key, String value) throws SQLException;
}
