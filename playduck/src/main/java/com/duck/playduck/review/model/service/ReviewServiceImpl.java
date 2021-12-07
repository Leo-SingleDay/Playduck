package com.duck.playduck.review.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.review.model.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public int insertReview(Map<String, Object> map) {
		
		return reviewDAO.insertReview(map);
		
	}

	@Override
	public int insertReview2(Map<String, Object> map) {
		return reviewDAO.insertReview2(map);
		
	}

	@Override
	public int insertReward(int m_no) {
		return reviewDAO.insertReward(m_no);
	}

	@Override
	public int insertPGood(String p_no) {
		return reviewDAO.insertPGood(p_no);
	}

	@Override
	public int insertPBad(String p_no) {
		return reviewDAO.insertPBad(p_no);
	}
	
	
	

}
