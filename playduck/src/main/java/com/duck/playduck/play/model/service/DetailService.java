package com.duck.playduck.play.model.service;

import java.util.List;
import java.util.Map;

import com.duck.playduck.main.model.vo.Main;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.PlayDetail;
import com.duck.playduck.review.model.vo.Review;

public interface DetailService {


	PlayDetail selectPDOne(String p_no);

	Play selectPlayOne(String p_no);

	List<Review> selectGoodReview(Map<String, Object> rmap);

	List<Review> selectBadReview(Map<String, Object> rmap);

	int deleteReview(int r_no);

	int reviewDupl(Map<String, Object> rmap);

	int likeInsert(Map<String, Object> lmap);

	int likeInsert2(Map<String, Object> lmap);

	int likeCount(Map<String, Object> lmap);

	int selectLikecheck(Map<String, Object> rmap);

	int likeDelete(Map<String, Object> lmap);

	int likeDelete2(Map<String, Object> lmap);

	int HateInsert(Map<String, Object> lmap);

	int HateInsert2(Map<String, Object> lmap);

	int HateCount(Map<String, Object> lmap);

	int HateDelete(Map<String, Object> lmap);

	int HateDelete2(Map<String, Object> lmap);

	int detailBookmarkCheck(Map<String, Object> rmap);



}
