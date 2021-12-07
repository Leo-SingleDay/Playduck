package com.duck.playduck.md.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.md.model.dao.MdDAO;
import com.duck.playduck.md.model.vo.Basket;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.mOrder;
import com.duck.playduck.play.model.vo.Play;

@Service
public class MdServiceImpl implements MdService {

	@Autowired
	MdDAO mdDAO;

	//연극별 MD 리스트
	@Override
	public List<Md> mdPlayList(String p_no) {
		
		return mdDAO.mdPlayList(p_no);
	}

	// Md 한개 정보 가져오기
	@Override
	public Md selectOneMd(int d_no) {
		
		return mdDAO.selectOneMd(d_no);
	}

	// reward 값 가져오기
	@Override
	public int getReward(int mno) {
		
		return mdDAO.getReward(mno);
	}

	// basket에 담기
	@Override
	public int addBasket(int dno, int mno, int num) {
		
		return mdDAO.addBasket(dno, mno, num);
	}

	// 장바구니 리스트 불러오기
	@Override
	public List<Md> getbasketList(int mno) {
		
		return mdDAO.getbasketList(mno);
	}

	// basket 숫자 업데이트
	@Override
	public int updateBasket(int dno, int mno, int num) {
		
		return mdDAO.updateBasket(dno,mno,num);
	}

	// basket 하나 선택해오기
	@Override
	public Md selectOneBasket(int dno, int mno, int num) {
		
		return mdDAO.selectOneBasket(dno, mno, num);
	}
	
	// 장바구니에서 수량 수정
	@Override
	public int update2Basket(int dno, int mno, int num) {
		
		return mdDAO.update2Basket(dno,mno,num);
	}


	// MD 전체 페이지_ 페이징처리
	@Override
	public int selectTotalContents() {
		
		return mdDAO.selectTotalContents();
	}

	// 장바구니 MD 선택하기 해제하기
	public int update3Basket(int dno, int mno, int b_status) {
		
		return mdDAO.update3Basket(dno,mno, b_status);
	}

	// 사용할 리워드 값 저장하기
	public int updateReward(int m_no, int w_down) {
	

		return mdDAO.updateReward(m_no, w_down);
	}


	// basket 불러오기 (주문목록 저장용)
	public List<Basket> getbasketList2(int m_no) {
		
		return mdDAO.getbasketList2(m_no);
	}

	// Order 주문목록 저장하기
	public int insertOrderList(mOrder mOrder) {
		
		return mdDAO.insertOrderList(mOrder);
	}

	// 구매한 장바구니 삭제하기
	public int deletebuyBasket(int m_no) {
		
		return mdDAO.deletebuyBasket(m_no);
	}

	// 페이지네이션
	@Override
	public List<Map<String, String>> selectMDList(int cPage, int numPerPage) {
		
		return mdDAO.selectMDList(cPage, numPerPage);
	}

	// 검색 결과
	@Override
	public List<Map<String, String>> selectSearchList(String keyword, int cPage, int numPerPage) {
		
		return mdDAO.selectSearchList(keyword, cPage, numPerPage);
	}

	@Override
	public int selectTotalContents2(String keyword) {
		
		return mdDAO.selectTotalContents2(keyword);
	}

	// 장바구니 삭제하기
	public int delBasket(int d_no, int m_no) {
		
		return mdDAO.delBasket(d_no,m_no);
	}

	// 수량 다운하기 
	public int downQuan(mOrder mOrder) {
		
		return mdDAO.downQuna(mOrder);
	}





	

	


}
