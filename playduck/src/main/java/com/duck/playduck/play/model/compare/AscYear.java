package com.duck.playduck.play.model.compare;

import java.util.Comparator;

import com.duck.playduck.play.model.vo.PlayAll;

public class AscYear implements Comparator<PlayAll> {

	@Override
	public int compare(PlayAll o1, PlayAll o2) {
		
		int result = o2.getPrfpdfrom().compareTo(o1.getPrfpdfrom());
		
		return result;
	}

}
