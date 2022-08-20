package com.spring_movie.dao;

import com.spring_movie.dto.SampleDto;

public interface SampleDao {

	int insertLocData(String strRow);

	SampleDto selectLocData();

}
