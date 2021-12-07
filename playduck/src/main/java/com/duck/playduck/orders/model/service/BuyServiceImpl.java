package com.duck.playduck.orders.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.dao.BuyDAO;
import com.duck.playduck.orders.model.vo.BuyList;

@Service
public class BuyServiceImpl implements BuyService {

	@Autowired
	BuyDAO buyDAO;


	@Override
	public List<BuyList> selectBuyList(Member m, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return buyDAO.selectBuyList(m,cPage, numPerPage);
	}



	@Override
	public int selectTotalContents() {
		// TODO Auto-generated method stub
		return buyDAO.selectTotalContents();
	}



	@Override
	public int buyCancel(int o_no) {
		// TODO Auto-generated method stub
		return buyDAO.buyCancel(o_no);
	}



	@Override
	public int buyReturn(int o_no) {
		// TODO Auto-generated method stub
		return buyDAO.buyReturn(o_no);
	}

}
