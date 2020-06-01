package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dao.HouseLocDao;
import com.ssafy.happyhouse.dao.HouseLocDaoImpl;
import com.ssafy.happyhouse.dto.HouseLoc;

public class HouseLocServiceImpl implements HouseLocService {
	private HouseLocDao dao;
	
	public HouseLocServiceImpl() {
		dao = new HouseLocDaoImpl();
	}
	@Override
	public List<HouseLoc> listLoc(String key, String word) throws Exception {
		return dao.listLoc(key, word);
	}
	
	
}