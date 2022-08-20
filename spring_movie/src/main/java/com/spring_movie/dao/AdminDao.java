package com.spring_movie.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_movie.dto.MemberDto;
import com.spring_movie.dto.MovieDto;
import com.spring_movie.dto.ScheduleDto;
import com.spring_movie.dto.TheaterDto;

public interface AdminDao {

	int toggleState(@Param("state") int state, @Param("mvcode") String mvcode);

	int adminModifyMovie(MovieDto movie);

	ArrayList<TheaterDto> getTheaterList();

	int adminModifyTheater(TheaterDto theater);

	int toggleThState(@Param("thcode") String thcode, @Param("state") int state);

	ArrayList<MovieDto> getMovieList();

	ArrayList<ScheduleDto> getrecentroomtime_ajax(ScheduleDto scdto);

	int insertScdata(ScheduleDto schedule);

	ArrayList<MemberDto> getMemberList();

	int changeState(@Param("inputState") int inputState,@Param("inputMid") String inputMid);



	
	
}
