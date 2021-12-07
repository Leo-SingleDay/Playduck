package com.duck.playduck.orders.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.vo.BuyList;

@Repository
public class BuyDAOImpl implements BuyDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	


	@Override
	public List<BuyList> selectBuyList(Member m, int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("buy-mapper.selectBuyList",m,rows);
	}



	@Override
	public int selectTotalContents() {
	
		return sqlSession.selectOne("buy-mapper.selectTotalContents");
	}



	@Override
	public int buyCancel(int o_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("buy-mapper.buyCancel",o_no);
	}



	@Override
	public int buyReturn(int o_no) {
		// TODO Auto-generated method stub
		return sqlSession.update("buy-mapper.buyReturn",o_no);
	}

}
