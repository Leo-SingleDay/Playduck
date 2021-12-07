package com.duck.playduck.orders.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BuyList implements Serializable {
	private String m_name;
	private String d_title;
	private int d_no;
	private int d_price;
	private String d_pic;
	private int o_quan;
	private int o_no;
	private Date o_date;
	private int total;
	private int w_down;
	private int o_status;
}
