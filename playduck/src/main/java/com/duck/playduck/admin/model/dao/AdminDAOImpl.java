package com.duck.playduck.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.duck.playduck.admin.model.vo.Reward;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.vo.BuyList;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<Member> Memberadmin(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin-mapper.Memberadmin",null,rows);
	}

	@Override
	public Reward memberadminReward(int result) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.memberadminReward",result);
	}

	@Override
	public int memberadminDelete(int m_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("admin-mapper.memberadminDelete",m_no);
	}

	@Override
	public List<BuyList> adminreturn(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin-mapper.adminreturn",null,rows);
	}

	@Override
	public List<BuyList> admincancel(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin-mapper.admincancel",null,rows);
	}

	@Override
	public List<Member> memberadminsr(int cPage, int numPerPage, String text) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin-mapper.membersr",text,rows);
	}

	@Override
	public List<BuyList> admincancelsr(int cPage, int numPerPage,String text) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin-mapper.admincancelsr",text);
	}

	@Override
	public List<BuyList> adminreturnsr(int cPage, int numPerPage,String text) {
		RowBounds rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin-mapper.adminreturnsr",text);
	}

	@Override
	public int updatereturn(int d_no) {
		// TODO Auto-generated method stub
		return sqlSession.insert("admin-mapper.updatereturn",d_no);
	}

	@Override
	public int selectmemberTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.selectmemberTotal");
	}

	@Override
	public int selectmemberSrTotalContents(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.selectmemberSrTotalContents",text);
	}

	@Override
	public int selectcancelTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.selectcancelTotal");
	}

	@Override
	public int selectcancelsrTotal(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.selectcancelsrTotal",text);
	}

	@Override
	public int selectreturnTotal() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.selectreturnTotal");
	}

	@Override
	public int selectreturnsrTotal(String text) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin-mapper.selectreturnsrTotal",text);
	}
	
	
	
	
	
}
