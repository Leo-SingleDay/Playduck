package com.duck.playduck.curation.model.dao;

import java.util.List;
import java.util.Map;

import com.duck.playduck.curation.model.vo.Curation;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;

public interface CurationDAO {

	int insertCuration(Curation curation);

	int selectTotalCuration();

	List<Curation> selectCurationList(int cPage, int numPerPage);

	List<Curation> selectCurationList1(int cPage, int numPerPage);

	List<Curation> selectCurationList2(int cPage, int numPerPage);

	List<Bookmark> selectBookList(int m_no);

	Curation curationSelectOne(int c_no);

	int curationUpdate(Curation curation);

	int curationDelete(int c_no);

	List<Map<String, String>> selectSearchList(String keyword, int cPage, int numPerPage);

	int selectTotalContents2(String keyword);

	int selectC();



//	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

}
