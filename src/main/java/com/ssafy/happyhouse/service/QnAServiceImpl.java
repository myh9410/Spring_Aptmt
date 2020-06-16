package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.QnADao;
import com.ssafy.happyhouse.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService {

	@Autowired
	QnADao dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		return dao.selectQnA();
	}

	@Override
	public int deleteQnA(int qna_no) {
		return dao.deleteQnA(qna_no);
	}

	@Override
	public int updateQnA(QnA qna) {
		return dao.updateQnA(qna);
	}

	@Override
	public int writeQnA(QnA qna) {
		return dao.writeQnA(qna);
	}

	@Override
	public QnA selectQnAByNo(int qna_no) {
		return dao.selectQnAByNo(qna_no);
	}

}
