package com.duck.playduck.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.review.model.vo.Review;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertPfImg(Member m) {
		
		return sqlSession.insert("member.insertPfImg", m);
	}

	@Override
	public int selectCount(Member m) {
		
		return sqlSession.selectOne("review-mapper.selectCount", m);
	}

	@Override
	public int selectReward(Member m) {
		
		return sqlSession.selectOne("member.selectReward", m);
	}

	@Override
	public int selectRank(Member m) {
		
		return sqlSession.selectOne("member.selectRank", m);
	}

	@Override
	public int countReward(Member m) {

		return sqlSession.selectOne("member.countReward", m);
	}

	@Override
	public List<Review> myReview(int mm) {
		
		return sqlSession.selectList("review-mapper.myReview", mm);
	}

	@Override
	public List<Bookmark> bookmarkPlay(int mm) {

		return sqlSession.selectList("member.bookmarkPlay", mm);
	}

	@Override
	public List<Curation> bookmarkCuration(int mm) {
		
		return sqlSession.selectList("member.bookmarkCuration", mm);
	}

	@Override
	public int deletePlay(String no) {
		
		return sqlSession.delete("member.deletePlay", no);
	}

	@Override
	public int deleteCuration(int no) {
		
		return sqlSession.delete("member.deleteCuration", no);
	}


	








	
}
