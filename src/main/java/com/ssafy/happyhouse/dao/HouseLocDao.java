package com.ssafy.happyhouse.dao;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseLoc;

public interface HouseLocDao {
	public List<HouseLoc> listLoc(String key, String word) throws Exception;
}
