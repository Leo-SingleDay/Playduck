package com.duck.playduck.play.model.compare;

import java.util.Comparator;

import com.duck.playduck.play.model.vo.PlayAll;

public class AscCount implements Comparator<PlayAll> {

	
	@Override
	public int compare(PlayAll o1, PlayAll o2) {
		
		int result = o2.getP_count() - o1.getP_count();
		
		return result;
	}
	
	
}
