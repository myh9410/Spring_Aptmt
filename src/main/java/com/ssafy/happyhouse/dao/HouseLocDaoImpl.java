package com.ssafy.happyhouse.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.HouseLoc;

@Repository
public class HouseLocDaoImpl implements HouseLocDao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HouseLoc> listLoc(String key, String word) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("key", key);
		map.put("word", word);
		return sqlSession.selectList("query.listAptLoc", map);
	}

}
