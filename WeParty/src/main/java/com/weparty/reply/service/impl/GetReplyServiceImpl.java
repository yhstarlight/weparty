package com.weparty.reply.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.reply.dao.ReplyDAO;
import com.weparty.reply.service.GetReplyService;
import com.weparty.reply.vo.AllReplyVO;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

@Service
public class GetReplyServiceImpl implements GetReplyService {
	
	@Autowired
	private ReplyDAO replyDao;

	@Override
	public List<FreeReplyVO> getFreeReplyList(int free_board_no) {
		return this.replyDao.getFreeReplyList(free_board_no);
	}
	
	@Override
	public List<InfoReplyVO> getInfoReplyList(int info_board_no) {
		return this.replyDao.getInfoReplyList(info_board_no);
	}

	@Override
	public List<AllReplyVO> getUserAllReplyList(AllReplyVO vo) {
		return this.replyDao.getUserAllReplyList(vo);
	}

	@Override
	public int userAllReplyCount(String user_id) {
		return this.replyDao.userAllReplyCount(user_id);
	}

}
