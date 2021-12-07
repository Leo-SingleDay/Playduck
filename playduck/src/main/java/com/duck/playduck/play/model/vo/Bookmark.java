package com.duck.playduck.play.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Bookmark implements Serializable {
	

	private static final long serialVersionUID = 1021L;
	
	private int m_no;
	private String p_list;
	private String c_list;
	
	
}
