package com.duck.playduck.main.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.main.model.vo.Main;
import com.duck.playduck.md.model.vo.mReward;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.review.model.vo.Review;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Main> selectMainTopList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.selectMainTopList");
	}

	@Override
	public List<Review> ReviewTop10() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.reviewTop10");
	}

	@Override
	public List<Play> playgb() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.playgb");
	}

	@Override
	public List<Review> HotReview() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.hotReview");
	}

	@Override
	public List<Play> allPlaySelect() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.allPlaySelect");
	}

	@Override
	public List<Member> memberGenrenmG(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.memberGenrenmG", m_no);
	}

	@Override
	public List<Curation> curationforDuck() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.curationforDuck");
	}

	@Override
	public List<String> memberpic() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.memberpic");
	}

	@Override
	public List<Bookmark> BookMarkC(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.BookMarkC", m_no);
	}

	@Override
	public int insertBM(Bookmark b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("main-mapper.insertBM", b);
	}

	@Override
	public int insertDe(Bookmark b) {
		// TODO Auto-generated method stub
		return sqlSession.delete("main-mapper.deleteBM", b);
	}

	@Override
	public List<Bookmark> BookMarkCL(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.BookMarkCL", m_no);
	
	}

	@Override
	public int CBookMarkIn(Bookmark b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("main-mapper.CBookMarkIn", b);
	}

	@Override
	public int CBookMarkDe(Bookmark b) {
		// TODO Auto-generated method stub
		return sqlSession.delete("main-mapper.CBookMarkDe", b);
	}

	@Override
	public String curationforDuck(int parseInt) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("main-mapper.curationforDucksel", parseInt);
	}

	@Override
	public List<mReward> mainCuButton(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main-mapper.mainCuButton", m_no);
	}

	@Override
	public int reviewCheck(Review r) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("main-mapper.reviewCheck", r);
	}

}
