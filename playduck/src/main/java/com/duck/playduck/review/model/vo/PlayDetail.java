package com.duck.playduck.review.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlayDetail implements Serializable{

	private int r_no;
	private String p_no;
	private int pd_theater;
	private int pd_story;
	private int pd_producing;
	private int pd_casting;
	private int avg_pd_theater;
	private int avg_pd_story;
	private int avg_pd_producing;
	private int avg_pd_casting;
	
	public PlayDetail(int avg_pd_theater, int avg_pd_story, int avg_pd_producing, int avg_pd_casting) {
		super();
		this.avg_pd_theater = avg_pd_theater;
		this.avg_pd_story = avg_pd_story;
		this.avg_pd_producing = avg_pd_producing;
		this.avg_pd_casting = avg_pd_casting;
	}
	
	
}
