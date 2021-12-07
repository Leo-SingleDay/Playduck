package com.duck.playduck.play.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.play.model.dao.PlayDAO;
import com.duck.playduck.play.model.vo.Bookmark;
import com.duck.playduck.play.model.vo.Play;
import com.duck.playduck.play.model.vo.PlayAll;
import com.duck.playduck.play.model.vo.PlayElement;



@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	PlayDAO playDAO;


	@Override
	public int selectTotalContents() {
		// TODO Auto-generated method stub
		return playDAO.selectTotalContents();
	}




	@Override
	public List<PlayAll> selectPlayList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return playDAO.selectPlayList(cPage,numPerPage);
	}




	@Override
	public List<PlayAll> playsr(int cPage, int numPerPage,String text) {
		// TODO Auto-generated method stub
		return playDAO.playsr(cPage,numPerPage,text);
	}




	@Override
	public List<Bookmark> selectBlist(int m_no) {
		// TODO Auto-generated method stub
		return playDAO.selectBlist(m_no);
	}




	@Override
	public int playsrtotal(String text) {
		// TODO Auto-generated method stub
		return playDAO.playsrtotal(text);
	}




	





	
	
	
}
