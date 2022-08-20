package com.spring_movie.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dto.ReservationDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.service.MovieService;

@Controller
public class MovieController {
	
	
	@Autowired
	private MovieService mvsvc;

	@Autowired
	HttpSession session;
	
	
	
	//----------------------CGV크롤링-----------------------
	
	@RequestMapping(value="/getCgvMovieList")
	public ModelAndView getCgvMovieList() throws IOException {
		
		ModelAndView mav = mvsvc.getCgvMovieList();
		
		return mav;
	}
	
	//--------------------영화목록페이지----------------------------
	@RequestMapping(value="/movieList")
	public ModelAndView MovieList() {
		System.out.println("영화목록 페이지 이동요청");
		ModelAndView mav = mvsvc.MovieList();		
		return mav;
	}
	
	
	
	@RequestMapping(value="/movieView")
	public ModelAndView movieView(@RequestParam("mvcode") String mvcode) {
		System.out.println("영화상세보기 이동요청 mvcode:"+mvcode);
		ModelAndView mav = mvsvc.MovieView(mvcode);
		
		return mav;
	}
	
	@RequestMapping(value="/movieReservationPage")
	public ModelAndView movieReservationPage() {		
		
		System.out.println("영화예매 페이지 이동요청");
		ModelAndView mav = mvsvc.movieReservationPage();
		
		return mav;
	}
	
	@RequestMapping(value="/movieReservation")
	public ModelAndView movieReservation(String remvcode,RedirectAttributes ra) {
		if(remvcode==null) {
			remvcode="";
		}
		ra.addFlashAttribute("remvcode",remvcode);
		
		ModelAndView mav =new ModelAndView();
		mav.setViewName("redirect:/movieReservationPage");
		return mav;
	}
	
	
	@RequestMapping(value="/getThList")
	public  @ResponseBody String getThList(String mvcode) {
		System.out.println("극장목록요청");
		String thList_json = mvsvc.getThList(mvcode);
		return thList_json;
	}
	
	
	@RequestMapping(value="/getScDateList")
	public  @ResponseBody String getCsDateList(@RequestParam("mvcode") String mvcode, @RequestParam("thcode") String thcode) {
		System.out.println("날짜목록 요청");
		System.out.println("넘어온 파라메터 mvcode: "+mvcode+",thcode:"+thcode);
		
		String result=mvsvc.getCsDateList(mvcode,thcode);
		return result;
	}
	
	
	@RequestMapping(value="/getScRoomTimeList")
	public  @ResponseBody String getScRoomTimeList(@RequestParam("mvcode") String mvcode, @RequestParam("thcode") String thcode, @RequestParam("scdate") String scdate) {
		System.out.println("상영관,시간 요청");
		System.out.println("넘어온 파라메터 mvcode: "+mvcode+",thcode:"+thcode+"scdate"+scdate);
		
		String result=mvsvc.getScRoomTimeList(mvcode,thcode,scdate);
		return result;
	}
	
	

	@RequestMapping(value="/insertReservation")
	public ModelAndView insertReservation(ReservationDto rdto,RedirectAttributes ra) {
		System.out.println("insertReservation요청");
		ModelAndView mav =new ModelAndView();
		mav = mvsvc.insertReservation(rdto,ra);
		return mav;
	}
	
	@RequestMapping(value="/movieReservationInfoPage")
	public ModelAndView movieReservationInfoPage(RedirectAttributes ra) {
		System.out.println("예매내역요청 Controller");
		ModelAndView mav =new ModelAndView();
		String mid= (String)(session.getAttribute("loginId"));
		System.out.println("로그인 된 아이디: "+mid);
		mav = mvsvc.movieReservationInfoPage(mid,ra);
		
		return mav;
	}	
	
	@RequestMapping(value="/deleteReserv")
	public ModelAndView deleteReserv(String recode,RedirectAttributes ra) {
		System.out.println("예매삭제요청 Controller");
		ModelAndView mav =new ModelAndView();
		System.out.println("요청한 recode: "+recode);
		mav = mvsvc.deleteReserv(recode,ra);
		return mav;
	}	
	
	@RequestMapping(value="/insertReview")
	public ModelAndView insertReview(ReviewDto review,RedirectAttributes ra) {
		System.out.println("관람평 입력 요청, 넘어온 데이터:"+review);
		ModelAndView mav =mvsvc.insertReview(review,ra);
		
		return mav;
	}	
	
	@RequestMapping(value="/getcomentInfo")
	public  @ResponseBody String getcomentInfo(String recode) {
		System.out.println("/getcomentInfo 요청, 넘어온 데이터:"+recode);
		String result =mvsvc.getcomentInfo(recode);
		
		return result;
	}	
	

	@RequestMapping(value="/updateReview")
	public ModelAndView  updateReview(ReviewDto modiReview,RedirectAttributes ra,@RequestParam("checkView") int checkView) {
		System.out.println("updateReview 요청, 넘어온 데이터:"+modiReview);
		ModelAndView mav =new ModelAndView();

		mav =mvsvc.updateReview(modiReview,ra,checkView);
		return mav;
	}	
	
	@RequestMapping(value="/getSearchMovieList")
	public ModelAndView  getSearchMovieList(String inputWord) {
		System.out.println("getSearchMovieList 요청, 넘어온 데이터:"+inputWord);
		ModelAndView mav =new ModelAndView();

		mav =mvsvc.getSearchMovieList(inputWord);
		return mav;
	}	
	
	

	
}
