package com.weparty.contest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.contest.dao.ContestDAO;
import com.weparty.contest.service.DeleteContestService;

@Service
public class DeleteContestServiceImpl implements DeleteContestService {

	@Autowired
	private ContestDAO ContestDao;
	
	@Override
	public void DeleteWaitContest(int wait_no) {
		this.ContestDao.DeleteWaitContest(wait_no);
	}
	
	@Override
	public void deleteCancelContest(int cancel_no) {
		this.ContestDao.deleteCancelContest(cancel_no);
	}
	
	@Override
	public void deleteApproveContest(int approve_no) {
		this.ContestDao.deleteApproveContest(approve_no);
	}

}
