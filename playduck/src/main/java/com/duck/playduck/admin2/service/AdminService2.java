package com.duck.playduck.admin2.service;

import java.util.List;
import java.util.Map;

import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.Stock;
import com.duck.playduck.review.model.vo.Review;

public interface AdminService2 {


	List<Map<String, String>> selectReviewList(int cPage, int numPerPage);

	int selectReviewTotalContents();

	int deleteReview(int r_no);

	List<Map<String, String>> reviewSr(int cPage, int numPerPage, String text);

	int selectreviewSrTotalContents(String text);

	int insertMd(Md m);

	List<Map<String, String>> mdListPage(int cPage, int numPerPage);

	int selectMdListPage();

	int insertStock(int quan);

	List<Map<String, String>> MDSr(int cPage, int numPerPage, String text);

	int selectMdSrTotalContents(String text);

	Md selectUpdateMD(int d_no);

	List<Stock> stockM();

	List<Stock> StockMdSer(String text);

	Stock selectUpateSt(int d_no);

	int upDateMd(Md m);

	int upDateStock(Stock s);

	List<Map<String, String>> saleList(int cPage, int numPerPage);

	int selectSaleList();

	List<Map<String, String>> saleSeList(int cPage, int numPerPage, String text);

	int selectSaleListCount(String text);



}
