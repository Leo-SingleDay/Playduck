package com.duck.playduck.curation.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.curation.model.dao.CurationDAO;
import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;

@Service
public class CurationServiceImpl implements CurationService{
	
	@Autowired
	CurationDAO curationDAO;


	@Override
	public int insertCuImg(Curation curation) {
		
		
		return curationDAO.insertCuration(curation);
	}


	@Override
	public int selectTotalCuration() {
		
		return curationDAO.selectTotalCuration();
	}


	@Override
	public List<Curation> selectCurationList(int cPage, int numPerPage) {
		return curationDAO.selectCurationList(cPage, numPerPage);
	}


	@Override
	public List<Curation> selectCurationList1(int cPage, int numPerPage) {
		return curationDAO.selectCurationList1(cPage, numPerPage);
	}


	@Override
	public List<Curation> selectCurationList2(int cPage, int numPerPage) {
		return curationDAO.selectCurationList2(cPage, numPerPage);
	}


	@Override
	public List<Bookmark> selectBookList(int m_no) {
		return curationDAO.selectBookList(m_no);
	}


	@Override
	public Curation curationSelectOne(int c_no) {
		return curationDAO.curationSelectOne(c_no);
	}


	@Override
	public int curationUpdate(Curation curation) {
		return curationDAO.curationUpdate(curation);
	}


	@Override
	public int curationDelete(int c_no) {
		return curationDAO.curationDelete(c_no);
		
	}

	// 검색기능
	@Override
	public List<Map<String, String>> selectSearchList(String keyword, int cPage, int numPerPage) {
		
		return curationDAO.selectSearchList(keyword, cPage, numPerPage);
	}


	@Override
	public int selectTotalContents2(String keyword) {
		
		return curationDAO.selectTotalContents2(keyword);
	}


	@Override
	public int getC() {
		
		return curationDAO.selectC();
	}


}
