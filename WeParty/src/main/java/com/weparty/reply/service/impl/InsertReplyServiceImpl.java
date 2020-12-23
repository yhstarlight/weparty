package com.weparty.reply.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.reply.dao.ReplyDAO;
import com.weparty.reply.service.InsertReplyService;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

@Service
public class InsertReplyServiceImpl implements InsertReplyService {

	@Autowired
	private ReplyDAO ReplyDao;
	
	@Override
	public void insertFreeReply(FreeReplyVO vo) {
		this.ReplyDao.insertFreeReply(vo);
	}

	@Override
	public void insertInfoReply(InfoReplyVO vo) {
		this.ReplyDao.insertInfoReply(vo);
	}
}
