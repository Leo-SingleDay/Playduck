package com.duck.playduck.orders.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders implements Serializable{

	private int o_no;
	private int m_no;
	private int d_no;
	private int o_quan;
	private Date o_date;
	private String o_status;
	
}
