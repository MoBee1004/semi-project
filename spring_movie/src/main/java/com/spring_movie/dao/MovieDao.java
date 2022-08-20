package com.spring_movie.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ReservInfoDto;
import com.spring_movie.dto.ReservationDto;
import com.spring_movie.dto.ReviewDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

public interface MovieDao {

	@Select("SELECT COUNT(*) FROM MOVIES WHERE MVNAME = #{mvname} AND MVOPEN = #{mvopen}")
	int mvSearch(@Param("mvname") String mvnameCheck, @Param("mvopen")String mvopenCheck);

	@Select("SELECT MAX(MVCODE) FROM MOVIES")
	String maxMvCode();

	@Insert("INSERT INTO MOVIES VALUES(#{mvcode},#{mvname},#{mvpd},#{mvactor}, "
			+ "#{mvgenre},#{mvage},#{mvtime},#{mvopen},#{mvposter},0)")
	int insertMovie(MovieDto movieDto);

	
	ArrayList<MovieDto> selectMovieList();

	
	MovieDto mvView(String mvcode);

	ArrayList<MovieDto> slelctReserveMvList();

	ArrayList<TheaterDto> getThList(String mvcode);

	ArrayList<ScheduleDto> getCsDateList(@Param("mvcode") String mvcode, @Param("thcode") String thcode);

	ArrayList<ScheduleDto> getScRoomTimeList(@Param("mvcode") String mvcode, @Param("thcode") String thcode, @Param("scdate") String scdate);

	String getReservationRecode();

	int insertReservation(ReservationDto rdto);

	ArrayList<ReservInfoDto> selectReservation(String remid);

	int deleteReserv(String recode);
	
	ReservInfoDto selectReservation2(String recode);

	int insertReview(ReviewDto review);

	ReviewDto getreviewcheck(String revinforecode);

	ReviewDto getcomentInfo(String recode);

	int updateReview(ReviewDto modiReview);

	ArrayList<ReviewDto> getrvList(String mvcode);

	MovieDto getthumb(String mvcode);

	double getreRate(String mvcode);

	ArrayList<MovieDto> getSearchMovieList(String inputWord);

	ArrayList<MovieDto> getSearchMovieListSC(String inputWord);

	
	
}
