package com.spring_movie.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.servlet.ModelAndView;

import com.spring_movie.dto.MemberDto;
import com.spring_movie.dto.MovieDto;

public interface MemberDao {

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MBIRTH, MEMAIL, MADDRESS, MPROFILE, MSTATE) "
			+ "VALUES(#{mid},#{mpw},#{mname},TO_DATE(#{mbirth},'YYYY-MM-DD'),#{memail},#{maddress},#{mprofile},#{mstate})")
	int insertMember(MemberDto member);

	
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{inputId}")
	String selectMemberId(String inputId);


	@Select("SELECT MID, MPROFILE,MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto memberLogin(MemberDto member);

	@Select("SELECT MID,MPW,MNAME,TO_CHAR(MBIRTH,'YYYY-MM-DD') AS MBIRTH, MEMAIL, MADDRESS,MPROFILE FROM MEMBERS WHERE MID = #{mid}")
	MemberDto memberView(String mid);
	
	MemberDto searchMemberId(String kakaoId);


	int insertKakaoAccount(@Param("kakaoId") String kakaoId, @Param("kakaoNickname") String kakaoNickname, @Param("kakaoEmail") String kakaoEmail, @Param("kakaoProfile") String kakaoProfile);
	

}
