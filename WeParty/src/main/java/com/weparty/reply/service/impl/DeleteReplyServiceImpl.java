package com.weparty.reply.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.reply.dao.ReplyDAO;
import com.weparty.reply.service.DeleteReplySerivce;

@Service
public class DeleteReplyServiceImpl implements DeleteReplySerivce {
	
	@Autowired
	private ReplyDAO ReplyDao;

	@Override
	public void deleteFreeReply(int free_reply_no) {
		this.ReplyDao.deleteFreeReply(free_reply_no);
	}
	
	@Override
	public void deleteInfoReply(int info_reply_no) {
		this.ReplyDao.deleteInfoReply(info_reply_no);
	}

}
