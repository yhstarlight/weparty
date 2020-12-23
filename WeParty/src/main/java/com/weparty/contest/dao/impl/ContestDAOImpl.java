package com.weparty.contest.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.contest.dao.ContestDAO;
import com.weparty.contest.vo.AllContestVO;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

@Repository
public class ContestDAOImpl implements ContestDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AllContestVO> getAllContestList(AllContestVO vo) {
		return this.sqlSession.selectList("all_contest.getAllContestList",vo);
	}

	@Override
	public int allContestCount() {
		return this.sqlSession.selectOne("all_contest.allContestCount");
	}
	
	@Override
	public void insertCancelContest(CancelContestVO vo) {
		this.sqlSession.insert("cancel_contest.insertCancelContest",vo);
	}

	@Override
	public List<CancelContestVO> getCancelContestList(CancelContestVO vo) {
		return this.sqlSession.selectList("cancel_contest.getCancelContestList",vo);
	}

	@Override
	public int cancelContestCount() {
		return this.sqlSession.selectOne("cancel_contest.cancelContestCount");
	}

	@Override
	public CancelContestVO getCancelContestContent(int cancel_no) {
		return this.sqlSession.selectOne("cancel_contest.getCancelContestContent",cancel_no);
	}

	@Override
	public void deleteCancelContest(int cancel_no) {
		this.sqlSession.delete("cancel_contest.deleteCancelContest",cancel_no);
	}
	
	@Override
	public void insertApproveContest(ApproveContestVO vo) {
		this.sqlSession.insert("approve_contest.insertApproveContest",vo);
	}

	@Override
	public List<ApproveContestVO> getApproveContestList(ApproveContestVO vo) {
		return this.sqlSession.selectList("approve_contest.getApproveContestList",vo);
	}

	@Override
	public int approveContestCount(ApproveContestVO vo) {
		return this.sqlSession.selectOne("approve_contest.approveContestCount",vo);
	}

	@Override
	public ApproveContestVO getApproveContestContent(int approve_no) {
		return this.sqlSession.selectOne("approve_contest.getApproveContestContent",approve_no);
	}

	@Override
	public void deleteApproveContest(int approve_no) {
		this.sqlSession.delete("approve_contest.deleteApproveContest",approve_no);
	}
	
	@Override
	public void insertWaitContest(WaitContestVO vo) {
		this.sqlSession.insert("wait_contest.insertWaitContest", vo);
	}

	@Override
	public List<WaitContestVO> getWaitContestList(WaitContestVO vo) {
		return this.sqlSession.selectList("wait_contest.getWaitContestList",vo);
	}

	@Override
	public int getCountList() {
		return this.sqlSession.selectOne("wait_contest.getCountList");
	}

	@Override
	public WaitContestVO getContestContent(int wait_no) {
		return this.sqlSession.selectOne("wait_contest.getContestContent",wait_no);
	}

	@Override
	public void DeleteWaitContest(int wait_no) {
		this.sqlSession.delete("wait_contest.deleteWaitContest",wait_no);
	}

	@Override
	public List<AllContestVO> getUserAllContestList(AllContestVO vo) {
		return this.sqlSession.selectList("all_contest.getUserAllContestList",vo);
	}

	@Override
	public int userAllContestCount(String user_id) {
		return this.sqlSession.selectOne("all_contest.userAllContestCount",user_id);
	}

	@Override
	public void updateApproveContestHit(ApproveContestVO vo) {
		this.sqlSession.update("approve_contest.updateApproveContestHit",vo);	}

}
