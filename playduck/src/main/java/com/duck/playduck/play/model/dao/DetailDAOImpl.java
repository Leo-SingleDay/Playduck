package com.duck.playduck.play.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.PlayDetail;
import com.duck.playduck.review.model.vo.Review;

@Repository
public class DetailDAOImpl implements DetailDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public PlayDetail selectPDOne(String p_no) {

		return sqlSession.selectOne("play-mapper.selectPD", p_no);
	}

	@Override
	public Play selectPlayOne(String p_no) {
		return sqlSession.selectOne("play-mapper.selectPlay", p_no);
	}

	@Override
	public List<Review> selectGoodReview(Map<String, Object> rmap) {
		return sqlSession.selectList("review-mapper.selectGood", rmap);
	}

	@Override
	public List<Review> selectBadReview(Map<String, Object> rmap) {
		return sqlSession.selectList("review-mapper.selectBad", rmap);
	}

	@Override
	public int deleteReview(int r_no) {
		return sqlSession.delete("review-mapper.deleteReview", r_no);
	}

	@Override
	public int reviewDupl(Map<String, Object> rmap) {
		return sqlSession.selectOne("review-mapper.reviewDupl", rmap);
	}

	@Override
	public int likeInsert(Map<String, Object> lmap) {
		return sqlSession.insert("review-mapper.likeInsert", lmap);
	}

	@Override
	public int likeInsert2(Map<String, Object> lmap) {
		return sqlSession.update("review-mapper.likeInsert2", lmap);
	}

	@Override
	public int likeCount(Map<String, Object> lmap) {
		return sqlSession.selectOne("review-mapper.likeCount", lmap);
	}

	@Override
	public int selectLikecheck(Map<String, Object> rmap) {
		
		//rl_like 가 null 이 들어올 수 있으니 0으로 처리하기
		Object rl_like = sqlSession.selectOne("review-mapper.selectLikecheck", rmap);
		
		if( rl_like == null) {
			rl_like = 0;
		}
		
		return (Integer)rl_like;
	}

	@Override
	public int likeDelete(Map<String, Object> lmap) {
		return sqlSession.delete("review-mapper.likeDelete", lmap);
	}

	@Override
	public int likeDelete2(Map<String, Object> lmap) {
		return sqlSession.update("review-mapper.likeDelete2", lmap);
	}

	@Override
	public int HateInsert(Map<String, Object> lmap) {
		return sqlSession.insert("review-mapper.HateInsert", lmap);
	}

	@Override
	public int HateInsert2(Map<String, Object> lmap) {
		return sqlSession.insert("review-mapper.HateInsert2", lmap);
	}

	@Override
	public int HateCount(Map<String, Object> lmap) {
		return sqlSession.selectOne("review-mapper.HateCount", lmap);
	}

	@Override
	public int HateDelete(Map<String, Object> lmap) {
		return sqlSession.delete("review-mapper.HateDelete", lmap);
	}

	@Override
	public int HateDelete2(Map<String, Object> lmap) {
		return sqlSession.delete("review-mapper.HateDelete2", lmap);
	}

	@Override
	public int detailBookmarkCheck(Map<String, Object> rmap) {
		return sqlSession.selectOne("review-mapper.detailBookmarkCheck", rmap);
	}



}
