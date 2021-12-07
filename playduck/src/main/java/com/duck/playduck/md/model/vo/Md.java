package com.duck.playduck.md.model.vo;

import com.duck.playduck.play.model.vo.Play;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Md {

	private int d_no;
	private String p_no;
	private String d_title;
	private int d_price;
	private String d_pic;
	private String d_detail;
	private int b_quan;
	private int b_status;
	private int reward;
	
	
	
	
}
