package com.spring_movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.spring_movie.dao.SampleDao;
import com.spring_movie.dto.SampleDto;

@Service
public class SampleService {
	
	private ModelAndView mav;
	
	@Autowired
	SampleDao sdao;
	
	public int insertLocData(String strRow) {
		
		int insertResult = sdao.insertLocData(strRow);
		return insertResult;
	}

	public ModelAndView sampleTest03Page() {
		mav= new ModelAndView();
		System.out.println("sampleTest03Page Service이동");
		SampleDto locData = sdao.selectLocData();
		System.out.println("locData"+locData);
		mav.addObject("locData",locData);
		mav.setViewName("map/SampleTest03");
		return mav;
	}
	
	
	
	
}
