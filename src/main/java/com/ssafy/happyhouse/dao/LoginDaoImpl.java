package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.MemberDto;

@Repository
public class LoginDaoImpl implements LoginDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberDto login(String userid, String userpwd) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		return sqlSession.selectOne("query.login", map);
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
