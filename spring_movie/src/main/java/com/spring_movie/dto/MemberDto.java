package com.spring_movie.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {

	private String mid;
	private String mpw;
	private String mname;
	private String mbirth;
	private String memail;
	private String maddress;
	private String mpost;
	private String maddr;
	private String mdetailaddr;
	private String mextraaddr;
	private String mprofile; 
		
	private MultipartFile mfile; 
	private int mstate;
	

}
