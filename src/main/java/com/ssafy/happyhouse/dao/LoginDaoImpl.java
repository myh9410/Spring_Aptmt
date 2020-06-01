package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.happyhouse.dto.MemberDto;



public class LoginDaoImpl implements LoginDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int login(String userid, String userpwd) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		int loginCnt= sqlSession.selectOne("query.login", map);
		return loginCnt;
	}

	@Override
	public MemberDto findpwd(String userid, String username, String email) throws SQLException {
		return sqlSession.selectOne("query.findpwd",userid);
	}

	@Override
	public int deleteInfo(String userpwd) throws SQLException {
		return sqlSession.delete("query.deleteInfo",userpwd);
		
	}
}
