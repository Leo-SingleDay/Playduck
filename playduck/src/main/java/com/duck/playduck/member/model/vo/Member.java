package com.duck.playduck.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private int m_no;
	private String m_id;
	private String m_name;
	private String m_pwd;
	private String m_gender;
	private Date m_date;
	private String m_phone;
	private String m_email;
	private String m_address;
	private String m_status;
	private Date m_enrolldate;
	private String m_pic;
	private String m_picRenamed;
	private String[] m_genre;
	
	
	
	
}
