package com.duck.playduck.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review implements Serializable{

	private int r_no;
	private String p_no;
	private int m_no;
	private String r_content;
	private int r_good;
	private int r_bad;
	private String r_status;
	private String m_name;
	private String m_pic;
	private String m_picrenamed;
	
}
