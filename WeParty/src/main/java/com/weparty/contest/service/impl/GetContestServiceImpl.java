package com.weparty.contest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.contest.dao.ContestDAO;
import com.weparty.contest.service.GetContestService;
import com.weparty.contest.vo.AllContestVO;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

@Service
public class GetContestServiceImpl implements GetContestService {
	
	@Autowired
	private ContestDAO contestDao;

	@Override
	public List<AllContestVO> getAllContestList(AllContestVO vo) {
		return this.contestDao.getAllContestList(vo);
	}

	@Override
	public int allContestCount() {
		return this.contestDao.allContestCount();
	}
	
	@Override
	public List<ApproveContestVO> getApproveContestList(ApproveContestVO vo) {
		return this.contestDao.getApproveContestList(vo);
	}

	@Override
	public int ApproveContestCount(ApproveContestVO vo) {
		return this.contestDao.approveContestCount(vo);
	}

	@Override
	public ApproveContestVO getApproveContestContent(int approve_no) {
		return this.contestDao.getApproveContestContent(approve_no);
	}
	
	@Override
	public List<CancelContestVO> getCancelContestList(CancelContestVO vo) {
		return this.contestDao.getCancelContestList(vo);
	}

	@Override
	public int cancelContestCount() {
		return this.contestDao.cancelContestCount();
	}

	@Override
	public CancelContestVO getCancelContestContent(int cancel_no) {
		return this.contestDao.getCancelContestContent(cancel_no);
	}
	
	@Override
	public List<WaitContestVO> getWaitContestList(WaitContestVO vo) {
		return this.contestDao.getWaitContestList(vo);
	}

	@Override
	public int getCountList() {
		return this.contestDao.getCountList();
	}

	@Override
	public WaitContestVO getContestContent(int wait_no) {
		return this.contestDao.getContestContent(wait_no);
	}

	@Override
	public List<AllContestVO> getUserAllContestList(AllContestVO vo) {
		return this.contestDao.getUserAllContestList(vo);
	}

	@Override
	public int userAllContestCount(String user_id) {
		return this.contestDao.userAllContestCount(user_id);
	}


}
