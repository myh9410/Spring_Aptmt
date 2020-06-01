package com.ssafy.happyhouse.service;

import java.util.List;
import com.ssafy.happyhouse.dto.MemberDto;

public interface FindMemService {
	public List<MemberDto> find(String key, String value) throws Exception;
}
