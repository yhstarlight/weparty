package com.weparty.reply.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.reply.dao.ReplyDAO;
import com.weparty.reply.vo.AllReplyVO;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertFreeReply(FreeReplyVO vo) {
		this.sqlSession.insert("free_reply.insertFreeReply",vo);
	}

	@Override
	public List<FreeReplyVO> getFreeReplyList(int free_board_no) {
		return this.sqlSession.selectList("free_reply.getFreeReplyList",free_board_no);
	}

	@Override
	public void deleteFreeReply(int free_reply_no) {
		this.sqlSession.delete("free_reply.deleteFreeReply",free_reply_no);
	}

	@Override
	public void updateFreeReply(FreeReplyVO vo) {
		this.sqlSession.update("free_reply.updateFreeReply",vo);
	}
	
	@Override
	public void insertInfoReply(InfoReplyVO vo) {
		this.sqlSession.insert("info_reply.insertInfoReply",vo);
	}

	@Override
	public List<InfoReplyVO> getInfoReplyList(int info_board_no) {
		return this.sqlSession.selectList("info_reply.getInfoReplyList",info_board_no);
	}

	@Override
	public void deleteInfoReply(int info_reply_no) {
		this.sqlSession.delete("info_reply.deleteInfoReply",info_reply_no);
	}

	@Override
	public void updateInfoReply(InfoReplyVO vo) {
		this.sqlSession.update("info_reply.updateInfoReply",vo);
	}

	@Override
	public List<AllReplyVO> getUserAllReplyList(AllReplyVO vo) {
		return this.sqlSession.selectList("all_reply.getUserAllReplyList",vo);
	}

	@Override
	public int userAllReplyCount(String user_id) {
		return this.sqlSession.selectOne("all_reply.userAllReplyCount",user_id);
	}

}
