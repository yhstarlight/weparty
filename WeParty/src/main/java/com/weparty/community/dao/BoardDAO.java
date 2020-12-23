package com.weparty.community.dao;

import java.util.List;

import com.weparty.community.vo.AllBoardVO;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

public interface BoardDAO {

	//all
	List<AllBoardVO> getAllBoardList(AllBoardVO vo);

	int getTotalCount(String id);
	
	//free
	void insertFreeBoard(FreeBoardVO vo);
	
	List<FreeBoardVO> getFreeBoardList(FreeBoardVO vo);

	int getFreeBoardCount(FreeBoardVO vo);

	void updateFreeboardHit(int free_board_no);

	FreeBoardVO getFreeBoardContent(int free_board_no);

	void updateFreeBoard(FreeBoardVO vo);

	void deleteFreeBoard(int free_board_no);
	
	List<FreeBoardVO> getMyFreeBoardList(FreeBoardVO vo);
	
	int getMyBoardCount(String free_board_writer_id);
	
	//info
	void insertInfoBoard(InfoBoardVO vo);
	
	List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo);

	int getInfoBoardCount(InfoBoardVO vo);

	InfoBoardVO getInfoBoardContent(int info_board_no);

	void updateInfoBoardHit(int info_board_no);

	void updateInfoBoard(InfoBoardVO vo);

	void deleteInfoBoard(int info_board_no);

}
