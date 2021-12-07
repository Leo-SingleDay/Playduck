package com.duck.playduck.play.model.dao;

import java.util.List;

import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.play.model.vo.PlayAll;
import com.duck.playduck.play.model.vo.PlayElement;

public interface PlayDAO {

	int selectTotalContents();
	List<PlayAll> selectPlayList(int cPage, int numPerPage);
	List<PlayAll> playsr(int cPage, int numPerPage, String text);
	List<Bookmark> selectBlist(int m_no);
	int playsrtotal(String text);
	


}
