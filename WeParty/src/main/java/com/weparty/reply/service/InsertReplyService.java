package com.weparty.reply.service;

import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

public interface InsertReplyService {
	void insertFreeReply(FreeReplyVO vo);
	
	void insertInfoReply(InfoReplyVO vo);
}
