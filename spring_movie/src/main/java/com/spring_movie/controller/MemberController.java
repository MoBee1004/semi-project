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

import com.spring_movie.dto.MemberDto;
import com.spring_movie.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	HttpSession session;
	
	private ModelAndView mav;
	
	@Autowired
	private MemberService msvc;
	
	
	@RequestMapping(value = "/memberJoinForm")
	public String memberJoinForm() {
		System.out.println("회원가입 페이지 이동요청");
		return "member/MemberJoinForm";
	}


	@RequestMapping(value = "/memberLoginForm")
	public String memberLoginForm() {
		System.out.println("로그인 페이지 이동요청");
		return "member/MemberLoginForm";
	}
	
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		
		System.out.println("회원가입 요청");
		System.out.println(member);

		mav = msvc.memberJoin(member);

		return mav;
	}
	
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberJoinForm(String inputId) {
		System.out.println("아이디 중복확인 요청");
		System.out.println("입력한 아이디:"+inputId);
		String idCheckResult = msvc.memberIdCheck(inputId);
		System.out.println(idCheckResult);		
		return idCheckResult;
	}
	
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(MemberDto member,RedirectAttributes ra) {
		System.out.println("로그인 아이디 확인 요청");
		System.out.println("입력한 내용:"+member);
		mav = msvc.memberLogin(member,ra);
		return mav;
	}

	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		mav = msvc.memberLogout(ra);
		return mav;
	}
	
	
	@RequestMapping(value = "/memberView")
	public ModelAndView memberView() {
		mav=new ModelAndView();
		System.out.println("내정보 페이지 요청");
		String mid= (String)(session.getAttribute("loginId"));
		System.out.println("로그인 아이디 값 :" + mid);
		if(mid.length() != 0) {
		mav = msvc.memberView(mid);
		}
		return mav;
	}	
	
	@RequestMapping(value = "/memberKaKaoLogin")
	public ModelAndView  memberKaKaoLogin(@RequestParam("kakaoId") String kakaoId,@RequestParam("kakaoNickname") String kakaoNickname,@RequestParam("kakaoEmail") String kakaoEmail,@RequestParam("kakaoProfile") String kakaoProfile ) {
		System.out.println("memberKaKaoLogin 요청, 넘어온 데이터:" + kakaoId + kakaoNickname + kakaoEmail + kakaoProfile);
		ModelAndView mav =new ModelAndView();
		mav=msvc.kakaologin(kakaoId,kakaoNickname,kakaoEmail,kakaoProfile);


		return mav;
	}	
}
