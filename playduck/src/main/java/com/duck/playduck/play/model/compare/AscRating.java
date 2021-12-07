package com.duck.playduck.play.model.compare;

import java.util.Comparator;

import com.duck.playduck.play.model.vo.PlayAll;

public class AscRating implements Comparator<PlayAll> {

	@Override
	public int compare(PlayAll o1, PlayAll o2) {
		
		int result = o2.getP_rating() - o1.getP_rating();
		
		return result;
	}
}
