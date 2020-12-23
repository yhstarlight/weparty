package com.weparty.community.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.community.dao.BoardDAO;
import com.weparty.community.service.GetCommunityService;
import com.weparty.community.vo.AllBoardVO;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

@Service
public class GetCommunityServiceImpl implements GetCommunityService {

	@Autowired
	private BoardDAO boardDao;
	
	@Override
	public List<AllBoardVO> getAllBoardList(AllBoardVO vo) {
		return this.boardDao.getAllBoardList(vo);
	}

	@Override
	public int getTotalCount(String id) {
		return this.boardDao.getTotalCount(id);
	}
	
	@Override
	public List<FreeBoardVO> getFreeboardList(FreeBoardVO vo) {
		return this.boardDao.getFreeBoardList(vo);
	}
	
	@Override
	public int getFreeBoardCount(FreeBoardVO vo) {
		return this.boardDao.getFreeBoardCount(vo);
	}

	@Override
	public FreeBoardVO getFreeboardContent(int free_board_no) {
		return this.boardDao.getFreeBoardContent(free_board_no);
	}

	@Override
	public List<FreeBoardVO> getMyFreeboardList(FreeBoardVO vo) {
		return this.boardDao.getMyFreeBoardList(vo);
	}

	@Override
	public int getMyBoardCount(String board_writer_id) {
		return this.boardDao.getMyBoardCount(board_writer_id);
	}
	
	@Override
	public List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo) {
		return this.boardDao.getInfoBoardList(vo);
	}

	@Override
	public int getInfoBoardCount(InfoBoardVO vo) {
		return this.boardDao.getInfoBoardCount(vo);
	}

	@Override
	public InfoBoardVO getInfoBoardContent(int info_board_no) {
		return this.boardDao.getInfoBoardContent(info_board_no);
	}

}
