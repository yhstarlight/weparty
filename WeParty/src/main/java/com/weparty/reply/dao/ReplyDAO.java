package com.weparty.reply.dao;

import java.util.List;

import com.weparty.reply.vo.AllReplyVO;
import com.weparty.reply.vo.FreeReplyVO;
import com.weparty.reply.vo.InfoReplyVO;

public interface ReplyDAO {

	void insertFreeReply(FreeReplyVO vo);

	List<FreeReplyVO> getFreeReplyList(int free_board_no);

	void deleteFreeReply(int free_reply_no);

	void updateFreeReply(FreeReplyVO vo);

	void insertInfoReply(InfoReplyVO vo);

	List<InfoReplyVO> getInfoReplyList(int info_board_no);

	void deleteInfoReply(int info_reply_no);

	void updateInfoReply(InfoReplyVO vo);

	List<AllReplyVO> getUserAllReplyList(AllReplyVO vo);

	int userAllReplyCount(String user_id);
	
	
}
