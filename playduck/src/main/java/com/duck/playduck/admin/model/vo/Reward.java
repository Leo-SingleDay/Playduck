package com.duck.playduck.admin.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reward implements Serializable {
	String m_no;
	String m_name;
	int m_status;
	int point;
}
