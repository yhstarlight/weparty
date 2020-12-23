package com.weparty.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.community.dao.BoardDAO;
import com.weparty.community.service.InsertCommunityService;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;


@Service
public class InsertCommunityServiceImpl implements InsertCommunityService {
	
	@Autowired
	private BoardDAO BoardDao;

	@Override
	public void insertFreeBoard(FreeBoardVO vo) {
		this.BoardDao.insertFreeBoard(vo);
	}
	
	@Override
	public void insertInfoBoard(InfoBoardVO vo) {
		this.BoardDao.insertInfoBoard(vo);
	}

}
