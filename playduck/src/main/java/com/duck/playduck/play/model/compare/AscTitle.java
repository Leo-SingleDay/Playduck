package com.duck.playduck.play.model.compare;

import java.util.Comparator;

import com.duck.playduck.play.model.vo.PlayAll;

public class AscTitle implements Comparator<PlayAll> {

	@Override
	public int compare(PlayAll o1, PlayAll o2) {
		
		int result = o1.getPrfnm().compareTo(o2.getPrfnm());
		
		return result;
	}

}
