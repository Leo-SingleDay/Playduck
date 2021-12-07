package com.duck.playduck.play.model.service;

import java.util.List;

import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.play.model.vo.PlayAll;
import com.duck.playduck.play.model.vo.PlayElement;

public interface PlayService {

	

	List<PlayAll> selectPlayList(int cPage, int numPerPage);

	

	int selectTotalContents();



	List<PlayAll> playsr(int cPage, int numPerPage, String text);



	List<Bookmark> selectBlist(int m_no);



	int playsrtotal(String text);







	

	

}
