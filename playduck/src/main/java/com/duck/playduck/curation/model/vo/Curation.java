package com.duck.playduck.curation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Curation {

	private int c_no;
	private int m_no;
	private String c_title;
	private String c_content;
	private Date c_date;
	private String c_pic;
	private String c_picrenamed;
	private String m_name;
	
}
