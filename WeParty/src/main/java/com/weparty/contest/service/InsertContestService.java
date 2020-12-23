package com.weparty.contest.service;

import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

public interface InsertContestService {
	
	//approve
	void InsertApproveContest(ApproveContestVO vo);
	
	//wait
	void insertWaitContest(WaitContestVO vo);
	
	//cancel
	void insertCancelContest(CancelContestVO vo);
}
