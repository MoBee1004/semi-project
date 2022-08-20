package com.spring_movie.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring_movie.dao.AdminDao;
import com.spring_movie.dao.MovieDao;
import com.spring_movie.dto.MemberDto;
import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

@Service
public class AdminService {

private String savePath="C:\\spring-workspace\\spring_movie\\src\\main\\webapp\\resources\\mprofileUpLoad";
	
	private ModelAndView mav;
	
	@Autowired
	MovieDao mvdao;
	
	@Autowired
	private AdminDao adao;
		
	@Autowired
	HttpSession session;

	public ModelAndView getMovieInfo() {
		ModelAndView mav =new ModelAndView();
		ArrayList<MovieDto> mdtoList= mvdao.selectMovieList();
		mav.addObject("mdtoList",mdtoList);
		mav.setViewName("admin/AdminMovie");
		return mav;
	}

	public String toggleState(int state, String mvcode) {
		System.out.println("Service실행");
		String Result ="";
		int updateResult=adao.toggleState(state,mvcode);
		System.out.println("updateResult"+updateResult);
		if(updateResult >0) {
			System.out.println("업데이트 성공");
			Result="OK";
		}else {
			System.out.println("업데이트 실패(AdminService)");
			Result="FAIL";
		}
		return Result;
	}

	public ModelAndView adminModifyMovie(MovieDto movie,RedirectAttributes ra) {
		ModelAndView mav =new ModelAndView();
		int updateRusult = adao.adminModifyMovie(movie);
		if(updateRusult > 0) {
			String msg = "영화 정보 수정 완료";
			ra.addFlashAttribute("msg",msg);
			mav.setViewName("redirect:/adminMoviePage");
		}
		return mav;
	}

	public ModelAndView adminTheaterPage() {
		ModelAndView mav =new ModelAndView();
		ArrayList<TheaterDto> theaterList = adao.getTheaterList();
		mav.addObject("theaterList",theaterList);
		mav.setViewName("admin/AdminTheater");
		return mav;
	}

	public String adminModifyTheater(TheaterDto theater) {
		ModelAndView mav =new ModelAndView();
		String result="";
		Gson gson = new Gson();
		int updateResult = adao.adminModifyTheater(theater);
		System.out.println("업뎃준비 theater:"+theater);
		if(updateResult>0) {
			System.out.println("극장정보 업데이트 성공");
			result=gson.toJson(theater);
		}else {
			System.out.println("극장정보 업데이트 실패");
		}
		return result;
	}

	public String toggleThState(String thcode, int state) {
		System.out.println("Service실행");
		String Result ="";
		int updateResult=adao.toggleThState(thcode,state);
		System.out.println("updateResult"+updateResult);
		if(updateResult >0) {
			System.out.println("업데이트 성공");
			Result="OK";
		}else {
			System.out.println("업데이트 실패(AdminService)");
			Result="FAIL";
		}
		return Result;
	
	}

	public ModelAndView adminSchedulePage() {
		ModelAndView mav =new ModelAndView();
		ArrayList<MovieDto> movieList = adao.getMovieList();
		ArrayList<TheaterDto> theaterList = adao.getTheaterList();
		mav.addObject("movieList",movieList);
		mav.addObject("theaterList",theaterList);
		mav.setViewName("admin/AdminSchedule");
		return mav;
		
		
	}

	public String getrecentroomtime_ajax(ScheduleDto scdto) {
		ArrayList<ScheduleDto> scdtoList= adao.getrecentroomtime_ajax(scdto);
		
		Gson gson = new Gson();
		String result=gson.toJson(scdtoList);
		return result;
	}

	public ModelAndView insertScdata(ScheduleDto schedule,RedirectAttributes ra) {
		ModelAndView mav =new ModelAndView();		
		System.out.println(schedule.getScdateList().length);
		String date = schedule.getScdate();
		for(int i= 0; i<schedule.getScdateList().length; i++) {
			
			System.out.println(schedule.getScdateList()[i]);
			schedule.setScroom(schedule.getScdateList()[i].split("관")[0]+"관");
			schedule.setScdate(date+" "+schedule.getScdateList()[i].split("관")[1]);
			System.out.println(schedule);
			int insertResult = adao.insertScdata(schedule);
			if (insertResult>0) {
				System.out.println("insert 성공");
			}
		}
		String msg = "스케쥴 등록 완료";
		ra.addFlashAttribute("msg",msg);
		mav.setViewName("redirect:/adminSchedulePage");
		return mav;
	}

	public ModelAndView adminMemberPage() {
		ModelAndView mav =new ModelAndView();
		ArrayList<MemberDto> memberList= adao.getMemberList();
		mav.addObject("memberList",memberList);
		mav.setViewName("admin/AdminMember");
		return mav;
	}

	public String changeState(int inputState,String inputMid) {
		String result ="";
		int updateResult=adao.changeState(inputState,inputMid);
		System.out.println("updateResult:"+updateResult);
		if(updateResult>0) {
			result="OK";
		}
		
		
		System.out.println("result:"+result);
		return result;
	}
	
	
	
}
