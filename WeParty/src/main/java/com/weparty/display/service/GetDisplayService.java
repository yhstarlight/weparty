package com.weparty.display.service;

import java.util.List;

import com.weparty.display.vo.DisplayVO;

public interface GetDisplayService {
	List<DisplayVO> getDisplayList();
	
	String getDisplayPosterPath(int display_no);
	
}