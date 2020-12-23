package com.weparty.community.service;

import java.util.List;

import com.weparty.community.vo.AllBoardVO;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

public interface GetCommunityService {
	
	//all
	List<AllBoardVO> getAllBoardList(AllBoardVO vo);
	
	int getTotalCount(String id);
	
	//info
	List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo);
	
	int getInfoBoardCount(InfoBoardVO vo);
	
	InfoBoardVO getInfoBoardContent(int info_board_no);
	
	//free
	List<FreeBoardVO> getFreeboardList(FreeBoardVO vo);
	
	int getFreeBoardCount(FreeBoardVO vo);

	FreeBoardVO getFreeboardContent(int free_board_no);
	
	List<FreeBoardVO> getMyFreeboardList(FreeBoardVO vo);
	
	int getMyBoardCount(String board_writer_id);
}
