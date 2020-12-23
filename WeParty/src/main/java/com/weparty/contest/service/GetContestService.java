package com.weparty.contest.service;

import java.util.List;

import com.weparty.contest.vo.AllContestVO;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

public interface GetContestService {
	
	//all
	List<AllContestVO> getAllContestList(AllContestVO vo);
	
	List<AllContestVO> getUserAllContestList(AllContestVO vo);
	
	int allContestCount();
	
	int userAllContestCount(String user_d);
	
	//wait
	List<WaitContestVO> getWaitContestList(WaitContestVO vo);
	
	int getCountList();
	
	WaitContestVO getContestContent(int wait_no);
	
	//approve
	List<ApproveContestVO> getApproveContestList(ApproveContestVO vo);
	
	int ApproveContestCount(ApproveContestVO vo);
	
	ApproveContestVO getApproveContestContent(int approve_no);
	
	//cancel
	List<CancelContestVO> getCancelContestList(CancelContestVO vo);
	
	int cancelContestCount();
	
	CancelContestVO getCancelContestContent(int cancel_no);

}
