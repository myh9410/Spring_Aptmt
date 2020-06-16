package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.QnA;

@Repository
public class QnADaoImpl implements QnADao {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<QnA> selectQnA() {
		return sqlSession.selectList("qna.selectQnA");
	}

	@Override
	public int deleteQnA(int qna_no) {
		return sqlSession.delete("qna.deleteQnA",qna_no);
	}

	@Override
	public int updateQnA(QnA qna) {
		return sqlSession.update("qna.updateQnA",qna);
	}

	@Override
	public int writeQnA(QnA qna) {
		return sqlSession.insert("qna.insertQnA", qna);
	}

	@Override
	public QnA selectQnAByNo(int qna_no) {
		return sqlSession.selectOne("qna.selectQnAByNo", qna_no);
	}

}
