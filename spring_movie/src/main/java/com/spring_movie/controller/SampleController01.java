package com.spring_movie.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring_movie.service.SampleService;

@Controller	
public class SampleController01 {
	
	@Autowired
	SampleService ssvc;
	
	private ModelAndView mav;
	
	@RequestMapping(value = "/sampleTest01Page")
	public String sampleTest01Page() {
		System.out.println("sampleTest01Page 페이지 이동요청");
		return "map/SampleTest01";
	}
	@RequestMapping(value = "/sampleTest02Page")
	public String sampleTest02Page() {
		System.out.println("sampleTest02Page 페이지 이동요청");
		return "map/SampleTest02";
	}
	
	@RequestMapping(value = "/sampleTest03Page")
	public ModelAndView sampleTest03Page() {
		System.out.println("sampleTest03Page 페이지 이동요청");
		mav= ssvc.sampleTest03Page();
		
		
		return mav;
	}

	
	@RequestMapping(value="/saveTest_ajax")
	public  @ResponseBody String getThList(String senddata) {
		System.out.println("senddata"+senddata);
		return senddata;
	}
	
	@RequestMapping(value="/testMapLocation_ajax")
	public  @ResponseBody String testMapLocation_ajax(String strRow) {
		System.out.println("senddata"+strRow);
		int insertResult=ssvc.insertLocData(strRow);
		String result = ""+insertResult;
		return result;
	}
}
