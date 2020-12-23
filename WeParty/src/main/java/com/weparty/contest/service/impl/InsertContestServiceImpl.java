package com.weparty.contest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.contest.dao.ContestDAO;
import com.weparty.contest.service.InsertContestService;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

@Service
public class InsertContestServiceImpl implements InsertContestService {
	
	@Autowired
	private ContestDAO ContestDao;

	@Override
	public void InsertApproveContest(ApproveContestVO vo) {
		this.ContestDao.insertApproveContest(vo);
	}

	@Override
	public void insertCancelContest(CancelContestVO vo) {
		this.ContestDao.insertCancelContest(vo);
	}
	
	@Override
	public void insertWaitContest(WaitContestVO vo) {
		this.ContestDao.insertWaitContest(vo);
	}
	
}
