package com.duck.playduck.review.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertReview(Map<String, Object> map) {
		
		return sqlSession.insert("review-mapper.insertReview", map);
	}

	@Override
	public int insertReview2(Map<String, Object> map) {
		return sqlSession.insert("review-mapper.insertReview2", map);
	}

	@Override
	public int insertReward(int m_no) {
		return sqlSession.insert("review-mapper.insertReward", m_no);
	}

	@Override
	public int insertPGood(String p_no) {
		return sqlSession.update("review-mapper.insertPGood", p_no);
	}

	@Override
	public int insertPBad(String p_no) {
		return sqlSession.update("review-mapper.insertPBad", p_no);
	}

}
