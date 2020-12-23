package com.weparty.community.service;

import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

public interface UpdateCommunityService {
	void updateFreeboardHit(int free_board_no);
	
	void updateFreeboard(FreeBoardVO vo);

	void updateInfoBoardHit(int info_board_no);
	
	void updateInfoBoard(InfoBoardVO vo);
}
