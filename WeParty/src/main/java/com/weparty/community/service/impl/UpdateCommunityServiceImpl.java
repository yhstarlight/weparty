package com.weparty.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.community.dao.BoardDAO;
import com.weparty.community.service.UpdateCommunityService;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

@Service
public class UpdateCommunityServiceImpl implements UpdateCommunityService {

	@Autowired
	private BoardDAO BoardDao;
	
	@Override
	public void updateFreeboardHit(int free_board_no) {
		this.BoardDao.updateFreeboardHit(free_board_no);
	}
	
	@Override
	public void updateFreeboard(FreeBoardVO vo) {
		this.BoardDao.updateFreeBoard(vo);
	}

	@Override
	public void updateInfoBoardHit(int info_board_no) {
		this.BoardDao.updateInfoBoardHit(info_board_no);
	}

	@Override
	public void updateInfoBoard(InfoBoardVO vo) {
		this.BoardDao.updateInfoBoard(vo);
	}
}
