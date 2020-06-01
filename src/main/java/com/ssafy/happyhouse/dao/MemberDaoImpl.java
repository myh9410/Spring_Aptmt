package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

<<<<<<< HEAD
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.apache.ibatis.session.SqlSession;
>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862

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
<<<<<<< HEAD
}
=======

}
>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862
