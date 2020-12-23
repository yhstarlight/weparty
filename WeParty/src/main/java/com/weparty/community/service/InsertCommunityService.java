package com.weparty.community.service;

import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

public interface InsertCommunityService {

	void insertFreeBoard(FreeBoardVO vo);
	
	void insertInfoBoard(InfoBoardVO vo);
}
