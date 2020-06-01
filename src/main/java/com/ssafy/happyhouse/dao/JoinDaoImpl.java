package com.ssafy.happyhouse.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.MemberDto;


@Repository
public class JoinDaoImpl implements JoinDao {
<<<<<<< HEAD

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int join(MemberDto memberDto) throws Exception {
		return sqlSession.insert("query.join",memberDto);
=======
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int join(MemberDto memberDto) throws Exception {
		return sqlSession.insert("query.join",memberDto);

>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862
	}

	@Override
	public int update(MemberDto memberDto, String originalid) throws Exception {
		return sqlSession.update("query.update",memberDto);
<<<<<<< HEAD
	} 
=======

	} 

>>>>>>> 77c6840484ef10c29c2b1c9de3ec29ae22f52862

}