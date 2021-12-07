package com.duck.playduck.md.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class mReward {
	private int w_no;
	private int m_no;
	private int w_up;
	private int w_down;
	
	
	public mReward(int m_no, int w_down) {
		super();
		this.m_no = m_no;
		this.w_down = w_down;
	}
	

}




