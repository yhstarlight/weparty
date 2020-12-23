package com.weparty.contest.service;

public interface DeleteContestService {
	
	void deleteApproveContest(int approve_no);
	
	void deleteCancelContest(int cancel_no);
	
	void DeleteWaitContest(int wait_no);
}
