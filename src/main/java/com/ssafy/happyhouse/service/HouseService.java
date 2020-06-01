package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.util.PageNavigation;

public interface HouseService {
	public  List<HouseDeal> listAptmt(int pg, int sizePerPage, String key, String word) throws Exception;
	public HouseDeal search(int no) throws Exception;
	public PageNavigation makePageNavigation(int pg, int sizePerPage, String key, String word) throws Exception;
}
