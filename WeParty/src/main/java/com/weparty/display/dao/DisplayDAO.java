package com.weparty.display.dao;

import java.util.List;

import com.weparty.display.vo.DisplayVO;

public interface DisplayDAO {

	void insertDisplay(DisplayVO vo);

	List<DisplayVO> getDisplayList();

	void deleteDisplay(int display_no);

	String getDisplayPosterPath(int display_no);

	void updateDisplay(DisplayVO vo);

}
