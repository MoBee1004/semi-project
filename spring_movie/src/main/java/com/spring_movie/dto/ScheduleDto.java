package com.spring_movie.dto;

import lombok.Data;

@Data
public class ScheduleDto {
	
	private String scroom;
	private String scdate;
	private String scdate_after;
	private String sctime;
	private String scthcode;
	private String scmvcode;
	private String[] scdateList;
	private String mvname;
	private String mvposter;

}
