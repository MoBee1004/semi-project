package com.spring_movie.dto;

import lombok.Data;

@Data
public class MovieDto {
	
	private String mvcode;		//영화코드
	private String mvname;		//영화제목
	private String mvpd;		//영화감독
	private String mvactor;		//배우
	private String mvgenre;		//장르
	private String mvage;		//관람연령
	private String mvtime;		//시간
	private String mvopen;		//개봉일
	private String mvposter;	//포스터
	
	private int thumbsup; 		//추천수
	private int thumbsdown;		//비추천수
	
	private double reRate;     	//예매율 

	private int mvstate;		//활성/비활성여부
}
