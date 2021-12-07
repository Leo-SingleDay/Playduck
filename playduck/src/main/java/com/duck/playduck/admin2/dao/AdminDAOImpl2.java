package com.duck.playduck.admin2.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.Stock;

@Repository
public class AdminDAOImpl2 implements AdminDAO2 {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage) {

		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);

		return sqlSession.selectList("admin2-mapper.selectReviewList", null, rows);
	}

	@Override
	public int selectReviewTotalContents() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectReviewTotalContents");
	}

	@Override
	public int deleteReview(int r_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("admin2-mapper.deleteReview", r_no);
	}

	@Override
	public List<Map<String, String>> reviewSr(int cPage, int numPerPage, String text) {

		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);

		return sqlSession.selectList("admin2-mapper.reviewSr", text, rows);
	}

	@Override
	public int selectreviewSrTotalContents(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectreviewSrTotalContents", text);
	}

	@Override
	public int insertMd(Md m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin2-mapper.insertMd", m);
	}

	@Override
	public List<Map<String, String>> mdListPage(int cPage, int numPerPage) {

		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);

		return sqlSession.selectList("admin2-mapper.mdListPage", null, rows);
	}

	@Override
	public int selectMdListPage() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectMdListPage");
	}

	@Override
	public int insertStock(int quan) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin2-mapper.insertStock", quan);
	}

	@Override
	public List<Map<String, String>> MDSr(int cPage, int numPerPage, String text) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin2-mapper.MDSr", text, rows);
	}

	@Override
	public int selectMdSrTotalContents(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectMdSrTotalContents", text);
	}

	@Override
	public Md selectUpdateMD(int d_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectUpdateMD", d_no);
	}

	@Override
	public List<Stock> stockM() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin2-mapper.stockM");
	}

	@Override
	public List<Stock> StockMdSer(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin2-mapper.StockMdSer", text);
	}

	@Override
	public Stock selectUpateSt(int d_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectUpateSt", d_no);
	}

	@Override
	public int upDateMd(Md m) {
		// TODO Auto-generated method stub
		return sqlSession.update("admin2-mapper.upDateMd", m);
	}

	@Override
	public int upDateStock(Stock s) {
		// TODO Auto-generated method stub
		return sqlSession.update("admin2-mapper.upDateStock", s);
	}

	@Override
	public List<Map<String, String>> saleList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("admin2-mapper.saleList", null, rows);
	}

	@Override
	public int selectSaleList() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectSaleList");
	}

	@Override
	public List<Map<String, String>> saleSeList(int cPage, int numPerPage, String text) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin2-mapper.saleSeList", text, rows);
	}

	@Override
	public int selectSaleListCount(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin2-mapper.selectSaleListCount", text);
	}

}
