package com.duck.playduck.admin2.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.admin2.dao.AdminDAO2;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.Stock;

@Service
public class AdminServiceImpl2 implements AdminService2 {

	@Autowired
	AdminDAO2 adminDAO;

	@Override
	public List<Map<String, String>> selectReviewList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return adminDAO.selectReviewList(cPage, numPerPage);
	}

	@Override
	public int selectReviewTotalContents() {
		// TODO Auto-generated method stub
		return adminDAO.selectReviewTotalContents();
	}

	@Override
	public int deleteReview(int r_no) {
		// TODO Auto-generated method stub
		return adminDAO.deleteReview(r_no);
	}

	@Override
	public List<Map<String, String>> reviewSr(int cPage, int numPerPage, String text) {
		
		return adminDAO.reviewSr(cPage, numPerPage, text);
	}

	@Override
	public int selectreviewSrTotalContents(String text) {
		// TODO Auto-generated method stub
		return adminDAO.selectreviewSrTotalContents(text);
	}

	@Override
	public int insertMd(Md m) {
		// TODO Auto-generated method stub
		return adminDAO.insertMd(m);
	}

	@Override
	public List<Map<String, String>> mdListPage(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return adminDAO.mdListPage(cPage, numPerPage);
	}

	@Override
	public int selectMdListPage() {
		// TODO Auto-generated method stub
		return adminDAO.selectMdListPage();
	}

	@Override
	public int insertStock(int quan) {
		// TODO Auto-generated method stub
		return adminDAO.insertStock(quan);
	}

	@Override
	public List<Map<String, String>> MDSr(int cPage, int numPerPage, String text) {
		// TODO Auto-generated method stub
		return adminDAO.MDSr(cPage, numPerPage,text);
	}

	@Override
	public int selectMdSrTotalContents(String text) {
		// TODO Auto-generated method stub
		return adminDAO.selectMdSrTotalContents(text);
	}

	@Override
	public Md selectUpdateMD(int d_no) {
		// TODO Auto-generated method stub
		return adminDAO.selectUpdateMD(d_no);
	}

	@Override
	public List<Stock> stockM() {
		// TODO Auto-generated method stub
		return  adminDAO.stockM();
	}

	@Override
	public List<Stock> StockMdSer(String text) {
		// TODO Auto-generated method stub
		return adminDAO.StockMdSer(text);
	}

	@Override
	public Stock selectUpateSt(int d_no) {
		// TODO Auto-generated method stub
		return adminDAO.selectUpateSt(d_no);
	}

	@Override
	public int upDateMd(Md m) {
		// TODO Auto-generated method stub
		return adminDAO.upDateMd(m);
	}

	@Override
	public int upDateStock(Stock s) {
		// TODO Auto-generated method stub
		return adminDAO.upDateStock(s);

	}

	@Override
	public List<Map<String, String>> saleList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return adminDAO.saleList(cPage, numPerPage);
	}

	@Override
	public int selectSaleList() {
		// TODO Auto-generated method stub
		return adminDAO.selectSaleList();
	}

	@Override
	public List<Map<String, String>> saleSeList(int cPage, int numPerPage, String text) {
		// TODO Auto-generated method stub
		return adminDAO.saleSeList(cPage,numPerPage,text);
	}

	@Override
	public int selectSaleListCount(String text) {
		// TODO Auto-generated method stub
		return adminDAO.selectSaleListCount(text);
	}

}
