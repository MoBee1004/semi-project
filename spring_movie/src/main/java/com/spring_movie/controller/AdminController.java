package com.spring_movie.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;
import com.spring_movie.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	HttpSession session;
	
	private ModelAndView mav;
	
	@Autowired
	AdminService adsvc;
	
	@RequestMapping(value = "/chooseAdminPage")
	public String  chooseAdminPage() {
		System.out.println("chooseAdminPage 요청" );


		return "admin/ChooseMain";
	}	
	
	@RequestMapping(value = "/adminMainpage")
	public ModelAndView  adminMainpage(String inputPw) {
		System.out.println("adminMainpage 요청" );
		ModelAndView mav =new ModelAndView();		
		String adminCheckString = (String)(session.getAttribute("Admin"));
		System.out.println("adminCheckString"+adminCheckString);
		if(adminCheckString == null) {
			System.out.println("세션값 null");
			
			String pw="1234";
			if(pw.equals(inputPw)) {
				session.setAttribute("Admin", "Admin");
				mav.setViewName("/AdminMain") ;
			}else {
				mav.setViewName("redirect:/") ;
			}
		}else {
			System.out.println("세션값 있음");
			mav.setViewName("/AdminMain");
			
		}
		
		return mav;
	}	
	
	@RequestMapping(value = "/adminMoviePage")
	public ModelAndView  adminMoviePage() {
		System.out.println("adminMoviePage 요청" );
		ModelAndView mav =new ModelAndView();
		mav = adsvc.getMovieInfo();
		return mav;
	}	
			
	@RequestMapping(value = "/toggleState_ajax")
	public @ResponseBody String toggleState_ajax(@RequestParam("state") int state, @RequestParam("mvcode") String mvcode) {
		System.out.println("toggleState 요청 state값:"+state+"mvcode:"+mvcode);
		
		String Result =adsvc.toggleState(state,mvcode);
		return Result;
	}	
	
	@RequestMapping(value = "/adminModifyMovie")
	public ModelAndView  adminModifyMovie(MovieDto movie,RedirectAttributes ra) {
		System.out.println("adminModifyMovie 요청 _movie:" +movie);
		ModelAndView mav =new ModelAndView();
		mav = adsvc.adminModifyMovie(movie,ra);
		return mav;
	}
	
	@RequestMapping(value = "/adminTheaterPage")
	public ModelAndView  adminTheaterPage() {
		System.out.println("adminTheaterPage 요청");
		ModelAndView mav =new ModelAndView();
		mav = adsvc.adminTheaterPage();
		return mav;
	}
	
	@RequestMapping(value = "/adminModifyTheater")
	public @ResponseBody String  adminModifyTheater(TheaterDto theater) {
		System.out.println("adminModifyTheater:" +theater);
		
		String Result = adsvc.adminModifyTheater(theater);
		return Result;
	}
	
	@RequestMapping(value = "/toggleThState_ajax")
	public @ResponseBody String toggleThState_ajax(@RequestParam("thcode") String thcode,@RequestParam("state") int state ) {
		System.out.println("toggleState 요청 state값:"+state+"thcode:"+state);
		
		String Result =adsvc.toggleThState(thcode,state);
		return Result;
	}	
	
	@RequestMapping(value = "/adminSchedulePage")
	public ModelAndView  adminSchedulePage() {
		System.out.println("adminSchedulePage 요청");
		ModelAndView mav =new ModelAndView();
		mav = adsvc.adminSchedulePage();
		return mav;
	}
	
	@RequestMapping(value = "/getrecentroomtime_ajax")
	public @ResponseBody String getrecentroomtime_ajax(ScheduleDto scdto) {
		System.out.println("getrecentroomtime_ajax 요청 scdto값:"+scdto);
		
		String Result =adsvc.getrecentroomtime_ajax(scdto);
		return Result;
	}
	
	@RequestMapping(value = "/insertScdata")
	public ModelAndView  insertScdata(ScheduleDto schedule,RedirectAttributes ra) {
		System.out.println("insertScdata 요청");
		ModelAndView mav =new ModelAndView();
		mav = adsvc.insertScdata(schedule,ra);
		return mav;
	}
	
	@RequestMapping(value = "/adminMemberPage")
	public ModelAndView  adminMemberPage() {
		System.out.println("adminMemberPage 요청");
		ModelAndView mav =new ModelAndView();
		mav = adsvc.adminMemberPage();
		return mav;
	}
	
	@RequestMapping(value = "/changeState")
	public @ResponseBody String changeState(int inputState, String inputMid) {
		System.out.println("changeState 요청 inputState값:"+inputState+"/inputMid:"+inputMid);
		
		String Result =adsvc.changeState(inputState,inputMid);
		System.out.println(Result);
		return Result;
	}
	
	
}
