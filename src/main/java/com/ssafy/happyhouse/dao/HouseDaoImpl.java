package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotalCount(String key, String word) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
