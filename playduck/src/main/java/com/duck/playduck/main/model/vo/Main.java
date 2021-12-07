package com.duck.playduck.main.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Main implements Serializable{

	private String p_no;
	private int p_good;
	private int p_bad;
}
