package com.duck.playduck.md.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Basket {
	
	private int m_no;
	private int d_no;
	private int b_quan;
	private int b_status;
	
	public Basket(int m_no, int d_no, int b_quan) {
		super();
		this.m_no = m_no;
		this.d_no = d_no;
		this.b_quan = b_quan;
	}




	
	
 
	
}
