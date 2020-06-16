package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.HouseDao;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class HouseServiceImpl implements HouseService {
	
	@Autowired
	HouseDao housedao;
	
	@Override
	public HouseDeal search(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HouseDeal> listAptmt(int currentPage, int sizePerPage, String key, String word) throws Exception {
		key = key == null ? "" : key;
		word = word == null ? "" : word;
		return housedao.listAptmt(currentPage, sizePerPage, key, word);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String key, String word) throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10;//페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = housedao.getTotalCount(key, word);//총 게시글 수
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1)/ sizePerPage +1;//총 페이지 수
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;//startRange가 true : 이전 x false : 이전 o
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount -1) / naviSize * naviSize < currentPage;//endtRange가 true : 다음 x false : 다음 o
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}
}
