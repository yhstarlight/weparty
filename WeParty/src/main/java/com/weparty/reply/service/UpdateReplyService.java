package com.weparty.reply.service;

import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

public interface UpdateReplyService {
	void updateFreeReply(FreeReplyVO vo);
	
	void updateInfoReply(InfoReplyVO vo);
}
