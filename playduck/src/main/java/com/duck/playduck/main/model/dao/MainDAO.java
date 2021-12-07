package com.duck.playduck.main.model.dao;

import java.util.List;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.main.model.vo.Main;
import com.duck.playduck.md.model.vo.mReward;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.Review;

public interface MainDAO {

	List<Main> selectMainTopList();

	List<Review> ReviewTop10();

	List<Play> playgb();

	List<Review> HotReview();

	List<Play> allPlaySelect();

	List<Member> memberGenrenmG(int m_no);

	List<Curation> curationforDuck();

	List<String> memberpic();

	List<Bookmark> BookMarkC(int m_no);

	int insertBM(Bookmark b);

	int insertDe(Bookmark b);

	List<Bookmark> BookMarkCL(int m_no);

	int CBookMarkIn(Bookmark b);

	int CBookMarkDe(Bookmark b);

	String curationforDuck(int parseInt);

	List<mReward> mainCuButton(int m_no);

	int reviewCheck(Review r);

}
