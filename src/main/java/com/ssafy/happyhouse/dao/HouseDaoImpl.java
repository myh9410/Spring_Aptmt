package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.AptInfoPasser;
import com.ssafy.happyhouse.dto.HouseDeal;

@Repository
public class HouseDaoImpl implements HouseDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public HouseDeal search(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HouseDeal> listAptmt(int currentPage, int sizePerPage, String key, String word) throws Exception {
		AptInfoPasser aip = new AptInfoPasser((currentPage-1)*sizePerPage, sizePerPage, key, word);
		//, bounds
		return sqlSession.selectList("query.listAptmt", aip);
	}

	@Override
	public int getTotalCount(String key, String word) throws SQLException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		return sqlSession.selectOne("query.totalCount",map);
	}

}
