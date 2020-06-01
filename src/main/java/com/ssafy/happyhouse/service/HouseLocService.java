package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseLoc;

public interface HouseLocService {
	public List<HouseLoc> listLoc(String key, String word) throws Exception;
}
