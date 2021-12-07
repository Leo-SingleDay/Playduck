package com.duck.playduck.review.model.dao;

import java.util.Map;

public interface ReviewDAO {

	int insertReview(Map<String, Object> map);

	int insertReview2(Map<String, Object> map);

	int insertReward(int m_no);

	int insertPGood(String p_no);

	int insertPBad(String p_no);

}
