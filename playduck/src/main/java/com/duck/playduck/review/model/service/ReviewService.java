package com.duck.playduck.review.model.service;

import java.util.Map;

public interface ReviewService {

	int insertReview(Map<String, Object> map);

	int insertReview2(Map<String, Object> map);

	int insertReward(int m_no);

	int insertPGood(String p_no);

	int insertPBad(String p_no);

}
