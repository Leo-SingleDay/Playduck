package com.duck.playduck.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.admin.model.dao.AdminDAO;

import com.duck.playduck.admin.model.vo.Reward;
import com.duck.playduck.member.model.vo.Member;
import com.duck.playduck.orders.model.vo.BuyList;

@Service
public class AdminServiceImpl implements AdminService {

	
	@Autowired
	AdminDAO adminDAO;

	@Override
	public List<Member> memberadmin(int cPage, int numPerPage) {
		
		return adminDAO.Memberadmin(cPage,numPerPage);
	}
	

	@Override
	public Reward memberadminReward(int result) {
		// TODO Auto-generated method stub
		return adminDAO.memberadminReward(result);
	}


	@Override
	public int memberadminDelete(int m_no) {
		// TODO Auto-generated method stub
		return adminDAO.memberadminDelete(m_no);
	}

	@Override
	public List<BuyList> adminreturn(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return adminDAO.adminreturn(cPage,numPerPage);
	}

	@Override
	public List<BuyList> admincancel(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return adminDAO.admincancel(cPage,numPerPage);
	}

	@Override
	public List<Member> memberadminsr(int cPage, int numPerPage,String text) {
		// TODO Auto-generated method stub
		return adminDAO.memberadminsr(cPage,numPerPage,text);
	}

	@Override
	public List<BuyList> admincancelsr(int cPage, int numPerPage,String text) {
		// TODO Auto-generated method stub
		return adminDAO.admincancelsr(cPage,numPerPage,text);
	}

	@Override
	public List<BuyList> adminreturnsr(int cPage, int numPerPage,String text) {
		// TODO Auto-generated method stub
		return adminDAO.adminreturnsr(cPage,numPerPage,text);
	}

	@Override
	public int updatereturn(int d_no) {
		// TODO Auto-generated method stub
		return adminDAO.updatereturn(d_no);
	}


	@Override
	public int selectmemberTotal() {
		// TODO Auto-generated method stub
		return adminDAO.selectmemberTotal();
	}


	@Override
	public int selectmemberSrTotalContents(String text) {
		// TODO Auto-generated method stub
		return adminDAO.selectmemberSrTotalContents(text);
	}


	@Override
	public int selectcancelTotal() {
		// TODO Auto-generated method stub
		return adminDAO.selectcancelTotal();
	}


	@Override
	public int selectcancelsrTotal(String text) {
		// TODO Auto-generated method stub
		return adminDAO.selectcancelsrTotal(text);
	}


	@Override
	public int selectreturnTotal() {
		// TODO Auto-generated method stub
		return adminDAO.selectreturnTotal();
	}


	@Override
	public int selectreturnsrTotal(String text) {
		// TODO Auto-generated method stub
		return adminDAO.selectreturnsrTotal(text);
	}



}
