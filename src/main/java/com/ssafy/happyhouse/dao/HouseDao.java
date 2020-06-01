package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;

public interface HouseDao {
	public HouseDeal search(int no) throws Exception;
	public List<HouseDeal> listAptmt(int currentPage, int sizePerPage, String key, String word) throws Exception;
	public int getTotalCount(String key, String word) throws SQLException;
}
