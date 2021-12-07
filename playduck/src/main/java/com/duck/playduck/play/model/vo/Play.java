package com.duck.playduck.play.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Play implements Serializable {
	

	private static final long serialVersionUID = 1002L;
	private String p_no;
	private int p_good;
	private int p_bad;
	private int p_rating;
	
}
