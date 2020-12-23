package com.weparty.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.community.dao.BoardDAO;
import com.weparty.community.service.DeleteCommunityService;

@Service
public class DeleteCommunityServiceImpl implements DeleteCommunityService {

	
	@Autowired
	private BoardDAO BoardDao;
	
	@Override
	public void deleteFreeBoard(int free_board_no) {
		this.BoardDao.deleteFreeBoard(free_board_no);
	}
	
	@Override
	public void deleteInfoBoard(int info_board_no) {
		this.BoardDao.deleteInfoBoard(info_board_no);
	}
	
}
