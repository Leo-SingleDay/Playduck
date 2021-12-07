package com.duck.playduck.md.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class mOrder {

	private int o_no;
	private int m_no;
	private int d_no;
	private int o_quan;
	private Date o_date;
	private int o_status;
	private int w_no;
	private String o_name;
	private String o_phone;
	private String o_address;
	private String o_memo;
	
}
