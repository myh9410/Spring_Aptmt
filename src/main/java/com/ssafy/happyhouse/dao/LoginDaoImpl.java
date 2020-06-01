package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
<<<<<<< HEAD
import java.util.HashMap;
import java.util.Map;
=======
import java.util.List;
>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.happyhouse.dto.MemberDto;



public class LoginDaoImpl implements LoginDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int login(String userid, String userpwd) throws SQLException {
<<<<<<< HEAD
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		int loginCnt= sqlSession.selectOne("query.login", map);
=======
		int loginCnt= sqlSession.selectOne("query.login", userid);
>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862
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
<<<<<<< HEAD
}
=======

	
}
>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862
