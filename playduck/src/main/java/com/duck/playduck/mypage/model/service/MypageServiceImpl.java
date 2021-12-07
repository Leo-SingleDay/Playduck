package com.duck.playduck.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.exception.BoardException;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.mypage.model.dao.MypageDAO;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.review.model.vo.Review;


@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO mypageDAO;

	@Override
	public int insertPfImg(Member m) {
		
		return mypageDAO.insertPfImg(m);
	}

	@Override
	public int selectCount(Member m) {
		// TODO Auto-generated method stub
		return mypageDAO.selectCount(m);
	}

	@Override
	public int selectReward(Member m) {

		return mypageDAO.selectReward(m);
	}

	@Override
	public int selectRank(Member m) {
		
		return mypageDAO.selectRank(m);
	}

	@Override
	public int countReward(Member m) {
		
		return mypageDAO.countReward(m);
	}

	@Override
	public List<Review> myReview(int mm) {
		
		return mypageDAO.myReview(mm);
	}

	@Override
	public List<Bookmark> bookmarkPlay(int mm) {
		
		return mypageDAO.bookmarkPlay(mm);
	}

	@Override
	public List<Curation> bookmarkCuration(int mm) {
		
		return mypageDAO.bookmarkCuration(mm);
	}

	@Override
	public int deletePlay(String no) {
		
		return mypageDAO.deletePlay(no);
	}

	@Override
	public int deleteCuration(int no) {
		
		return mypageDAO.deleteCuration(no);
	}

















	

	
	
}
