package com.weparty.contest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.contest.dao.ContestDAO;
import com.weparty.contest.service.UpdateContestService;
import com.weparty.contest.vo.ApproveContestVO;

@Service
public class UpdateContestServiceImpl implements UpdateContestService {
	
	@Autowired
	private ContestDAO contestDao;

	@Override
	public void updateApproveContestHit(ApproveContestVO vo) {
		this.contestDao.updateApproveContestHit(vo);
	}

}
