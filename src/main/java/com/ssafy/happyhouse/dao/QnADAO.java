package com.ssafy.happyhouse.dao;

import java.util.List;

import org.springframework.stereotype.Component;

import com.ssafy.happyhouse.dto.QnA;


public interface QnADao {
	List<QnA> selectQnA();
	int deleteQnA(int qna_no);
	int updateQnA(QnA qna);
	int writeQnA(QnA qna);
	QnA selectQnAByNo(int qna_no);
}
