package com.weparty.reply.service;

import java.util.List;

import com.weparty.reply.vo.AllReplyVO;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

public interface GetReplyService {
	List<FreeReplyVO> getFreeReplyList(int free_board_no);
	
	List<InfoReplyVO> getInfoReplyList(int info_board_no);
	
	List<AllReplyVO> getUserAllReplyList(AllReplyVO vo);
	
	int userAllReplyCount(String user_id);
}
