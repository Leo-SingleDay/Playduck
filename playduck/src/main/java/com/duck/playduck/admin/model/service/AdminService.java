package com.duck.playduck.admin.model.service;

import java.util.List;


import com.duck.playduck.admin.model.vo.Reward;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.vo.BuyList;

public interface AdminService {



	

	Reward memberadminReward(int result);


	int memberadminDelete(int m_no);

	List<BuyList> adminreturn(int cPage, int numPerPage);

	List<BuyList> admincancel(int cPage, int numPerPage);

	List<Member> memberadminsr(int cPage, int numPerPage, String text);

	List<BuyList> admincancelsr(int cPage, int numPerPage, String text);

	List<BuyList> adminreturnsr(int cPage, int numPerPage, String text);

	int updatereturn(int d_no);

	List<Member> memberadmin(int cPage, int numPerPage);


	int selectmemberTotal();


	int selectmemberSrTotalContents(String text);


	int selectcancelTotal();


	int selectcancelsrTotal(String text);


	int selectreturnTotal();


	int selectreturnsrTotal(String text);

}
