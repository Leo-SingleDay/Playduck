package com.duck.playduck.md.model.dao;

import java.util.List;
import java.util.Map;

import com.duck.playduck.md.model.vo.Basket;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.mOrder;
import com.duck.playduck.play.model.vo.Play;

public interface MdDAO {

	//연극별 MD 리스트
	List<Md> mdPlayList(String p_no);

	Md selectOneMd(int d_no);

	int getReward(int mno);

	int addBasket(int dno, int mno, int num);

	List<Md> getbasketList(int mno);

	int updateBasket(int dno, int mno, int num);

	Md selectOneBasket(int dno, int mno, int num);

	int update2Basket(int dno, int mno, int num);

	int selectTotalContents();

	int update3Basket(int dno, int mno, int b_status);

	int updateReward(int m_no, int w_down);

	List<Basket> getbasketList2(int m_no);

	int insertOrderList(mOrder mOrder);

	int deletebuyBasket(int m_no);
	List<Map<String, String>> selectMDList(int cPage, int numPerPage);

	List<Map<String, String>> selectSearchList(String keyword, int cPage, int numPerPage);

	int selectTotalContents2(String keyword);

	int delBasket(int d_no, int m_no);

	int downQuna(mOrder mOrder);

}
