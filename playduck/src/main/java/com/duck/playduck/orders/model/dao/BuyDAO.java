package com.duck.playduck.orders.model.dao;

import java.util.List;

import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.vo.BuyList;

public interface BuyDAO {

	

	List<BuyList> selectBuyList(Member m, int cPage, int numPerPage);

	int selectTotalContents();

	int buyCancel(int o_no);

	int buyReturn(int o_no);

}
