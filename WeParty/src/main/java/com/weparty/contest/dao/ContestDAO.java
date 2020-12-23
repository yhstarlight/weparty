package com.weparty.contest.dao;

import java.util.List;

import com.weparty.contest.vo.AllContestVO;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

public interface ContestDAO {

	//all
	
	List<AllContestVO> getAllContestList(AllContestVO vo);

	int allContestCount();

	//wait
	
	void insertWaitContest(WaitContestVO vo);
	
	List<WaitContestVO> getWaitContestList(WaitContestVO vo);

	int getCountList();

	WaitContestVO getContestContent(int wait_no);

	void DeleteWaitContest(int wait_no);

	//cancel
	
	void insertCancelContest(CancelContestVO vo);

	List<CancelContestVO> getCancelContestList(CancelContestVO vo);

	int cancelContestCount();

	CancelContestVO getCancelContestContent(int cancel_no);

	void deleteCancelContest(int cancel_no);

	List<AllContestVO> getUserAllContestList(AllContestVO vo);

	int userAllContestCount(String user_id);

	void updateApproveContestHit(ApproveContestVO vo);
	
	
	//approve
	
	void insertApproveContest(ApproveContestVO vo);

	List<ApproveContestVO> getApproveContestList(ApproveContestVO vo);

	int approveContestCount(ApproveContestVO vo);

	ApproveContestVO getApproveContestContent(int approve_no);

	void deleteApproveContest(int approve_no);
}
