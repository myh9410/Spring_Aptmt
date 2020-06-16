package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.QnA;

public interface QnAService {
	List<QnA> retrieveQnA();
	int deleteQnA(int qna_no);
	int updateQnA(QnA qna);
	int writeQnA(QnA qna);
	QnA selectQnAByNo(int qna_no);
}
