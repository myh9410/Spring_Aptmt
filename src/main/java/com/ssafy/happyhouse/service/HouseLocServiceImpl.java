package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseLocDao;
import com.ssafy.happyhouse.dto.HouseLoc;

@Service
public class HouseLocServiceImpl implements HouseLocService {
	
	@Autowired
	HouseLocDao dao;
	
	@Override
	public List<HouseLoc> listLoc(String key, String word) throws Exception {
		return dao.listLoc(key, word);
	}
}