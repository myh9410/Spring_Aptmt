package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.happyhouse.dto.MemberDto;

public class MemberDaoImpl implements MemberDao {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<MemberDto> find(String key, String value) throws SQLException {
		// ??
		List<MemberDto> list = sqlSession.selectList("query.list");
		return list;
	}
}
