package com.spring_movie.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie.dao.MemberDao;
import com.spring_movie.dto.MemberDto;

@Service
public class MemberService {
	//저장경로 설정
	private String savePath="C:\\spring-workspace\\spring_movie\\src\\main\\webapp\\resources\\mprofileUpLoad";
	
	private ModelAndView mav;
	
	@Autowired
	private MemberDao mdao;
		
	@Autowired
	HttpSession session;

	//session.setAttribute("loginId", loginId);
	
	
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("MemverService.memberJoin()");
		String address ="";
		address =member.getMpost()+"-"+member.getMaddr()+"-"+member.getMdetailaddr()+"-"+member.getMextraaddr();
		member.setMaddress(address);
		
		MultipartFile mfile = member.getMfile();
		String mprofile = "";
		//파일저장 파일이름
		System.out.println( mfile.isEmpty() );
		if(!mfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();		
			//파일명 생성
			mprofile = uuid.toString()+"_"+mfile.getOriginalFilename();
			//프로필 이미지 파일 저장
			mfile.transferTo( new File(savePath, mprofile) );
		}
		
		
		System.out.println("mprofile: "+mprofile);
		member.setMprofile(mprofile);
		//파일을 저장
		
		//회원가입 처리
		int joinResult = mdao.insertMember(member);
		System.out.println(member);
		/* mav.setViewName("Main"); */
		mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberIdCheck() 호출");
		
		String idCheckResult= mdao.selectMemberId(inputId);
		return idCheckResult;
	}

	
	//로그인 기능
	public ModelAndView memberLogin(MemberDto member,RedirectAttributes ra) {
		String getId = "";
		String getfilename ="";
		
		MemberDto member1 = mdao.memberLogin(member);
		mav = new ModelAndView();
		if(member1 != null) {
			
			if(member1.getMstate()==0 || member1.getMstate()==2) {
				System.out.println("로그인 성공");
				getId = member1.getMid();
				getfilename = member1.getMprofile();
				session.setAttribute("loginId", getId);
				session.setAttribute("loginProfile", getfilename);
				mav.setViewName("Main");	
			}else if(member1.getMstate()==1 || member1.getMstate()==3){
				System.out.println("로그인 실패");
				ra.addFlashAttribute("msg","정지된 아이디입니다."); 
				mav.setViewName("redirect:/memberLoginForm");
			}
			
			

		}else {
			System.out.println("로그인 실패");
			ra.addFlashAttribute("msg","아이디,또는 비밀번호가 일치하지 않습니다."); 
			mav.setViewName("redirect:/memberLoginForm");
		}

		return mav;
	}

	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 서비스 이동");
		mav = new ModelAndView();
		session.invalidate();
		ra.addFlashAttribute("msg","로그아웃 되었습니다.");		
		mav.setViewName("redirect:/");
		return mav;
	}

	public ModelAndView memberView(String mid) {
		System.out.println("내정보 서비스 이동");
		mav = new ModelAndView();
		MemberDto member = new MemberDto();
		member = mdao.memberView(mid);
		System.out.println(member);
		
		if ( member.getMaddress() != null) {
		String[] addr_arr= member.getMaddress().split("-");
		if(addr_arr.length == 4) {
		 member.setMpost(member.getMaddress().split("-")[0]);
		 member.setMaddr(member.getMaddress().split("-")[1]);
		 member.setMdetailaddr(member.getMaddress().split("-")[2]);
		 member.setMextraaddr(member.getMaddress().split("-")[3]);
		}
		member.setMaddress(member.getMaddress().replaceFirst("-", ") "));
		member.setMaddress(member.getMaddress().replace("-", " "));
		}
		  mav.addObject("member",member);
		  System.out.println("나눈 주소 나눈 후 내용:"+ member);
		mav.setViewName("member/MemberView");
		return mav;
	}
	
	public ModelAndView kakaologin(String kakaoId, String kakaoNickname, String kakaoEmail, String kakaoProfile) {
		mav =new ModelAndView();
		MemberDto memberInfo= mdao.searchMemberId(kakaoId);
		System.out.println("아이디로 찾은 객체 memberInfo:"+memberInfo);
		
		if(memberInfo !=null ) {
			
			session.setAttribute("kakao", "kakao");
			session.setAttribute("loginId", memberInfo.getMid());
			session.setAttribute("loginProfile", memberInfo.getMprofile());
			
			
		}else {
			
			int insertResult= mdao.insertKakaoAccount(kakaoId,kakaoNickname,kakaoEmail,kakaoProfile);
			if(insertResult>0) {
			session.setAttribute("kakao", "kakao");
			session.setAttribute("loginId", kakaoId);
			session.setAttribute("loginProfile", kakaoProfile);
			}
			
		}
		
		mav.setViewName("redirect:/");
		return mav;
	}

	
}
