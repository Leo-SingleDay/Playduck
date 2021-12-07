package com.duck.playduck.md.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.md.model.vo.Basket;
import com.duck.playduck.md.model.vo.Md;
import com.duck.playduck.md.model.vo.mOrder;
import com.duck.playduck.md.model.vo.mReward;


@Repository
public class MdDAOImpl implements MdDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	//연극별 MD 리스트
	@Override
	public List<Md> mdPlayList(String p_no) {
	
		return sqlSession.selectList("md2-mapper.mdPlayList",p_no);
	}

	// Md 한개 정보 가져오기
	@Override
	public Md selectOneMd(int d_no) {
		
		return sqlSession.selectOne("md2-mapper.selectOneMd", d_no);
	}

	// reward 값 가져오기
	@Override
	public int getReward(int mno) {
		if(sqlSession.selectOne("md2-mapper.getReward",mno)==null) {
			return 0;
		} else {
		return sqlSession.selectOne("md2-mapper.getReward",mno);
		}
	}

	// basket에 담기
	@Override
	public int addBasket(int dno, int mno, int num) {
		
		Basket basket = new Basket(mno,dno,num);
		
		System.out.println(num);
		return sqlSession.insert("md2-mapper.addBasket",basket);
	}

	// 장바구니 리스트 불러오기
	@Override
	public List<Md> getbasketList(int mno) {
		
		return sqlSession.selectList("md2-mapper.getbasketList", mno);
	}

	// basket 숫자 업데이트
	@Override
	public int updateBasket(int dno, int mno, int num) {
	
		Basket basket = new Basket(mno,dno,num);
		
		return sqlSession.update("md2-mapper.updateBasket", basket);
	}

	// basket 하나 선택해오기
	@Override
	public Md selectOneBasket(int dno, int mno, int num) {
		
		Basket basket = new Basket(mno,dno,num);
		
		return sqlSession.selectOne("md2-mapper.selectOneBasket", basket);
	}

	// 장바구니에서 수량 수정
	@Override
	public int update2Basket(int dno, int mno, int num) {
		Basket basket = new Basket(mno,dno,num);
		
		return sqlSession.update("md2-mapper.update2Basket", basket);
	}


	// 전체 MD 페이지_ 페이징처리
	@Override
	public int selectTotalContents() {
		
		return sqlSession.selectOne("md2-mapper.selectTotalContents");
	}

	// 장바구니 MD 선택하기 해제하기
	@Override
	public int update3Basket(int dno, int mno, int b_status) {
	
		Basket basket = new Basket(mno,dno, 0,b_status);
		
		System.out.println(b_status);
		return sqlSession.update("md2-mapper.update3Basket", basket);
	}

	// 사용할 리워드 값 저장하기
	@Override
	public int updateReward(int m_no, int w_down) {
	
		mReward mreward = new mReward( m_no, w_down);
		
		return sqlSession.insert("md2-mapper.updateReward", mreward );

	}


	// basket 불러오기 (주문목록 저장용)
	@Override
	public List<Basket> getbasketList2(int m_no) {
		
		return sqlSession.selectList("md2-mapper.getbasketList2", m_no);
	}

	// Order 주문목록 저장하기
	@Override
	public int insertOrderList(mOrder mOrder) {
		
		return sqlSession.insert("md2-mapper.insertOrderList", mOrder);
	}

	// 구매한 장바구니 삭제하기
	@Override
	public int deletebuyBasket(int m_no) {
		
		return sqlSession.delete("md2-mapper.deletebuyBasket", m_no);
	}

	@Override
	public List<Map<String, String>> selectMDList(int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("md2-mapper.selectMDList", null, rows);
	}

	@Override
	public List<Map<String, String>> selectSearchList(String keyword, int cPage, int numPerPage) {
		
		RowBounds rows = new RowBounds((cPage-1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("md2-mapper.selectSearchList", keyword, rows);
	}

	// 검색 결과 
	@Override
	public int selectTotalContents2(String keyword) {
		
		return sqlSession.selectOne("md2-mapper.selectTotalContents2", keyword);
	}
	
	// 장바구니 삭제하기
	@Override
	public int delBasket(int d_no, int m_no) {
		
		Basket basket = new Basket(m_no,d_no,1);
		
		return sqlSession.delete("md2-mapper.delBasket",basket);
	}

	// 수량 다운하기 
	public int downQuna(mOrder mOrder) {
	
		return sqlSession.update("md2-mapper.downQuan", mOrder);
	}


	



}
