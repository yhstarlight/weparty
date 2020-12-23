package com.weparty.reply.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.reply.dao.ReplyDAO;
import com.weparty.reply.service.UpdateReplyService;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

@Service
public class UpdateReplyServiceImpl implements UpdateReplyService {
	
	@Autowired
	private ReplyDAO ReplyDao;

	@Override
	public void updateFreeReply(FreeReplyVO vo) {
		this.ReplyDao.updateFreeReply(vo);
	}
	
	@Override
	public void updateInfoReply(InfoReplyVO vo) {
		this.ReplyDao.updateInfoReply(vo);
	}

}
